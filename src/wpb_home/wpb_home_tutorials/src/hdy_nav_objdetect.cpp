#include <ros/ros.h>
#include <move_base_msgs/MoveBaseAction.h>
#include <actionlib/client/simple_action_client.h>
#include <tf/tf.h>
#include <tf/transform_listener.h>
#include <visualization_msgs/Marker.h>
#include <object_detect.h>

typedef actionlib::SimpleActionClient<move_base_msgs::MoveBaseAction> MoveBaseClient_my;

geometry_msgs::PoseStamped goal;
move_base_msgs::MoveBaseGoal goalpoint;
bool Callback_flag = false;
bool obj_flag = false;
//extern void ProcCloudCB(const sensor_msgs::PointCloud2 &input);
//extern void DrawBox(float inMinX, float inMaxX, float inMinY, float inMaxY, float inMinZ, float inMaxZ, float inR, float inG, float inB);
//extern void DrawText(std::string inText, float inScale, float inX, float inY, float inZ, float inR, float inG, float inB);
//extern void DrawPath(float inX, float inY, float inZ);
//extern void RemoveBoxes();

void ProcCloudCB(const sensor_msgs::PointCloud2 &input)
{
    ROS_INFO("ProcCloudCB");
    //to footprint
    sensor_msgs::PointCloud2 pc_footprint;
    tf_listener->waitForTransform("/base_footprint", input.header.frame_id, input.header.stamp, ros::Duration(5.0));  //return value always  false!
    pcl_ros::transformPointCloud("/base_footprint", input, pc_footprint, *tf_listener);

    //source cloud
    pcl::PointCloud<pcl::PointXYZRGB> cloud_src;
    pcl::fromROSMsg(pc_footprint , cloud_src);
    //ROS_INFO("cloud_src size = %d",cloud_src.size()); 
    pcl::PointCloud<pcl::PointXYZRGB>::Ptr cloud_source_ptr;
    cloud_source_ptr = cloud_src.makeShared(); 
    
    //process
    //printf ("Cloud: width = %d, height = %d\n", msg->width, msg->height);
    pcl::PointCloud<pcl::PointXYZRGB>::Ptr plane(new pcl::PointCloud<pcl::PointXYZRGB>);
    pcl::PointCloud<pcl::PointXYZRGB>::Ptr convexHull(new pcl::PointCloud<pcl::PointXYZRGB>);
    pcl::PointCloud<pcl::PointXYZRGB>::Ptr objects(new pcl::PointCloud<pcl::PointXYZRGB>);

    // Get the plane model, if present.
    pcl::ModelCoefficients::Ptr coefficients(new pcl::ModelCoefficients);
    pcl::SACSegmentation<pcl::PointXYZRGB> segmentation;
    segmentation.setInputCloud(cloud_source_ptr);
    segmentation.setModelType(pcl::SACMODEL_PLANE);
    segmentation.setMethodType(pcl::SAC_RANSAC);
    segmentation.setDistanceThreshold(0.005);
    segmentation.setOptimizeCoefficients(true);
    pcl::PointIndices::Ptr planeIndices(new pcl::PointIndices);
    segmentation.segment(*planeIndices, *coefficients);
    ROS_INFO_STREAM("1_Planes: " << planeIndices->indices.size());
    pcl::ExtractIndices<pcl::PointXYZRGB> extract;

    ////////////////////////////////////////////////////////////////////////////
    pcl::PointCloud<pcl::PointXYZRGB>::Ptr cloud_f (new pcl::PointCloud<pcl::PointXYZRGB>);
    int i = 0, nr_points = (int) cloud_source_ptr->points.size ();
    // While 30% of the original cloud is still there
    while (cloud_source_ptr->points.size () > 0.03 * nr_points)
    {
        // Segment the largest planar component from the remaining cloud
        segmentation.setInputCloud (cloud_source_ptr);
        segmentation.segment (*planeIndices, *coefficients);
        if (planeIndices->indices.size () == 0)
        {
            ROS_WARN("Could not estimate a planar model for the given dataset.");
            break;
        }

        // Extract the planeIndices
        extract.setInputCloud (cloud_source_ptr);
        extract.setIndices (planeIndices);
        extract.setNegative (false);
        extract.filter (*plane);
        float plane_height = plane->points[0].z;
        ROS_WARN("%d - plana: %d points. height =%.2f" ,i, plane->width * plane->height,plane_height);
        if(plane_height > 0.6 && plane_height < 0.85) 
        break;

        // Create the filtering object
        extract.setNegative (true);
        extract.filter (*cloud_f);
        cloud_source_ptr.swap (cloud_f);
        i++;
    }

    if (planeIndices->indices.size() == 0)
        std::cout << "Could not find a plane in the scene." << std::endl;
    else
    {
        // Copy the points of the plane to a new cloud.
        extract.setInputCloud(cloud_source_ptr);
        extract.setIndices(planeIndices);
        extract.filter(*plane);

        // Retrieve the convex hull.
        pcl::ConvexHull<pcl::PointXYZRGB> hull;
        hull.setInputCloud(plane);
        // Make sure that the resulting hull is bidimensional.
        hull.setDimension(2);
        hull.reconstruct(*convexHull);

        // Redundant check.
        if (hull.getDimension() == 2)
        {
            // Prism object.
            pcl::ExtractPolygonalPrismData<pcl::PointXYZRGB> prism;
            prism.setInputCloud(cloud_source_ptr);
            prism.setInputPlanarHull(convexHull);
            prism.setHeightLimits(-0.30, -0.05); //height limit objects lying on the plane
            pcl::PointIndices::Ptr objectIndices(new pcl::PointIndices);

            // Get and show all points retrieved by the hull.
            prism.segment(*objectIndices);
            extract.setIndices(objectIndices);
            extract.filter(*objects);
            segmented_objects.publish(objects);
            segmented_plane.publish(plane); 

            // run clustering extraction on "objects" to get several pointclouds
            pcl::search::KdTree<pcl::PointXYZRGB>::Ptr tree (new pcl::search::KdTree<pcl::PointXYZRGB>);
            pcl::EuclideanClusterExtraction<pcl::PointXYZRGB> ec;
            std::vector<pcl::PointIndices> cluster_indices;
            ec.setClusterTolerance (0.05);//设置邻近搜索半径为5厘米
            ec.setMinClusterSize (800);//设置一个聚类所需要的最少点数目为800
            ec.setMaxClusterSize (10000000);//设置一个聚类所需要的最大点数目为800
            ec.setSearchMethod (tree);//设置点云的搜索机制
            ec.setInputCloud (objects);
            ec.extract (cluster_indices);//从点云中提取聚类，并将点云索引保存到cluster_indices中

            pcl::ExtractIndices<pcl::PointXYZRGB> extract_object_indices;//创建滤波对象
            std::vector<pcl::PointCloud<pcl::PointXYZRGB> > objectf;
            cv::Mat element;

            RemoveBoxes();
            int nObjCnt = 0;
            for(int i = 0; i<cluster_indices.size(); ++i)
            {
                pcl::PointCloud<pcl::PointXYZRGB>::Ptr object_cloud (new pcl::PointCloud<pcl::PointXYZRGB>);
                extract_object_indices.setInputCloud(objects);
                extract_object_indices.setIndices(boost::make_shared<const pcl::PointIndices>(cluster_indices[i]));
                extract_object_indices.filter(*object_cloud);
                objectf.push_back(*object_cloud);

                bool bFirstPoint = true;
                for (int j = 0; j < object_cloud->points.size(); j++) //找出团簇中的最大和最小长宽高
                {
                    pcl::PointXYZRGB p = object_cloud->points[j];
                    if(bFirstPoint == true)
                    {
                        boxMarker.xMax = boxMarker.xMin = p.x;
                        boxMarker.yMax = boxMarker.yMin = p.y;
                        boxMarker.zMax = boxMarker.zMin = p.z;
                        bFirstPoint = false;
                    }

                    if(p.x < boxMarker.xMin) { boxMarker.xMin = p.x;}
                    if(p.x > boxMarker.xMax) { boxMarker.xMax = p.x;}
                    if(p.y < boxMarker.yMin) { boxMarker.yMin = p.y;}
                    if(p.y > boxMarker.yMax) { boxMarker.yMax = p.y;}
                    if(p.z < boxMarker.zMin) { boxMarker.zMin = p.z;}
                    if(p.z > boxMarker.zMax) { boxMarker.zMax = p.z;}

                }
                if(boxMarker.xMin < 1.5 && boxMarker.yMin > -0.5 && boxMarker.yMax < 0.5)//已识别出物体
                {
                    DrawBox(boxMarker.xMin, boxMarker.xMax, boxMarker.yMin, boxMarker.yMax, boxMarker.zMin, boxMarker.zMax, 0, 1, 0);
                    ROS_INFO("object detected");
                    obj_flag = true;

                    std::ostringstream stringStream;
                    stringStream << "obj_" << nObjCnt;
                    std::string obj_id = stringStream.str();
                    DrawText(obj_id,0.08, boxMarker.xMax,(boxMarker.yMin+boxMarker.yMax)/2,boxMarker.zMax + 0.04, 1,0,1);
                    nObjCnt++;
                    ROS_WARN("[obj_%d] xMin= %.2f yMin = %.2f yMax = %.2f",i,boxMarker.xMin, boxMarker.yMin, boxMarker.yMax);
                } 
            }

        }
        else std::cout << "The chosen hull is not planar." << std::endl;
    }
}
void DrawBox(float inMinX, float inMaxX, float inMinY, float inMaxY, float inMinZ, float inMaxZ, float inR, float inG, float inB)
{
    line_box.header.frame_id = "base_footprint";
    line_box.ns = "line_box";
    line_box.action = visualization_msgs::Marker::ADD;
    line_box.id = 0;
    line_box.type = visualization_msgs::Marker::LINE_LIST;
    line_box.scale.x = 0.005;
    line_box.color.r = inR;
    line_box.color.g = inG;
    line_box.color.b = inB;
    line_box.color.a = 1.0;

    geometry_msgs::Point p;
    p.z = inMinZ;
    p.x = inMinX; p.y = inMinY; line_box.points.push_back(p);
    p.x = inMinX; p.y = inMaxY; line_box.points.push_back(p);

    p.x = inMinX; p.y = inMaxY; line_box.points.push_back(p);
    p.x = inMaxX; p.y = inMaxY; line_box.points.push_back(p);

    p.x = inMaxX; p.y = inMaxY; line_box.points.push_back(p);
    p.x = inMaxX; p.y = inMinY; line_box.points.push_back(p);

    p.x = inMaxX; p.y = inMinY; line_box.points.push_back(p);
    p.x = inMinX; p.y = inMinY; line_box.points.push_back(p);

    p.z = inMaxZ;
    p.x = inMinX; p.y = inMinY; line_box.points.push_back(p);
    p.x = inMinX; p.y = inMaxY; line_box.points.push_back(p);

    p.x = inMinX; p.y = inMaxY; line_box.points.push_back(p);
    p.x = inMaxX; p.y = inMaxY; line_box.points.push_back(p);

    p.x = inMaxX; p.y = inMaxY; line_box.points.push_back(p);
    p.x = inMaxX; p.y = inMinY; line_box.points.push_back(p);

    p.x = inMaxX; p.y = inMinY; line_box.points.push_back(p);
    p.x = inMinX; p.y = inMinY; line_box.points.push_back(p);

    p.x = inMinX; p.y = inMinY; p.z = inMinZ; line_box.points.push_back(p);
    p.x = inMinX; p.y = inMinY; p.z = inMaxZ; line_box.points.push_back(p);

    p.x = inMinX; p.y = inMaxY; p.z = inMinZ; line_box.points.push_back(p);
    p.x = inMinX; p.y = inMaxY; p.z = inMaxZ; line_box.points.push_back(p);

    p.x = inMaxX; p.y = inMaxY; p.z = inMinZ; line_box.points.push_back(p);
    p.x = inMaxX; p.y = inMaxY; p.z = inMaxZ; line_box.points.push_back(p);

    p.x = inMaxX; p.y = inMinY; p.z = inMinZ; line_box.points.push_back(p);
    p.x = inMaxX; p.y = inMinY; p.z = inMaxZ; line_box.points.push_back(p);
    marker_pub.publish(line_box);
}

