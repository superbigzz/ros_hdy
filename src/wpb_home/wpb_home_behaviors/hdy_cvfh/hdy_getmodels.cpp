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

#include <pcl/segmentation/supervoxel_clustering.h>
#include <pcl/console/parse.h>
#include <vtkPolyLine.h>
#include <pcl/features/normal_3d.h>
#include <pcl/features/integral_image_normal.h>  //法线估计类头文件
#include <pcl/features/pfh.h>                 //pfh特征估计类头文件
#include <pcl/features/fpfh.h>                 //fpfh特征估计类头文件
#include <pcl/features/vfh.h>
#include <pcl/features/cvfh.h>

#include <geometry_msgs/Twist.h>
#include <termios.h>
#include <signal.h>
#include <sys/poll.h>
#include <string.h>
#include <unistd.h>
#include <fcntl.h>
#include <boost/thread/thread.hpp>
using namespace std;


static ros::Publisher filter_pub;
static ros::Publisher plane_pub;
static ros::Publisher segmented_objects;
static ros::Publisher segmented_plane;
sensor_msgs::PointCloud2 pc_plane;
sensor_msgs::PointCloud2 pc_object;
static tf::TransformListener *tf_listener;

unsigned int filesNum = 0;
unsigned int filesNum0 = 0;
bool saveCloud(false);
bool saveCloud0(false);

// Types
typedef pcl::PointXYZRGBA PointT;
typedef pcl::PointCloud<PointT> PointCloudT;
typedef pcl::PointNormal PointNT;
typedef pcl::PointCloud<PointNT> PointNCloudT;
typedef pcl::PointXYZL PointLT;
typedef pcl::PointCloud<PointLT> PointLCloudT;

#define KEYCODE_R 0x43 
#define KEYCODE_L 0x44
#define KEYCODE_U 0x41
#define KEYCODE_D 0x42
#define KEYCODE_Q 0x71

int kfd = 0;
struct termios cooked, raw;

void quit(int sig)
{
  (void)sig;
  tcsetattr(kfd, TCSANOW, &cooked);//在程序结束时在恢复原来的配置
  exit(0);
}
//读取键盘输入函数
void keyLoop()
{
  char c;

  // get the console in raw mode                                                              
  tcgetattr(kfd, &cooked); // 得到 termios 结构体保存，然后重新配置终端
  memcpy(&raw, &cooked, sizeof(struct termios));
  raw.c_lflag &=~ (ICANON | ECHO);
  // Setting a new line, then end of file                         
  raw.c_cc[VEOL] = 1;
  raw.c_cc[VEOF] = 2;
  tcsetattr(kfd, TCSANOW, &raw);

  puts("Reading from keyboard");
  puts("---------------------------");
  puts("Use arrow keys to move the robot.");
  puts("otherwise the key values will be printed");


  for(;;)
  {
    // get the next event from the keyboard  
    if(read(kfd, &c, 1) < 0)
    {
      perror("read():");
      exit(-1);
    }

    switch(c)
    {
      case KEYCODE_L:
        printf("LEFT\n");
        break;
      case KEYCODE_R:
        printf("RIGHT\n");
        break;
      case KEYCODE_U:
        printf("UP\n");
        break;
      case KEYCODE_D:
        printf("DOWN\n");
        //saveCloud = true;
        saveCloud0 = true;
        break;
          default:
                printf("value: %c = 0x%02X = %d\n", c, c, c);
    }
  }
  return;
}


