#include <ros/ros.h>
#include <pcl_ros/point_cloud.h>
#include <pcl/point_types.h>
#include <boost/foreach.hpp>
#include <pcl/io/pcd_io.h>
#include <pcl/sample_consensus/method_types.h>
#include <pcl/sample_consensus/model_types.h>
#include <pcl/segmentation/sac_segmentation.h>
#include <pcl/filters/extract_indices.h>
#include <pcl/filters/passthrough.h>
#include <pcl/filters/voxel_grid.h>
#include <pcl/filters/voxel_grid.h>  //体素滤波器头文件
#include <pcl/filters/statistical_outlier_removal.h>   //统计滤波器头文件
#include <pcl/filters/conditional_removal.h>    //条件滤波器头文件
#include <pcl/filters/radius_outlier_removal.h>   //半径滤波器头文件
#include <pcl/surface/convex_hull.h>
#include <pcl/segmentation/extract_polygonal_prism_data.h>
#include <pcl/visualization/cloud_viewer.h>
#include <pcl/segmentation/extract_clusters.h>
#include <image_geometry/pinhole_camera_model.h>
#include <cv_bridge/cv_bridge.h>
#include <image_transport/image_transport.h>
#include <opencv2/highgui/highgui.hpp>
#include "opencv2/imgproc/imgproc.hpp"
#include <sensor_msgs/Image.h>
#include <pcl_ros/transforms.h>
#include <sensor_msgs/PointCloud2.h>
#include <pcl_conversions/pcl_conversions.h>
#include <geometry_msgs/PointStamped.h>
#include <tf/transform_listener.h>
#include <visualization_msgs/Marker.h>
#include <wpb_home_behaviors/Coord.h>
#include "highgui.h"
#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include <iostream>
#include <pcl/common/common.h>
#include <pcl/segmentation/region_growing_rgb.h>
using namespace std;

static std::string pc_topic;

static ros::Publisher filter_pub;
static ros::Publisher plane_pub;
static ros::Publisher marker_pub;
static ros::Publisher coord_pub;

sensor_msgs::PointCloud2 pc_filter;
sensor_msgs::PointCloud2 pc_plane;
sensor_msgs::PointCloud2 pc_object;
static tf::TransformListener *tf_listener;

void DrawBox(float inMinX, float inMaxX, float inMinY, float inMaxY, float inMinZ, float inMaxZ, float inR, float inG, float inB);
void DrawText(std::string inText, float inScale, float inX, float inY, float inZ, float inR, float inG, float inB);
void DrawPath(float inX, float inY, float inZ);
void RemoveBoxes();
void SortObjects();
static visualization_msgs::Marker line_box;
static visualization_msgs::Marker line_follow;
static visualization_msgs::Marker text_marker;

typedef pcl::PointCloud<pcl::PointXYZRGB> PointCloud;
static ros::Publisher segmented_objects;
static ros::Publisher segmented_plane;

typedef struct stBoxMarker
{
    float xMax;
    float xMin;
    float yMax;
    float yMin;
    float zMax;
    float zMin;
}stBoxMarker;

static stBoxMarker boxMarker;

typedef struct stObjectDetected
{
    string name;
    float x;
    float y;
    float z;
    float probability;
}stObjectDetected;

static stObjectDetected tmpObj;
static vector<stObjectDetected> arObj;