static int nTextNum = 2;
void DrawText(std::string inText, float inScale, float inX, float inY, float inZ, float inR, float inG, float inB)
{
    text_marker.header.frame_id = "base_footprint";
    text_marker.ns = "line_obj";
    text_marker.action = visualization_msgs::Marker::ADD;
    text_marker.id = nTextNum;
    nTextNum ++;
    text_marker.type = visualization_msgs::Marker::TEXT_VIEW_FACING;
    text_marker.scale.z = inScale;
    text_marker.color.r = inR;
    text_marker.color.g = inG;
    text_marker.color.b = inB;
    text_marker.color.a = 1.0;

    text_marker.pose.position.x = inX;
    text_marker.pose.position.y = inY;
    text_marker.pose.position.z = inZ;
    
    text_marker.pose.orientation=tf::createQuaternionMsgFromYaw(1.0);

    text_marker.text = inText;

    marker_pub.publish(text_marker);
}

void RemoveBoxes()
{
    line_box.action = 3;
    line_box.points.clear();
    marker_pub.publish(line_box);
    line_follow.action = 3;
    line_follow.points.clear();
    marker_pub.publish(line_follow);
    text_marker.action = 3;
    marker_pub.publish(text_marker);
}
void InitGoal()
{
    //move_base_msgs::MoveBaseGoal newWayPoint;
    goalpoint.target_pose.header.frame_id = "map";
    goalpoint.target_pose.header.stamp = ros::Time::now();
    goalpoint.target_pose = goal;
}
void InitOringin()
{
    tf::Quaternion q;

    q.setRPY( 0, 0, 0 );
    
    goalpoint.target_pose.header.frame_id = "map";
    goalpoint.target_pose.header.stamp = ros::Time::now();
    goalpoint.target_pose.pose.position.x = 0.0;
    goalpoint.target_pose.pose.position.y = 0.0;
    goalpoint.target_pose.pose.position.z = 0.0;
    goalpoint.target_pose.pose.orientation.x = q.x();
    goalpoint.target_pose.pose.orientation.y = q.y();
    goalpoint.target_pose.pose.orientation.z = q.z();
    goalpoint.target_pose.pose.orientation.w = q.w();

}

