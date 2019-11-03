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

// Types
typedef pcl::PointXYZRGBA PointT;
typedef pcl::PointCloud<PointT> PointCloudT;
typedef pcl::PointNormal PointNT;
typedef pcl::PointCloud<PointNT> PointNCloudT;
typedef pcl::PointXYZL PointLT;
typedef pcl::PointCloud<PointLT> PointLCloudT;

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
	return (viewer);
}

int main ()
{
    //打开点云代码
    pcl::PointCloud<PointT>::Ptr cloud (new pcl::PointCloud<PointT>);
    pcl::io::loadPCDFile ("/home/hdy/Documents/hdy_pcl/hdy_pcl_rgba_2.pcd", *cloud);

    //pcl::PointCloud<PointT>::Ptr cloud_source_ptr;
    //cloud_source_ptr = cloud.makeShared();     //make_shared 在动态内存中分配一个对象并初始化它，返回指向此对象的shared_ptr
    
    pcl::PassThrough<PointT> pass;//设置滤波器对象,直通滤波
    pass.setInputCloud (cloud);//设置输入点云

    pass.setFilterFieldName ("z");//设置过滤时所需要点云类型的Z字段
    pass.setFilterLimits (0.2, 1.8);//设置在过滤字段的范围
    pass.filter (*cloud);
    pass.setFilterFieldName ("x");
    pass.setFilterLimits (0.0, 1.5);
    pass.filter (*cloud);
    pass.setFilterFieldName ("y");
    pass.setFilterLimits (-1.2, 1.2);
    pass.filter (*cloud);
    
    //体素滤波器：
    // Create the filtering object
    //pcl::PointCloud<pcl::PointXYZRGB>::Ptr cloud_after_voxelgrid(new pcl::PointCloud<pcl::PointXYZRGB>);//
	pcl::VoxelGrid<PointT> voxelgrid;
    voxelgrid.setInputCloud (cloud);
    voxelgrid.setLeafSize (0.007f, 0.007f, 0.007f);
    voxelgrid.filter (*cloud);
    
    
    //统计滤波器：
    // Create the filtering object
    //pcl::PointCloud<pcl::PointXYZRGB>::Ptr cloud_after_StatisticalRemoval(new pcl::PointCloud<pcl::PointXYZRGB>);
    pcl::StatisticalOutlierRemoval<PointT> Statistical;
    Statistical.setInputCloud (cloud);
    Statistical.setMeanK (50);
    Statistical.setStddevMulThresh (1.0);
    Statistical.filter(*cloud);
    
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
    Eigen::Vector3f axis = Eigen::Vector3f(1.0,0.0,0.0);
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
        //cloud.swap (cloud_f);
        *cloud = *cloud_f;
        i++;
    }

    PointT min;
    PointT max;
    pcl::getMinMax3D(*plane,min,max);
    //int maxsize = plane -> points.size ();
    //plane_height = plane -> points[maxsize].z;
    float plane_high = max.z;
    ROS_INFO("points. height =%.2f", plane_high);
    pass.setInputCloud (cloud);//设置输入点云
    pass.setFilterFieldName ("z");//设置过滤时所需要点云类型的Z字段
    pass.setFilterLimits (plane_high, 1.5);//设置在过滤字段的范围
    pass.filter (*cloud);
    /*
    //pcl::StatisticalOutlierRemoval<pcl::PointXYZRGB> Statistical;
    Statistical.setInputCloud (cloud);
    Statistical.setMeanK (100);
    Statistical.setStddevMulThresh (0.8);
    Statistical.filter(*cloud);
    */
    // Creating the KdTree object for the search method of the extraction
    pcl::search::KdTree<PointT>::Ptr tree (new pcl::search::KdTree<PointT>);
    tree->setInputCloud (cloud);
    
    std::vector<pcl::PointIndices> cluster_indices;
    pcl::EuclideanClusterExtraction<PointT> ec;   //欧式聚类对象
    ec.setClusterTolerance (0.02);                     // 设置近邻搜索的搜索半径为2cm
    ec.setMinClusterSize (100);                 //设置一个聚类需要的最少的点数目为100
    ec.setMaxClusterSize (25000);               //设置一个聚类需要的最大点数目为25000
    ec.setSearchMethod (tree);                    //设置点云的搜索机制
    ec.setInputCloud (cloud);
    ec.extract (cluster_indices);           //从点云中提取聚类，并将点云索引保存在cluster_indices中
    //迭代访问点云索引cluster_indices,直到分割处所有聚类
    int j = 0;
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
    boost::shared_ptr<pcl::visualization::PCLVisualizer> viewer;
    for(int i = 0; i<cluster_indices.size(); ++i)
    {
        extract_object_indices.setInputCloud(cloud);
        extract_object_indices.setIndices(boost::make_shared<const pcl::PointIndices>(cluster_indices[i]));
        extract_object_indices.filter(*object_cloud);
        objectf.push_back(*object_cloud);
        if(i == 0)viewer = rgbVis(object_cloud);
    }
    //可视化
    //boost::shared_ptr<pcl::visualization::PCLVisualizer> viewer;
    //pcl::PointCloud<PointT>::Ptr object_view (new pcl::PointCloud<PointT>);
    //for(std::vector<pcl::PointIndices>::const_iterator it = objectf.begin (); it != objectf.end (); ++it)
    
    //viewer = rgbVis(objectf);
    while (!viewer -> wasStopped ())
    {
        viewer -> spinOnce (1000);
    }
}