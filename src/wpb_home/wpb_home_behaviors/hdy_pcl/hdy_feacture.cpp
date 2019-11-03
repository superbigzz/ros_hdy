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
#include <pcl/visualization/histogram_visualizer.h> //直方图的可视化
#include <pcl/visualization/pcl_plotter.h>// 直方图的可视化 方法2

static tf::TransformListener *tf_listener;
// Types
typedef pcl::PointXYZRGBA PointT;
typedef pcl::PointCloud<PointT> PointCloudT;
typedef pcl::PointNormal PointNT;
typedef pcl::PointCloud<PointNT> PointNCloudT;
typedef pcl::PointXYZL PointLT;
typedef pcl::PointCloud<PointLT> PointLCloudT;

//可视化单个点云，无颜色
boost::shared_ptr<pcl::visualization::PCLVisualizer> simpleVis (pcl::PointCloud<PointT>::ConstPtr cloud)
{
	//创建视窗对象并给标题栏设置一个名称“3D Viewer”并将它设置为boost::shared_ptr智能共享指针，这样可以保证指针在程序中全局使用，而不引起内存错误
	boost::shared_ptr<pcl::visualization::PCLVisualizer> viewer (new pcl::visualization::PCLVisualizer ("3D Viewer"));
    //设置视窗的背景色，可以任意设置RGB的颜色，这里是设置为黑色
	viewer->setBackgroundColor (0.5,0.5,0.5);
	
    /*这是最重要的一行，我们将点云添加到视窗对象中，并定一个唯一的字符串作为ID 号，利用此字符串保证在其他成员中也能
    标志引用该点云，多次调用addPointCloud可以实现多个点云的添加，，每调用一次就会创建一个新的ID号，如果想更新一个
    已经显示的点云，必须先调用removePointCloud（），并提供需要更新的点云ID 号，
    *******************************************************************************************/
	viewer->addPointCloud<PointT> (cloud, "sample cloud");
    //用于改变显示点云的尺寸，可以利用该方法控制点云在视窗中的显示方法，
	viewer->setPointCloudRenderingProperties (pcl::visualization::PCL_VISUALIZER_POINT_SIZE, 1, "sample cloud");
    /*******************************************************************************************************
    查看复杂的点云，经常让人感到没有方向感，为了保持正确的坐标判断，需要显示坐标系统方向，可以通过使用X（红色）
    Y（绿色 ）Z （蓝色）圆柱体代表坐标轴的显示方式来解决，圆柱体的大小可以通过scale参数来控制，本例中scale设置为1.0
    ******************************************************************************************************/
	viewer->addCoordinateSystem (0.1);
    //通过设置照相机参数使得从默认的角度和方向观察点云
	viewer->initCameraParameters ();
	return (viewer);
}