//可视化点云颜色特征，显示原色
boost::shared_ptr<pcl::visualization::PCLVisualizer> rgbVis (pcl::PointCloud<PointT>::ConstPtr cloud)
{
	//创建3D窗口并添加点云	
	boost::shared_ptr<pcl::visualization::PCLVisualizer> viewer (new pcl::visualization::PCLVisualizer ("3D Viewer"));
	viewer->setBackgroundColor (0, 0, 0);
    /***************************************************************************************************************
    设置窗口的背景颜色后，创建一个颜色处理对象，PointCloudColorHandlerRGBField利用这样的对象显示自定义颜色数据，PointCloudColorHandlerRGBField
    对象得到每个点云的RGB颜色字段，
    **************************************************************************************************************/
	pcl::visualization::PointCloudColorHandlerRGBField<PointT> rgb(cloud);
	viewer->addPointCloud<PointT> (cloud, rgb, "sample cloud");
	viewer->setPointCloudRenderingProperties (pcl::visualization::PCL_VISUALIZER_POINT_SIZE, 3, "sample cloud");
	viewer->addCoordinateSystem (1.0);
	viewer->initCameraParameters ();

    if(saveCloud)
    {
        ROS_INFO("SAVE");
        stringstream stream;
        stream << "/home/hdy/Documents/hdy_pcl/hdy_models/model_1"<< filesNum<< ".pcd";
        string filename = stream.str();
 
        if(pcl::io::savePCDFile(filename, *cloud, true) == 0)
        {
            filesNum++;
            cout << filename<<" Saved."<<endl;
            ROS_INFO("SAVED");
        }
        else PCL_ERROR("Problem saving %s.\n", filename.c_str());
        saveCloud = false;
    }

	return (viewer);
}
/*
void keyboardEventOccured(const pcl::visualization::KeyboardEvent& event, void* nothing)
{
    if(event.getKeySym() == "space"&& event.keyDown())
    {
        saveCloud = true;
        ROS_INFO("space");
    }
        
 
}
*/

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
    pcl::PointCloud<PointT> cloud_src;
    pcl::fromROSMsg(pc_footprint , cloud_src);
    pcl::PointCloud<PointT>::Ptr cloud;
    cloud = cloud_src.makeShared();     //make_shared 在动态内存中分配一个对象并初始化它，返回指向此对象的shared_ptr

    //打开点云代码
    //pcl::PointCloud<PointT>::Ptr cloud (new pcl::PointCloud<PointT>);
    //pcl::io::loadPCDFile ("/home/hdy/Documents/hdy_pcl/hdy_pcl_rgba_2.pcd", *cloud);

    //pcl::PointCloud<PointT>::Ptr cloud_source_ptr;
    //cloud_source_ptr = cloud.makeShared();     //make_shared 在动态内存中分配一个对象并初始化它，返回指向此对象的shared_ptr
    
    pcl::PassThrough<PointT> pass;//设置滤波器对象,直通滤波
    pass.setInputCloud (cloud);//设置输入点云

    pass.setFilterFieldName ("z");//设置过滤时所需要点云类型的Z字段
    pass.setFilterLimits (0.2, 1.5);//设置在过滤字段的范围
    pass.filter (*cloud);
    pass.setFilterFieldName ("x");
    pass.setFilterLimits (0.0, 1.8);
    pass.filter (*cloud);
    pass.setFilterFieldName ("y");
    pass.setFilterLimits (-1.5, 1.5);
    pass.filter (*cloud);
    /*
    //体素滤波器：
    // Create the filtering object
    //pcl::PointCloud<pcl::PointXYZRGB>::Ptr cloud_after_voxelgrid(new pcl::PointCloud<pcl::PointXYZRGB>);//
	pcl::VoxelGrid<PointT> voxelgrid;
    voxelgrid.setInputCloud (cloud);
    voxelgrid.setLeafSize (0.008f, 0.008f, 0.008f);
    voxelgrid.filter (*cloud);
    */
    
    //统计滤波器：
    // Create the filtering object
    //pcl::PointCloud<pcl::PointXYZRGB>::Ptr cloud_after_StatisticalRemoval(new pcl::PointCloud<pcl::PointXYZRGB>);
    pcl::StatisticalOutlierRemoval<PointT> Statistical;
    Statistical.setInputCloud (cloud);
    Statistical.setMeanK (50);
    Statistical.setStddevMulThresh (1.0);
    Statistical.filter(*cloud);
    /*
    if(saveCloud0)
    {
        //ROS_INFO("SAVE0");
        stringstream stream0;
        stream0 << "/home/hdy/Documents/hdy_pcl/pcl_shot_test/bottle_all"<< filesNum0<< ".pcd";
        string filename0 = stream0.str();
 
        if(pcl::io::savePCDFile(filename0, *cloud) == 0)
        {
            filesNum0++;
            cout << filename0<<" Saved."<<endl;
            ROS_INFO("SAVED");
        }
        else PCL_ERROR("Problem saving %s.\n", filename0.c_str());
        saveCloud0 = false;
    }
    */    
    //process
    //printf ("Cloud: width = %d, height = %d\n", msg->width, msg->height);
    pcl::PointCloud<PointT>::Ptr plane(new pcl::PointCloud<PointT>);//指针类型
    pcl::PointCloud<PointT>::Ptr convexHull(new pcl::PointCloud<PointT>);// 计算出图像的凸包，根据图像的轮廓点，通过函数convexhull转化成凸包的点点坐标
    pcl::PointCloud<PointT>::Ptr objects(new pcl::PointCloud<PointT>);

    // Get the plane model, if present.提取出平面
    pcl::ModelCoefficients::Ptr coefficients(new pcl::ModelCoefficients);
    pcl::SACSegmentation<PointT> segmentation;
    segmentation.setInputCloud(cloud);
    segmentation.setModelType(pcl::SACMODEL_PLANE);//所提取目标模型的属性（平面、球、圆柱等等）
    segmentation.setMethodType(pcl::SAC_RANSAC);//采样方法（RANSAC、LMedS等
    segmentation.setDistanceThreshold(0.005);//查询点到目标模型的距离阈值（如果大于此阈值，则查询点不在目标模型上，默认值为0）
    segmentation.setOptimizeCoefficients(true);//可选设置
    Eigen::Vector3f axis = Eigen::Vector3f(0.0,1.0,0.0);
    segmentation.setAxis(axis);//平面平行于y轴，容忍度10
    //segmentation.setEpsAngle(pcl::deg2rad(15));
    segmentation.setEpsAngle( 10.0f * (M_PI/180.0f) );
    pcl::PointIndices::Ptr planeIndices(new pcl::PointIndices);
    segmentation.segment(*planeIndices, *coefficients);//分割操作,输出提取点的索引和目标模型的参数
    ROS_INFO_STREAM("Planes: " << planeIndices->indices.size());
    pcl::ExtractIndices<PointT> extract; //创建点云提取对象

    ////////////////////////////////////////////////////////////////////////////
    pcl::PointCloud<PointT>::Ptr cloud_f (new pcl::PointCloud<PointT>);
    float plane_height;
    int i = 0, nr_points = (int) cloud->points.size ();
    // While 30% of the original cloud is still there
    while (cloud->points.size () > 0.3 * nr_points)    //
    {
        // Segment the largest planar component from the remaining cloud
        segmentation.setInputCloud (cloud);
        segmentation.segment (*planeIndices, *coefficients);
        if (planeIndices->indices.size () == 0)
        {
            ROS_WARN("Could not estimate a planar model for the given dataset.");
            break;
        }

        // Extract the planeIndices从点云中抽取分割的处在平面上的点集
        extract.setInputCloud (cloud);
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
        cloud.swap (cloud_f);
        //cloud = *cloud_f;
        i++;
    }

    pcl::toROSMsg(*plane,pc_plane);
    plane_pub.publish(pc_plane);

    PointT min;
    PointT max;
    pcl::getMinMax3D(*plane,min,max);
    //int maxsize = plane -> points.size ();
    //plane_height = plane -> points[maxsize].z;
    float plane_high = max.z;
    ROS_INFO("points. height =%.2f", plane_high);
    pass.setInputCloud (cloud);//设置输入点云
    pass.setFilterFieldName ("z");//设置过滤时所需要点云类型的Z字段
    pass.setFilterLimits (plane_high, 1.8);//设置在过滤字段的范围
    pass.filter (*cloud);
    //保存原点云
    if(saveCloud0)
    {
        //ROS_INFO("SAVE0");
        stringstream stream0;
        stream0 << "/home/hdy/Documents/hdy_pcl/pcl_shot_test/bottle_single1"<< filesNum0<< ".pcd";
        string filename0 = stream0.str();
 
        if(pcl::io::savePCDFile(filename0, *cloud) == 0)
        {
            filesNum0++;
            cout << filename0<<" Saved."<<endl;
            ROS_INFO("SAVED");
        }
        else PCL_ERROR("Problem saving %s.\n", filename0.c_str());
        saveCloud0 = false;
    }

    //pcl::StatisticalOutlierRemoval<pcl::PointXYZRGB> Statistical;
    Statistical.setInputCloud (cloud);
    Statistical.setMeanK (100);
    Statistical.setStddevMulThresh (0.8);
    Statistical.filter(*cloud);

    // Creating the KdTree object for the search method of the extraction
    pcl::search::KdTree<PointT>::Ptr tree (new pcl::search::KdTree<PointT>);
    tree->setInputCloud (cloud);
    
    std::vector<pcl::PointIndices> cluster_indices;
    pcl::EuclideanClusterExtraction<PointT> ec;   //欧式聚类对象
    ec.setClusterTolerance (0.05);                     // 设置近邻搜索的搜索半径为2cm
    ec.setMinClusterSize (100);                 //设置一个聚类需要的最少的点数目为100
    ec.setMaxClusterSize (25000);               //设置一个聚类需要的最大点数目为25000
    ec.setSearchMethod (tree);                    //设置点云的搜索机制
    ec.setInputCloud (cloud);
    ec.extract (cluster_indices);           //从点云中提取聚类，并将点云索引保存在cluster_indices中
    //迭代访问点云索引cluster_indices,直到分割处所有聚类
    pcl::PointCloud<PointT>::Ptr cloud_cluster (new pcl::PointCloud<PointT>);
    /*
    for (std::vector<pcl::PointIndices>::const_iterator it = cluster_indices.begin (); it != cluster_indices.end (); ++it)
    {
        //pcl::PointCloud<PointT>::Ptr cloud_cluster (new pcl::PointCloud<PointT>);
        for (std::vector<int>::const_iterator pit = it->indices.begin (); pit != it->indices.end (); ++pit)
        
        cloud_cluster->points.push_back (cloud->points[*pit]); //*
        cloud_cluster->width = cloud_cluster->points.size ();
        cloud_cluster->height = 1;
        cloud_cluster->is_dense = true;
    
        std::cout << "PointCloud representing the Cluster: " << cloud_cluster->points.size () << " data points." << std::endl;
        std::stringstream ss;
        ss << "cloud_cluster_" << j << ".pcd";
        //writer.write<PointT> (ss.str (), *cloud_cluster, false); //*
        j++;
    }
    */
    pcl::ExtractIndices<PointT> extract_object_indices;
    std::vector<pcl::PointCloud<PointT> > objectf;
    pcl::PointCloud<PointT>::Ptr object_cloud (new pcl::PointCloud<PointT>);
    //boost::shared_ptr<pcl::visualization::PCLVisualizer> viewer;
    //viewer -> registerKeyboardCallback(keyboardEventOccured);
    for(int i = 0; i<cluster_indices.size(); ++i)
    {
        extract_object_indices.setInputCloud(cloud);
        extract_object_indices.setIndices(boost::make_shared<const pcl::PointIndices>(cluster_indices[i]));
        extract_object_indices.filter(*object_cloud);
        objectf.push_back(*object_cloud);
        //viewer = rgbVis(object_cloud);
    }
    pcl::toROSMsg(*object_cloud,pc_object);
    filter_pub.publish(pc_object);

    /***获取vfh特征**/
    //搜索半径获取点云法线
	pcl::NormalEstimation<PointT, pcl::Normal> ne;
	ne.setInputCloud (object_cloud);
	pcl::search::KdTree<PointT>::Ptr tree1 (new pcl::search::KdTree<PointT>);
	ne.setSearchMethod (tree1);
    // 0.05为搜索半径获取点云法线
	pcl::PointCloud<pcl::Normal>::Ptr normals (new pcl::PointCloud<pcl::Normal>);
	normals->points.resize(object_cloud -> points.size());
	ne.setRadiusSearch (0.03);
	ne.compute (*normals);    

    //创建PFH估计对象vfh，并将输入点云数据集cloud和法线normals传递给它
    pcl::VFHEstimation<PointT, pcl::Normal, pcl::VFHSignature308> vfh;
    pcl::CVFHEstimation<PointT, pcl::Normal, pcl::VFHSignature308> cvfh;

    vfh.setInputCloud(object_cloud);
    vfh.setInputNormals(normals);
    //如果点云是类型为PointNormal,则执行pfh.setInputNormals (cloud);
    //创建一个空的kd树表示法，并把它传递给PFH估计对象。
    //基于已给的输入数据集，建立kdtree
    pcl::search::KdTree<PointT>::Ptr tree2 (new pcl::search::KdTree<PointT> ());
    vfh.setSearchMethod(tree2);
    //输出数据集
    pcl::PointCloud<pcl::VFHSignature308>::Ptr vfhs (new pcl::PointCloud<pcl::VFHSignature308> ());
    pcl::PointCloud<pcl::VFHSignature308>::Ptr cvfhs (new pcl::PointCloud<pcl::VFHSignature308> ());
    //使用半径在5厘米范围内的所有邻元素。
    //注意：此处使用的半径必须要大于估计表面法线时使用的半径!!!
    //cvfh.setRadiusSearch(0.05);
    //计算pfh特征值
    vfh.compute(*vfhs);
    //可视化
    //boost::shared_ptr<pcl::visualization::PCLVisualizer> viewer;
    //pcl::PointCloud<PointT>::Ptr object_view (new pcl::PointCloud<PointT>);
    //for(std::vector<pcl::PointIndices>::const_iterator it = objectf.begin (); it != objectf.end (); ++it)
    if(saveCloud)
    {
        //ROS_INFO("SAVE");
        stringstream stream;
        stream << "/home/hdy/Documents/hdy_pcl/hdy_models/bottle_VFH"<< filesNum<< ".pcd";
        string filename = stream.str();
 
        if(pcl::io::savePCDFile(filename, *vfhs) == 0)
        {
            filesNum++;
            cout << filename<<" Saved."<<endl;
            ROS_INFO("SAVED");
        }
        else PCL_ERROR("Problem saving %s.\n", filename.c_str());
        saveCloud = false;
    }
    //viewer = rgbVis(plane);
    //键盘
    //signal(SIGINT,quit);
    //keyLoop();
    /*
    while (!viewer -> wasStopped ())
    {
        viewer -> spinOnce (1000);
    }
    */

}

int main(int argc, char **argv)
{
    ros::init(argc, argv, "hdy_getmodels");
    tf_listener = new tf::TransformListener(); 
    
    ros::NodeHandle nh;
    ros::Subscriber pc_sub = nh.subscribe("/kinect2/qhd/points", 10, callbackPC);
    filter_pub = nh.advertise<sensor_msgs::PointCloud2>("obj_pointcloud",1);
    plane_pub = nh.advertise<sensor_msgs::PointCloud2>("plane_pointcloud",1);
    //segmented_objects = nh.advertise<sensor_msgs::PointCloud2> ("segmented_objects",1);
    //segmented_plane = nh.advertise<PointCloud2> ("segmented_plane",1);
    //signal(SIGINT,quit);
    boost::thread t = boost::thread(boost::bind(&keyLoop));
    //keyLoop();
    ros::spin();
    //中断线程
    t.interrupt();
    //由于线程中断，所以立即返回
    t.join();
    tcsetattr(kfd, TCSANOW, &cooked);
    delete tf_listener; 
    return 0;
}