void SendGoal()
{
    MoveBaseClient_my ac_my("move_base", true);
    while(!ac_my.waitForServer(ros::Duration(5.0)))
    {
    if(!ros::ok())
        break;
    ROS_INFO("Waiting for the move_base action server to come up");
    }
    //MoveBaseClient_my ac_my("move_base", true);
    ac_my.sendGoal(goalpoint);

    ac_my.waitForResult();
    if(ac_my.getState() == actionlib::SimpleClientGoalState::SUCCEEDED)
    {
        ROS_INFO("arrived goal");
    }
    else
        ROS_INFO("failed to arrive goal");
}

void poseCallback(const geometry_msgs::PoseStamped::ConstPtr& msg)
{
    goal = *msg;
    //ROS_INFO("target pose:%s", goal1.header);
    ROS_INFO("target pose position_x :%f : ", goal.pose.position.x);
    ROS_INFO("target pose position_y :%f : ", goal.pose.position.y);
    ROS_INFO("target pose position_z :%f : ", goal.pose.position.z);
    ROS_INFO("target pose orientation_x :%f : ", goal.pose.orientation.x);
    ROS_INFO("target pose orientation_y :%f : ", goal.pose.orientation.y);
    ROS_INFO("target pose orientation_z:%f : ", goal.pose.orientation.z);
    ROS_INFO("target pose orientation_w :%f : ", goal.pose.orientation.w);
    Callback_flag = true;

}