void callbackPC(const sensor_msgs::PointCloud2 &input)
{
    sensor_msgs::PointCloud2 pc_footprint;
    bool res = tf_listener->waitForTransform("/base_footprint", input.header.frame_id, input.header.stamp, ros::Duration(5.0)); 
    if(res == false)
    {
        return;
    }
    pcl_ros::transformPointCloud("/base_footprint", input, pc_footprint, *tf_listener);

    //source cloud
    pcl::PointCloud<pcl::PointXYZRGB> cloud_src;
    pcl::fromROSMsg(pc_footprint , cloud_src);
    //ROS_INFO("cloud_src size = %d",cloud_src.size()); 
    pcl::PointCloud<pcl::PointXYZRGB>::Ptr cloud_source_ptr;
    cloud_source_ptr = cloud_src.makeShared();     //make_shared 在动态内存中分配一个对象并初始化它，返回指向此对象的shared_ptr

    //直通滤波
    pcl::PointCloud<pcl::PointXYZRGB>::Ptr cloud_after_PassThrough(new pcl::PointCloud<pcl::PointXYZRGB>);

    pcl::PassThrough<pcl::PointXYZRGB> pass;//设置滤波器对象,直通滤波
    pass.setInputCloud (cloud_source_ptr);//设置输入点云

    pass.setFilterFieldName ("z");//设置过滤时所需要点云类型的Z字段
    pass.setFilterLimits (0.2, 1.5);//设置在过滤字段的范围
    pass.filter (*cloud_source_ptr);

    pass.setFilterFieldName ("x");
    pass.setFilterLimits (0.0, 1.8);
    pass.filter (*cloud_source_ptr);

    pass.setFilterFieldName ("y");
    pass.setFilterLimits (-1.5, 1.5);
    pass.filter (*cloud_source_ptr);
 
    //pcl::IndicesPtr indices (new std::vector <int>); //存储点云的容器
    
    //体素滤波器：
    // Create the filtering object
    //pcl::PointCloud<pcl::PointXYZRGB>::Ptr cloud_after_voxelgrid(new pcl::PointCloud<pcl::PointXYZRGB>);//
	pcl::VoxelGrid<pcl::PointXYZRGB> voxelgrid;
    voxelgrid.setInputCloud (cloud_source_ptr);
    voxelgrid.setLeafSize (0.008f, 0.008f, 0.008f);
    voxelgrid.filter (*cloud_source_ptr);
 
    
    //统计滤波器：
    // Create the filtering object
    //pcl::PointCloud<pcl::PointXYZRGB>::Ptr cloud_after_StatisticalRemoval(new pcl::PointCloud<pcl::PointXYZRGB>);
    pcl::StatisticalOutlierRemoval<pcl::PointXYZRGB> Statistical;
    Statistical.setInputCloud (cloud_source_ptr);
    Statistical.setMeanK (50);
    Statistical.setStddevMulThresh (1.0);
    Statistical.filter(*cloud_source_ptr);
/*
    //pcl::search::Search <pcl::PointXYZRGB>::Ptr tree = boost::shared_ptr<pcl::search::Search<pcl::PointXYZRGB> > (new pcl::search::KdTree<pcl::PointXYZRGB>);
    pcl::search::KdTree<pcl::PointXYZRGB>::Ptr tree (new pcl::search::KdTree<pcl::PointXYZRGB>);
    //基于颜色的区域生长分割法
    pcl::RegionGrowingRGB<pcl::PointXYZRGB> reg;
    reg.setInputCloud (cloud_source_ptr);
    reg.setIndices (indices);   //点云的索引
    reg.setSearchMethod (tree);
    reg.setDistanceThreshold (10);  //设置距离阈值，用于判断两点是否是相邻点
    reg.setPointColorThreshold (10);  //点与点之间颜色容差//设置两点颜色阈值，用于判断两点是否属于同一类
    reg.setRegionColorThreshold (5);  //区域之间容差//设置两类区域区域颜色阈值，用于判断两类区域是否聚类合并
    reg.setMinClusterSize (40);       //设置聚类的大小

    std::vector <pcl::PointIndices> clusters;
    reg.extract (clusters);

    pcl::PointCloud <pcl::PointXYZRGB>::Ptr colored_cloud = reg.getColoredCloud ();
    pcl::visualization::CloudViewer viewer ("Cluster viewer");
    viewer.showCloud (colored_cloud);
    while (!viewer.wasStopped ())
    {
        boost::this_thread::sleep (boost::posix_time::microseconds (100));
    }
*/
    /*
    //半径滤波器：
    // build the filter
    pcl::PointCloud<pcl::PointXYZRGB>::Ptr cloud_after_Radius(new pcl::PointCloud<pcl::PointXYZRGB>);
    pcl::RadiusOutlierRemoval<pcl::PointXYZRGB> outrem;
    outrem.setInputCloud(cloud_source_ptr);
    outrem.setRadiusSearch(0.8);
    outrem.setMinNeighborsInRadius (2);
    outrem.filter (*cloud_after_Radius);
    */

    //process
    //printf ("Cloud: width = %d, height = %d\n", msg->width, msg->height);
    pcl::PointCloud<pcl::PointXYZRGB>::Ptr plane(new pcl::PointCloud<pcl::PointXYZRGB>);//指针类型
    pcl::PointCloud<pcl::PointXYZRGB>::Ptr convexHull(new pcl::PointCloud<pcl::PointXYZRGB>);// 计算出图像的凸包，根据图像的轮廓点，通过函数convexhull转化成凸包的点点坐标
    pcl::PointCloud<pcl::PointXYZRGB>::Ptr objects(new pcl::PointCloud<pcl::PointXYZRGB>);

    // Get the plane model, if present.提取出平面
    pcl::ModelCoefficients::Ptr coefficients(new pcl::ModelCoefficients);
    pcl::SACSegmentation<pcl::PointXYZRGB> segmentation;
    segmentation.setInputCloud(cloud_source_ptr);
    segmentation.setModelType(pcl::SACMODEL_PLANE);//所提取目标模型的属性（平面、球、圆柱等等）
    segmentation.setMethodType(pcl::SAC_RANSAC);//采样方法（RANSAC、LMedS等
    segmentation.setDistanceThreshold(0.005);//查询点到目标模型的距离阈值（如果大于此阈值，则查询点不在目标模型上，默认值为0）
    segmentation.setOptimizeCoefficients(true);//可选设置
    Eigen::Vector3f axis = Eigen::Vector3f(0.0,1.0,0.0);
    segmentation.setAxis(axis);//平面平行于y轴，容忍度10
    //segmentation.setEpsAngle(pcl::deg2rad(15));
    segmentation.setEpsAngle(  10.0f * (M_PI/180.0f) );
    pcl::PointIndices::Ptr planeIndices(new pcl::PointIndices);
    segmentation.segment(*planeIndices, *coefficients);//分割操作,输出提取点的索引和目标模型的参数
    ROS_INFO_STREAM("Planes: " << planeIndices->indices.size());
    pcl::ExtractIndices<pcl::PointXYZRGB> extract; //创建点云提取对象

    ////////////////////////////////////////////////////////////////////////////
    pcl::PointCloud<pcl::PointXYZRGB>::Ptr cloud_f (new pcl::PointCloud<pcl::PointXYZRGB>);
    float plane_height;
    int i = 0, nr_points = (int) cloud_source_ptr->points.size ();
    // While 30% of the original cloud is still there
    while (cloud_source_ptr->points.size () > 0.3 * nr_points)    //
    {
        // Segment the largest planar component from the remaining cloud
        segmentation.setInputCloud (cloud_source_ptr);
        segmentation.segment (*planeIndices, *coefficients);
        if (planeIndices->indices.size () == 0)
        {
            ROS_WARN("Could not estimate a planar model for the given dataset.");
            break;
        }

        // Extract the planeIndices从点云中抽取分割的处在平面上的点集
        extract.setInputCloud (cloud_source_ptr);
        extract.setIndices (planeIndices);//设置分割后的内点为需要提取的点集
        extract.setNegative (false);//设置提取内点而非外点
        extract.filter (*plane);//提取输出存储到plane
        plane_height = plane->points[0].z;
        ROS_INFO("%d - plane: %d points. height =%.2f" ,i, plane->width * plane->height,plane_height);
        if(plane_height > 0.5 && plane_height < 0.9) //桌面高度在0.6-0.85之间
        {
            ROS_WARN("Final plane: %d points. height =%.2f" , plane->width * plane->height,plane_height);
            break;
        }

        // Create the filtering object//移去平面局内点，提取剩余点云
        extract.setNegative (true);
        extract.filter (*cloud_f);
        cloud_source_ptr.swap (cloud_f);
        i++;
    }
    //发送平面点云
    pcl::toROSMsg(*plane,pc_plane);
    plane_pub.publish(pc_plane);

    
    pcl::PointXYZRGB min;
    pcl::PointXYZRGB max;
    pcl::getMinMax3D(*plane,min,max);
    //int maxsize = plane -> points.size ();
    //plane_height = plane -> points[maxsize].z;
    float plane_high = max.z;
    ROS_INFO("points. height =%.2f", plane_high);
    pass.setInputCloud (cloud_source_ptr);//设置输入点云
    pass.setFilterFieldName ("z");//设置过滤时所需要点云类型的Z字段
    pass.setFilterLimits (plane_high, 1.5);//设置在过滤字段的范围
    pass.filter (*cloud_source_ptr);
    
    //pcl::StatisticalOutlierRemoval<pcl::PointXYZRGB> Statistical;
    Statistical.setInputCloud (cloud_source_ptr);
    Statistical.setMeanK (100);
    Statistical.setStddevMulThresh (0.8);
    Statistical.filter(*cloud_source_ptr);

    pcl::toROSMsg(*cloud_source_ptr,pc_filter);
    filter_pub.publish(pc_filter);



    if (planeIndices->indices.size() == 0)
        std::cout << "Could not find a plane in the scene." << std::endl;
    else
    {
        // Copy the points of the plane to a new cloud.
        extract.setInputCloud(cloud_source_ptr);
        extract.setIndices(planeIndices);
        extract.filter(*plane);

        // Retrieve the convex hull.检索凸面
        pcl::ConvexHull<pcl::PointXYZRGB> hull;//创建凸包对象
        hull.setInputCloud(plane);//设置输入点云
        // Make sure that the resulting hull is bidimensional.二维的
        hull.setDimension(2);//设置凸包维度
        hull.reconstruct(*convexHull);//计算2D凸包结果

        // Redundant check.
        if (hull.getDimension() == 2)
        {
            // Prism object.
            double z_min = -0.3, z_max = -0.05; //we want the points above the plane, no father than 5 cm from the surface
            pcl::ExtractPolygonalPrismData<pcl::PointXYZRGB> prism;//使用一组表示平面模型的点索引，并与给定的高度一起生成三维多边形棱柱。然后使用多边形棱柱分割位于其内部的所有点。
            prism.setInputCloud(cloud_source_ptr);
            prism.setInputPlanarHull(convexHull);
            prism.setHeightLimits(z_min, z_max); //height limit objects lying on the plane.points having distances to the model outside this interval will be discarded
            pcl::PointIndices::Ptr objectIndices(new pcl::PointIndices);

            // Get and show all points retrieved by the hull.
            prism.segment(*objectIndices);
            extract.setIndices(objectIndices);
            extract.filter(*objects);
            segmented_objects.publish(objects);
            //segmented_plane.publish(plane);

            // run clustering extraction on "objects" to get several pointclouds
            pcl::search::KdTree<pcl::PointXYZRGB>::Ptr tree (new pcl::search::KdTree<pcl::PointXYZRGB>);
            pcl::EuclideanClusterExtraction<pcl::PointXYZRGB> ec;//欧式距离聚类
            std::vector<pcl::PointIndices> cluster_indices;
            ec.setClusterTolerance (0.02);//设置近邻搜索的搜索半径为5cm
            ec.setMinClusterSize (150);//设置一个聚类需要的最少点数目为500
            ec.setMaxClusterSize (10000000);//设置一个聚类需要的最大点数目为10000000
            ec.setSearchMethod (tree);//设置点云的搜索机制
            ec.setInputCloud (cloud_source_ptr);
            ec.extract (cluster_indices);//从点云中提取聚类，并将点云索引保存在cluster_indices中

            pcl::ExtractIndices<pcl::PointXYZRGB> extract_object_indices;
            std::vector<pcl::PointCloud<pcl::PointXYZRGB> > objectf;
            cv::Mat element;

            RemoveBoxes();
            arObj.clear();
            int nObjCnt = 0;
            for(int i = 0; i<cluster_indices.size(); ++i)
            {
                pcl::PointCloud<pcl::PointXYZRGB>::Ptr object_cloud (new pcl::PointCloud<pcl::PointXYZRGB>);
                extract_object_indices.setInputCloud(cloud_source_ptr);
                extract_object_indices.setIndices(boost::make_shared<const pcl::PointIndices>(cluster_indices[i]));
                extract_object_indices.filter(*object_cloud);
                objectf.push_back(*object_cloud);

                bool bFirstPoint = true;
                for (int j = 0; j < object_cloud->points.size(); j++) 
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
                if(boxMarker.xMin < 1.5 && boxMarker.yMin > -0.5 && boxMarker.yMax < 0.5)
                {
                    DrawBox(boxMarker.xMin, boxMarker.xMax, boxMarker.yMin, boxMarker.yMax, boxMarker.zMin, boxMarker.zMax, 0, 1, 0);

                    std::ostringstream stringStream;
                    stringStream << "obj_" << nObjCnt;
                    std::string obj_id = stringStream.str();
                    float object_x = boxMarker.xMax;
                    float object_y = (boxMarker.yMin+boxMarker.yMax)/2;
                    float object_z = boxMarker.zMin;
                    DrawText(obj_id,0.06, object_x,object_y,object_z, 1,0,1);
                    tmpObj.name = obj_id;
                    tmpObj.x = object_x;
                    tmpObj.y = object_y;
                    tmpObj.z = object_z;
                    tmpObj.probability = 1.0f;
                    arObj.push_back(tmpObj);

                    // coord.name.push_back(obj_id);
                    // coord.x.push_back(object_x);
                    // coord.y.push_back(object_y);
                    // coord.z.push_back(object_z);
                    // coord.probability.push_back(1.0f);
                    nObjCnt++;
                    ROS_WARN("[obj_%d] xMin= %.2f yMin = %.2f yMax = %.2f",i,boxMarker.xMin, boxMarker.yMin, boxMarker.yMax);
                } 
            }
            SortObjects();
            // coord_pub.publish(coord);
        }
        else std::cout << "The chosen hull is not planar." << std::endl;
    }

}