//可视化点云颜色特征，显示原色
boost::shared_ptr<pcl::visualization::PCLVisualizer> rgbVis (pcl::PointCloud<PointT>::ConstPtr cloud)
{
	//创建3D窗口并添加点云	
	boost::shared_ptr<pcl::visualization::PCLVisualizer> viewer (new pcl::visualization::PCLVisualizer ("3D Viewer"));
	viewer->setBackgroundColor (1, 1, 1);
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
//可视化点云颜色特征，自定义单颜色,演示怎样给点云着上单独的一种颜色，可以利用该技术给指定的点云着色，以区别其他的点云
boost::shared_ptr<pcl::visualization::PCLVisualizer> customColourVis (pcl::PointCloud<PointT>::ConstPtr cloud)
{
	//创建3D窗口并添加点云
	boost::shared_ptr<pcl::visualization::PCLVisualizer> viewer (new pcl::visualization::PCLVisualizer ("3D Viewer"));
	viewer->setBackgroundColor (0, 0, 0);
    //创建一个自定义的颜色处理器PointCloudColorHandlerCustom对象，并设置颜色为纯绿
	pcl::visualization::PointCloudColorHandlerCustom<PointT> single_color(cloud, 0, 255, 0);
	viewer->addPointCloud<PointT> (cloud, single_color, "sample cloud");
	//viewer->setPointCloudRenderingProperties (pcl::visualization::PCL_VISUALIZER_POINT_SIZE, 3, "sample cloud");
	//viewer->addCoordinateSystem (1.0);
	viewer->initCameraParameters ();
	return (viewer);
}
//*******************可视化点云法线和其他特征*************************************************/
 /*********************************************************************************************
  显示法线是理解点云的一个重要步骤，点云法线特征是非常重要的基础特征，PCL visualizer可视化类可用于绘制法线，
   也可以绘制表征点云的其他特征，比如主曲率和几何特征，normalsVis函数中演示了如何实现点云的法线，
  ***********************************************************************************************/
  boost::shared_ptr<pcl::visualization::PCLVisualizer> normalsVis (pcl::PointCloud<PointT>::ConstPtr cloud, pcl::PointCloud<pcl::Normal>::ConstPtr normals)
{
  boost::shared_ptr<pcl::visualization::PCLVisualizer> viewer (new pcl::visualization::PCLVisualizer ("3D Viewer"));
  viewer->setBackgroundColor (0, 0, 0);
  pcl::visualization::PointCloudColorHandlerRGBField<PointT> rgb(cloud);
  viewer->addPointCloud<PointT> (cloud, rgb, "sample cloud");
  viewer->setPointCloudRenderingProperties (pcl::visualization::PCL_VISUALIZER_POINT_SIZE, 3, "sample cloud");
  //实现对点云法线的显示
  viewer->addPointCloudNormals<PointT, pcl::Normal> (cloud, normals, 10, 0.05, "normals");
  viewer->addCoordinateSystem (0.5);
  viewer->initCameraParameters ();
  return (viewer);
}
  //*****************绘制普通形状************************************************//
 /**************************************************************************************************************
  PCL visualizer可视化类允许用户在视窗中绘制一般图元，这个类常用于显示点云处理算法的可视化结果，例如 通过可视化球体
  包围聚类得到的点云集以显示聚类结果，shapesVis函数用于实现添加形状到视窗中，添加了四种形状：从点云中的一个点到最后一个点
  之间的连线，原点所在的平面，以点云中第一个点为中心的球体，沿Y轴的椎体
 *************************************************************************************************************/
boost::shared_ptr<pcl::visualization::PCLVisualizer> shapesVis (pcl::PointCloud<PointT>::ConstPtr cloud)
{
	//创建3D窗口并添加点云    
	boost::shared_ptr<pcl::visualization::PCLVisualizer> viewer (new pcl::visualization::PCLVisualizer ("3D Viewer"));
	viewer->setBackgroundColor (255, 255, 255);
	pcl::visualization::PointCloudColorHandlerRGBField<PointT> rgb(cloud);
	viewer->addPointCloud<PointT> (cloud, rgb, "sample cloud");
	//viewer->setPointCloudRenderingProperties (pcl::visualization::PCL_VISUALIZER_POINT_SIZE, 3, "sample cloud");
	viewer->addCoordinateSystem (0.05);
	viewer->initCameraParameters ();
	//在点云上添加直线和球体模型
	//绘制形状的实例代码，绘制点之间的连线，
	viewer->addLine<PointT> (cloud->points[0],
		cloud->points[cloud->size() - 1], "line");
	//0.2为半径  后面为颜色
	viewer->addSphere (cloud->points[0], 0.02, 0.5, 0.5, 0.0, "sphere");
	//在其他位置添加基于模型参数的平面及圆锥体
	pcl::ModelCoefficients coeffs;
	//values为一个矩阵 //-----Add shapes at other locations添加绘制平面使用标准平面方程ax+by+cz+d=0来定义平面，这个平面以原点为中心，方向沿着Z方向-----
	coeffs.values.push_back (0.0);
	coeffs.values.push_back (0.0);
	coeffs.values.push_back (0.02);
	coeffs.values.push_back (0.0);
	viewer->addPlane (coeffs, "plane");
	coeffs.values.clear ();
	coeffs.values.push_back (0.3);
	coeffs.values.push_back (0.3);
	coeffs.values.push_back (0.0);
	coeffs.values.push_back (0.0);
	coeffs.values.push_back (1.0);
	coeffs.values.push_back (0.0);
	coeffs.values.push_back (5.0);
	viewer->addCone (coeffs, "cone");
 
	return (viewer);
}

/******************************************************************************************
 多视角显示：PCL  visealizer可视化类允许用户通过不同的窗口（Viewport）绘制多个点云这样方便对点云比较
 viewportsVis函数演示如何用多视角来显示点云计算法线的方法结果对比
******************************************************************************************/
boost::shared_ptr<pcl::visualization::PCLVisualizer> viewportsVis (pcl::PointCloud<PointT>::ConstPtr cloud, 
	pcl::PointCloud<pcl::Normal>::ConstPtr normals1, pcl::PointCloud<pcl::Normal>::ConstPtr normals2)
{
	// 创建3D窗口并添加显示点云其包括法线
	boost::shared_ptr<pcl::visualization::PCLVisualizer> viewer (new pcl::visualization::PCLVisualizer ("3D Viewer"));
	viewer->initCameraParameters ();
	int v1(0);
	viewer->createViewPort(0.0, 0.0, 0.5, 1.0, v1);//4个参数分别是X轴的最小值，最大值，Y轴的最小值，最大值，取值0-1，v1是标识
	cout<<v1<<endl;
	viewer->setBackgroundColor (0, 0, 0, v1);
	viewer->addText("Radius: 0.01", 10, 10, "v1 text", v1);//添加一个标签区别其他窗口  利用RGB颜色着色器并添加点云到视口中
	pcl::visualization::PointCloudColorHandlerRGBField<PointT> rgb(cloud);
	viewer->addPointCloud<PointT> (cloud, rgb, "sample cloud1", v1);
	int v2(0);//对第二视口做同样的操作，使得做创建的点云分布于右半窗口，将该视口背景赋值于灰色，以便明显区别，虽然添加同样的点云，给点云自定义颜色着色
	viewer->createViewPort(0.5, 0.0, 1.0, 1.0, v2);
	cout<<v2<<endl;
	viewer->setBackgroundColor (0.3, 0.3, 0.3, v2);
	viewer->addText("Radius: 0.1", 10, 10, "v2 text", v2);
	pcl::visualization::PointCloudColorHandlerCustom<PointT> single_color(cloud, 0, 255, 0);
	viewer->addPointCloud<PointT> (cloud, single_color, "sample cloud2", v2);
    //为所有视口设置属性，
	viewer->setPointCloudRenderingProperties (pcl::visualization::PCL_VISUALIZER_POINT_SIZE, 3, "sample cloud1");
	viewer->setPointCloudRenderingProperties (pcl::visualization::PCL_VISUALIZER_POINT_SIZE, 3, "sample cloud2");
	viewer->addCoordinateSystem (0.5);
    //添加法线  每个视图都有一组对应的法线
	viewer->addPointCloudNormals<PointT, pcl::Normal> (cloud, normals1, 10, 0.05, "normals1", v1);
	viewer->addPointCloudNormals<PointT, pcl::Normal> (cloud, normals2, 10, 0.05, "normals2", v2);
 
	return (viewer);
}

  boost::shared_ptr<pcl::visualization::PCLHistogramVisualizer> pfhVis (pcl::PointCloud<PointT>::ConstPtr cloud, 
  pcl::PointCloud<pcl::PFHSignature125>::ConstPtr pfh)
{
  boost::shared_ptr<pcl::visualization::PCLHistogramVisualizer> viewer (new pcl::visualization::PCLHistogramVisualizer);
  viewer->setBackgroundColor (0, 0, 0);
  pcl::visualization::PointCloudColorHandlerRGBField<PointT> rgb(cloud);
  //viewer->addPointCloud<PointT> (cloud, rgb, "sample cloud");
  //viewer->setPointCloudRenderingProperties (pcl::visualization::PCL_VISUALIZER_POINT_SIZE, 3, "sample cloud");
  //实现对点云法线的显示
  viewer -> addFeatureHistogram<pcl::PFHSignature125> (*pfh,"pfh",100);
  //viewer->addCoordinateSystem (0.5);
  //viewer->initCameraParameters ();
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
    pass.setFilterLimits (0.2, 1.6);//设置在过滤字段的范围
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
    
    //搜索半径获取点云法线
	pcl::NormalEstimation<PointT, pcl::Normal> ne;
	ne.setInputCloud (cloud);
	pcl::search::KdTree<PointT>::Ptr tree (new pcl::search::KdTree<PointT>);
	ne.setSearchMethod (tree);
    // 0.05为搜索半径获取点云法线
	pcl::PointCloud<pcl::Normal>::Ptr normals (new pcl::PointCloud<pcl::Normal>);
	normals->points.resize(cloud -> points.size());
	ne.setRadiusSearch (0.03);
	ne.compute (*normals);    

    //创建PFH估计对象pfh，并将输入点云数据集cloud和法线normals传递给它
    pcl::PFHEstimation<PointT,pcl::Normal,pcl::PFHSignature125> pfh;
    pcl::FPFHEstimation<PointT,pcl::Normal,pcl::FPFHSignature33> fpfh;
    pcl::VFHEstimation<PointT, pcl::Normal, pcl::VFHSignature308> vfh;
    pcl::CVFHEstimation<PointT, pcl::Normal, pcl::VFHSignature308> cvfh;

    cvfh.setInputCloud(cloud);
    cvfh.setInputNormals(normals);
    //如果点云是类型为PointNormal,则执行pfh.setInputNormals (cloud);
    //创建一个空的kd树表示法，并把它传递给PFH估计对象。
    //基于已给的输入数据集，建立kdtree
    pcl::search::KdTree<PointT>::Ptr tree2 (new pcl::search::KdTree<PointT> ());
    cvfh.setSearchMethod(tree2);
    //输出数据集
    pcl::PointCloud<pcl::PFHSignature125>::Ptr pfhs (new pcl::PointCloud<pcl::PFHSignature125>());
    pcl::PointCloud<pcl::FPFHSignature33>::Ptr fpfhs(new pcl::PointCloud<pcl::FPFHSignature33>());
    pcl::PointCloud<pcl::VFHSignature308>::Ptr vfhs (new pcl::PointCloud<pcl::VFHSignature308> ());
    pcl::PointCloud<pcl::VFHSignature308>::Ptr cvfhs (new pcl::PointCloud<pcl::VFHSignature308> ());
    //使用半径在5厘米范围内的所有邻元素。
    //注意：此处使用的半径必须要大于估计表面法线时使用的半径!!!
    //cvfh.setRadiusSearch(0.05);
    //计算pfh特征值
    cvfh.compute(*cvfhs);
    ROS_INFO("finished pfh");

// pfhs->points.size ()应该与input cloud->points.size ()有相同的大小，即每个点都有一个pfh特征向量 
/*
    //搜索半径获取点云法线
	pcl::NormalEstimation<PointT, pcl::Normal> ne;
 
	ne.setInputCloud (cloud);
	pcl::search::KdTree<PointT>::Ptr tree (new pcl::search::KdTree<PointT>);
	ne.setSearchMethod (tree);
    // 0.05为搜索半径获取点云法线
	pcl::PointCloud<pcl::Normal>::Ptr cloud_normals1 (new pcl::PointCloud<pcl::Normal>);
	cloud_normals1->points.resize(cloud -> points.size());
	ne.setRadiusSearch (0.05);
	ne.compute (*cloud_normals1);
	//  0.1为搜索半径获取点云法线
	pcl::PointCloud<pcl::Normal>::Ptr cloud_normals2 (new pcl::PointCloud<pcl::Normal>);
	cloud_normals2->points.resize(cloud -> points.size());
	ne.setRadiusSearch (0.01);
    ne.compute (*cloud_normals2);
    //ne.setViewPoint(0.3,0.0,0.5);
    */
    //可视化;
    //视点默认坐标是（0，0，0）可使用 setViewPoint(float vpx,float vpy,float vpz)来更换
    //boost::shared_ptr<pcl::visualization::PCLVisualizer> viewer; 
    //viewer = viewportsVis(cloud,cloud_normals1,cloud_normals2);
	//viewer = shapesVis(cloud);
	//viewer = rgbVis(cloud);
	//viewer = simpleVis(cloud);
	//viewer = customColourVis(cloud);
	//viewer = normalsVis(cloud,normals);
/*
    while (!viewer -> wasStopped ())
    {
        viewer -> spinOnce ();
    }
*/
    // ========直方图可视化=============================
    //pcl::visualization::PCLHistogramVisualizer view;//直方图可视化
    //view.setBackgroundColor(255,0,0);//背景红色
    //view.addFeatureHistogram<pcl::PFHSignature125> (*pfhs,"pfh",100); 

    pcl::visualization::PCLPlotter plotter;
    plotter.addFeatureHistogram(*cvfhs, 1500); //设置的很坐标长度，该值越大，则显示的越细致
    plotter.plot();
    plotter.spin();  //循环的次数

    return 0;
}

/*
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
    //ROS_INFO("cloud_src size = %d",cloud_src.size()); 
    //pcl::io::savePCDFileASCII ("/home/hdy/Documents/hdy_pcl/hdy_pcl_rgba_1.pcd", cloud_src);//保存pcd
    pcl::PointCloud<PointT>::Ptr cloud_source_ptr;
    cloud_source_ptr = cloud_src.makeShared();     //make_shared 在动态内存中分配一个对象并初始化它，返回指向此对象的shared_ptr

    //直通滤波
    pcl::PointCloud<PointT>::Ptr cloud_after_PassThrough(new pcl::PointCloud<PointT>);

    pcl::PassThrough<PointT> pass;//设置滤波器对象,直通滤波
    pass.setInputCloud (cloud_source_ptr);//设置输入点云

    pass.setFilterFieldName ("z");//设置过滤时所需要点云类型的Z字段
    pass.setFilterLimits (0.2, 1.6);//设置在过滤字段的范围
    pass.filter (*cloud_source_ptr);

    pass.setFilterFieldName ("x");
    pass.setFilterLimits (0.0, 1.6);
    pass.filter (*cloud_source_ptr);

    pass.setFilterFieldName ("y");
    pass.setFilterLimits (-1.5, 1.5);
    pass.filter (*cloud_source_ptr);
 
    //pcl::IndicesPtr indices (new std::vector <int>); //存储点云的容器
    
    //体素滤波器：
    // Create the filtering object
    //pcl::PointCloud<pcl::PointXYZRGB>::Ptr cloud_after_voxelgrid(new pcl::PointCloud<pcl::PointXYZRGB>);//
	pcl::VoxelGrid<PointT> voxelgrid;
    voxelgrid.setInputCloud (cloud_source_ptr);
    voxelgrid.setLeafSize (0.01f, 0.01f, 0.01f);
    voxelgrid.filter (*cloud_source_ptr);
    
    
    //统计滤波器：
    // Create the filtering object
    //pcl::PointCloud<pcl::PointXYZRGB>::Ptr cloud_after_StatisticalRemoval(new pcl::PointCloud<pcl::PointXYZRGB>);
    pcl::StatisticalOutlierRemoval<PointT> Statistical;
    Statistical.setInputCloud (cloud_source_ptr);
    Statistical.setMeanK (50);
    Statistical.setStddevMulThresh (1.0);
    Statistical.filter(*cloud_source_ptr);

    pcl::io::savePCDFileASCII ("/home/hdy/Documents/hdy_pcl/hdy_pcl_rgba_2.pcd", cloud_src);//保存pcd    

    //创建法线估计估计向量
    pcl::NormalEstimation<PointT, pcl::Normal> ne;
    ne.setInputCloud (cloud_source_ptr);
    //创建一个空的KdTree对象，并把它传递给法线估计向量
    //基于给出的输入数据集，KdTree将被建立
    pcl::search::KdTree<PointT>::Ptr tree (new pcl::search::KdTree<PointT> ());
    ne.setSearchMethod (tree);
    //存储输出数据
    pcl::PointCloud<pcl::Normal>::Ptr cloud_normals (new pcl::PointCloud<pcl::Normal>);
    //使用半径在查询点周围3厘米范围内的所有临近元素
    ne.setRadiusSearch (0.03);
    //计算特征值
    ne.compute (*cloud_normals);
    // cloud_normals->points.size ()应该与input cloud_downsampled->points.size ()有相同的尺寸
    //可视化
    pcl::visualization::PCLVisualizer viewer("PCL Viewer");
    viewer.setBackgroundColor (0.0, 0.0, 0.0);
    viewer.addPointCloudNormals<PointT,pcl::Normal>(cloud_source_ptr, cloud_normals);
    //视点默认坐标是（0，0，0）可使用 setViewPoint(float vpx,float vpy,float vpz)来更换
    while (!viewer.wasStopped ())
    {
        viewer.spinOnce ();
    }
}
int main (int argc, char **argv)
{
    //打开点云代码
    //pcl::PointCloud<pcl::PointXYZ>::Ptr cloud (new pcl::PointCloud<pcl::PointXYZ>);
    //pcl::io::loadPCDFile ("table_scene_lms400.pcd", *cloud);
    ros::init(argc, argv, "hdy_feacture");
    tf_listener = new tf::TransformListener(); 
    ROS_WARN("pc_node start");
    ros::NodeHandle nh;
    ros::Subscriber pc_sub = nh.subscribe("/kinect2/qhd/points", 10, callbackPC);

    ros::spin();
    delete tf_listener; 
    return 0;
}
*/