bool obj_detect()
{
    ROS_INFO("obj_detect");
    
    tf_listener = new tf::TransformListener(); 

    ros::NodeHandle nh_param("~");
    nh_param.param<std::string>("topic", pc_topic, "/kinect2/qhd/points");

    ros::NodeHandle nh;
    ros::Subscriber pc_sub = nh.subscribe(pc_topic, 10 , ProcCloudCB);

    pc_pub = nh.advertise<sensor_msgs::PointCloud2>("obj_pointcloud",1);
    marker_pub = nh.advertise<visualization_msgs::Marker>("obj_marker", 10);

    segmented_objects = nh.advertise<PointCloud> ("segmented_objects",1);
    segmented_plane = nh.advertise<PointCloud> ("segmented_plane",1);

    ros::spin();

    delete tf_listener; 

    if(obj_flag == 1)
    {
        ROS_INFO("obj_detected done");
        return 1;
    }
    else return 0;

}

int main(int argc, char** argv)
{
    ros::init(argc, argv, "hdy_nav_objdetect");
    ros::NodeHandle n;
    ros::Subscriber subpoint = n.subscribe("/move_base_simple/goal", 1, poseCallback);

    while(ros::ok())
    {
        //ROS_INFO("in the loop");
        if(Callback_flag == true)
        {
            ROS_INFO("message has been received");
            InitGoal();
            SendGoal();
            if(obj_detect())
            {
                ROS_INFO("back");
                InitOringin();
                SendGoal();
            }            
            Callback_flag = false;
        }
        else{}
        ros::spinOnce();
    }
    return 0;

}