float CalObjDist(stObjectDetected* inObj)
{
    float x = inObj->x;
    float y = inObj->y;
    float z = inObj->z - 0.8f;
    float dist = sqrt(x*x + y*y + z*z);
    return dist;
}

void SortObjects()
{
    int nNum = arObj.size();
    if (nNum == 0)
        return;
    // 冒泡排序
    stObjectDetected tObj;
    for(int n = 0; n<nNum; n++)
    {
        float minObjDist = CalObjDist(&arObj[n]);
        for(int i=n+1;i<nNum; i++)
        {
            float curDist = CalObjDist(&arObj[i]);
            if(curDist < minObjDist)
            {
                // 交换位置
                tObj = arObj[n];
                arObj[n] = arObj[i];
                arObj[i] = tObj;
                minObjDist = curDist;
            }
        }
    }
    // 排序完毕，发送消息
    wpb_home_behaviors::Coord coord;
    for(int i=0;i<nNum; i++)
    {
        coord.name.push_back(arObj[i].name);
        coord.x.push_back(arObj[i].x);
        coord.y.push_back(arObj[i].y);
        coord.z.push_back(arObj[i].z);
        coord.probability.push_back(arObj[i].probability);
    }
    coord_pub.publish(coord);
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

int main(int argc, char **argv)
{
    ros::init(argc, argv, "hdy_pcl");
    tf_listener = new tf::TransformListener(); 
    ROS_WARN("pc_node start");
    ros::NodeHandle nh;
    ros::Subscriber pc_sub = nh.subscribe("/kinect2/qhd/points", 10, callbackPC);
    filter_pub = nh.advertise<sensor_msgs::PointCloud2>("obj_pointcloud",1);
    plane_pub = nh.advertise<sensor_msgs::PointCloud2>("plane_pointcloud",1);

    marker_pub = nh.advertise<visualization_msgs::Marker>("obj_marker", 10);
    coord_pub = nh.advertise<wpb_home_behaviors::Coord>("/wpb_home/hdy_pcl", 10);

    segmented_objects = nh.advertise<PointCloud> ("segmented_objects",1);
    segmented_plane = nh.advertise<PointCloud> ("segmented_plane",1);

    ros::spin();
    delete tf_listener; 
    return 0;
}