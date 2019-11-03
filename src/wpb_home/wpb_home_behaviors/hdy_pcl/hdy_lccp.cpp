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
//#include <pcl/segmentation/lccp_segmentation.h>
#include <vtkPolyLine.h>
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

// Types
typedef pcl::PointXYZRGBA PointT;
typedef pcl::PointCloud<PointT> PointCloudT;
typedef pcl::PointNormal PointNT;
typedef pcl::PointCloud<PointNT> PointNCloudT;
typedef pcl::PointXYZL PointLT;
typedef pcl::PointCloud<PointLT> PointLCloudT;
 
void addSupervoxelConnectionsToViewer(PointT &supervoxel_center,
	PointCloudT &adjacent_supervoxel_centers,
	std::string supervoxel_name,
	boost::shared_ptr<pcl::visualization::PCLVisualizer> & viewer);

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
    pcl::PointCloud<PointT>::Ptr cloud_source_ptr;
    cloud_source_ptr = cloud_src.makeShared();     //make_shared 在动态内存中分配一个对象并初始化它，返回指向此对象的shared_ptr

    //直通滤波
    pcl::PointCloud<PointT>::Ptr cloud_after_PassThrough(new pcl::PointCloud<PointT>);

    pcl::PassThrough<PointT> pass;//设置滤波器对象,直通滤波
    pass.setInputCloud (cloud_source_ptr);//设置输入点云

    pass.setFilterFieldName ("z");//设置过滤时所需要点云类型的Z字段
    pass.setFilterLimits (0.2, 1.5);//设置在过滤字段的范围
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
    voxelgrid.setLeafSize (0.008f, 0.008f, 0.008f);
    voxelgrid.filter (*cloud_source_ptr);
    
    
    //统计滤波器：
    // Create the filtering object
    //pcl::PointCloud<pcl::PointXYZRGB>::Ptr cloud_after_StatisticalRemoval(new pcl::PointCloud<pcl::PointXYZRGB>);
    pcl::StatisticalOutlierRemoval<PointT> Statistical;
    Statistical.setInputCloud (cloud_source_ptr);
    Statistical.setMeanK (50);
    Statistical.setStddevMulThresh (1.0);
    Statistical.filter(*cloud_source_ptr);

/* 
	//设定结晶参数
	bool disable_transform = pcl::console::find_switch(argc, argv, "--NT");
 
	float voxel_resolution = 0.008f;
	bool voxel_res_specified = pcl::console::find_switch(argc, argv, "-v");
	if (voxel_res_specified)
		pcl::console::parse(argc, argv, "-v", voxel_resolution);
 
	float seed_resolution = 0.1f;
	bool seed_res_specified = pcl::console::find_switch(argc, argv, "-s");
	if (seed_res_specified)
		pcl::console::parse(argc, argv, "-s", seed_resolution);
 
	float color_importance = 0.2f;
	if (pcl::console::find_switch(argc, argv, "-c"))
		pcl::console::parse(argc, argv, "-c", color_importance);
 
	float spatial_importance = 0.4f;
	if (pcl::console::find_switch(argc, argv, "-z"))
		pcl::console::parse(argc, argv, "-z", spatial_importance);
 
	float normal_importance = 1.0f;
	if (pcl::console::find_switch(argc, argv, "-n"))
		pcl::console::parse(argc, argv, "-n", normal_importance);
 */
    float voxel_resolution = 0.008f;
    float seed_resolution = 0.1f;
    float color_importance = 0.2f;
    float spatial_importance = 0.4f;
    float normal_importance = 1.0f;
	//////////////////////////////  //////////////////////////////
	////// This is how to use supervoxels
	//////////////////////////////  //////////////////////////////

	//输入点云及结晶参数
	pcl::SupervoxelClustering<PointT> super(voxel_resolution, seed_resolution);
	//if (disable_transform)
	//	super.setUseSingleCameraTransform(false);
	super.setInputCloud(cloud_source_ptr);
	super.setColorImportance(color_importance);
	super.setSpatialImportance(spatial_importance);
	super.setNormalImportance(normal_importance);
	//输出结晶分割结果：结果是一个映射表
	std::map <uint32_t, pcl::Supervoxel<PointT>::Ptr > supervoxel_clusters;
 
	pcl::console::print_highlight("Extracting supervoxels!\n");
	super.extract(supervoxel_clusters);
	pcl::console::print_info("Found %d supervoxels\n", supervoxel_clusters.size());
 
	//boost::shared_ptr<pcl::visualization::PCLVisualizer> viewer(new pcl::visualization::PCLVisualizer("3D Viewer"));
    pcl::visualization::PCLVisualizer::Ptr viewer (new pcl::visualization::PCLVisualizer ("3D Viewer"));
	viewer->setBackgroundColor(0, 0, 0);
	//获得晶体中心
	PointCloudT::Ptr voxel_centroid_cloud = super.getVoxelCentroidCloud();
	viewer->addPointCloud(voxel_centroid_cloud, "voxel centroids");
	viewer->setPointCloudRenderingProperties(pcl::visualization::PCL_VISUALIZER_POINT_SIZE, 2.0, "voxel centroids");
	viewer->setPointCloudRenderingProperties(pcl::visualization::PCL_VISUALIZER_OPACITY, 0.95, "voxel centroids");
	//获得晶体
    PointLCloudT::Ptr labeled_voxel_cloud = super.getLabeledVoxelCloud ();
    viewer->addPointCloud<pcl::PointXYZL>(labeled_voxel_cloud, "labeled voxels");
    //viewer->addPointCloud<pcl::PointXYZL> (labeled_voxel_cloud, std::string("labeled voxels"), 0);//重点在于<pcl::PointXYZL> ，不加则出错
    viewer->setPointCloudRenderingProperties (pcl::visualization::PCL_VISUALIZER_OPACITY,0.8, "labeled voxels");
 
	PointNCloudT::Ptr sv_normal_cloud = super.makeSupervoxelNormalCloud(supervoxel_clusters);
	//We have this disabled so graph is easy to see, uncomment to see supervoxel normals
	//viewer->addPointCloudNormals<PointNT> (sv_normal_cloud,1,0.05f, "supervoxel_normals");
	//将相连的晶体中心连起来并显示 
	pcl::console::print_highlight("Getting supervoxel adjacency\n");
	std::multimap<uint32_t, uint32_t> supervoxel_adjacency;
	super.getSupervoxelAdjacency(supervoxel_adjacency);
	//To make a graph of the supervoxel adjacency, we need to iterate through the supervoxel adjacency multimap
	std::multimap<uint32_t, uint32_t>::iterator label_itr = supervoxel_adjacency.begin();
	for (; label_itr != supervoxel_adjacency.end(); )
	{
		//First get the label
		uint32_t supervoxel_label = label_itr->first;
		//Now get the supervoxel corresponding to the label
		pcl::Supervoxel<PointT>::Ptr supervoxel = supervoxel_clusters.at(supervoxel_label);
 
		//Now we need to iterate through the adjacent supervoxels and make a point cloud of them
		PointCloudT adjacent_supervoxel_centers;
		std::multimap<uint32_t, uint32_t>::iterator adjacent_itr = supervoxel_adjacency.equal_range(supervoxel_label).first;
		for (; adjacent_itr != supervoxel_adjacency.equal_range(supervoxel_label).second; ++adjacent_itr)
		{
			pcl::Supervoxel<PointT>::Ptr neighbor_supervoxel = supervoxel_clusters.at(adjacent_itr->second);
			adjacent_supervoxel_centers.push_back(neighbor_supervoxel->centroid_);
		}
		//Now we make a name for this polygon
		std::stringstream ss;
		ss << "supervoxel_" << supervoxel_label;
		//This function is shown below, but is beyond the scope of this tutorial - basically it just generates a "star" polygon mesh from the points given
		addSupervoxelConnectionsToViewer(supervoxel->centroid_, adjacent_supervoxel_centers, ss.str(), viewer);
		//Move iterator forward to next label
		label_itr = supervoxel_adjacency.upper_bound(supervoxel_label);
	}
 
	while (!viewer->wasStopped())
	{
		viewer->spinOnce(500);
	}

/*
        //设定结晶参数
    float voxel_resolution = 0.008f;
    float seed_resolution = 0.1f;
    float color_importance = 0.2f;
    float spatial_importance = 0.4f;
    float normal_importance = 1.0f;
    
    //生成结晶器
    pcl::SupervoxelClustering<pcl::PointXYZRGB> super (voxel_resolution, seed_resolution);
    //和点云形式有关
    //if (disable_transform)
    //    super.setUseSingleCameraTransform (false);
    //输入点云及结晶参数
    super.setInputCloud (cloud_source_ptr);
    super.setColorImportance (color_importance);
    super.setSpatialImportance (spatial_importance);
    super.setNormalImportance (normal_importance);
    //输出结晶分割结果：结果是一个映射表
    std::map <uint32_t, pcl::Supervoxel<pcl::PointXYZRGB>::Ptr > supervoxel_clusters;
    super.extract (supervoxel_clusters);
    //获得晶体中心
    pcl::PointCloud<pcl::PointXYZRGB>::Ptr voxel_centroid_cloud = super.getVoxelCentroidCloud ();
    //获得晶体
    pcl::PointCloud<pcl::PointXYZL>::Ptr labeled_voxel_cloud = super.getLabeledVoxelCloud ();


    //将相连的晶体中心连起来并显示 
    std::multimap<uint32_t, uint32_t> supervoxel_adjacency;
    super.getSupervoxelAdjacency (supervoxel_adjacency);
    std::multimap<uint32_t,uint32_t>::iterator label_itr = supervoxel_adjacency.begin ();
    for ( ; label_itr != supervoxel_adjacency.end (); )
    {
        //First get the label
        uint32_t supervoxel_label = label_itr->first;
        //Now get the supervoxel corresponding to the label
        pcl::Supervoxel<pcl::PointXYZRGB>::Ptr supervoxel = supervoxel_clusters.at (supervoxel_label);

        //Now we need to iterate through the adjacent supervoxels and make a point cloud of them
        pcl::PointCloud<pcl::PointXYZRGBA> adjacent_supervoxel_centers;
        std::multimap<uint32_t,uint32_t>::iterator adjacent_itr = supervoxel_adjacency.equal_range (supervoxel_label).first;
        for ( ; adjacent_itr!=supervoxel_adjacency.equal_range (supervoxel_label).second; ++adjacent_itr)
        {
        pcl::Supervoxel<pcl::PointXYZRGB>::Ptr neighbor_supervoxel = supervoxel_clusters.at (adjacent_itr->second);
        adjacent_supervoxel_centers.push_back (neighbor_supervoxel->centroid_);
        }
        //Now we make a name for this polygon
        std::stringstream ss;
        ss << "supervoxel_" << supervoxel_label;
        //This function is shown below, but is beyond the scope of this tutorial - basically it just generates a "star" polygon mesh from the points given
        addSupervoxelConnectionsToViewer (supervoxel->centroid_, adjacent_supervoxel_centers, ss.str (), viewer);
        //Move iterator forward to next label
        label_itr = supervoxel_adjacency.upper_bound (supervoxel_label);
    }
*/
}

void addSupervoxelConnectionsToViewer(PointT &supervoxel_center,
    	PointCloudT &adjacent_supervoxel_centers,
    	std::string supervoxel_name,
    	boost::shared_ptr<pcl::visualization::PCLVisualizer> & viewer)
    {
    	vtkSmartPointer<vtkPoints> points = vtkSmartPointer<vtkPoints>::New();
    	vtkSmartPointer<vtkCellArray> cells = vtkSmartPointer<vtkCellArray>::New();
    	vtkSmartPointer<vtkPolyLine> polyLine = vtkSmartPointer<vtkPolyLine>::New();
     
    	//Iterate through all adjacent points, and add a center point to adjacent point pair
    	PointCloudT::iterator adjacent_itr = adjacent_supervoxel_centers.begin();
    	for (; adjacent_itr != adjacent_supervoxel_centers.end(); ++adjacent_itr)
    	{
    		points->InsertNextPoint(supervoxel_center.data);
    		points->InsertNextPoint(adjacent_itr->data);
    	}
    	// Create a polydata to store everything in
    	vtkSmartPointer<vtkPolyData> polyData = vtkSmartPointer<vtkPolyData>::New();
    	// Add the points to the dataset
    	polyData->SetPoints(points);
    	polyLine->GetPointIds()->SetNumberOfIds(points->GetNumberOfPoints());
    	for (unsigned int i = 0; i < points->GetNumberOfPoints(); i++)
    		polyLine->GetPointIds()->SetId(i, i);
    	cells->InsertNextCell(polyLine);
    	// Add the lines to the dataset
    	polyData->SetLines(cells);
    	viewer->addModelFromPolyData(polyData, supervoxel_name);
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
    ros::init(argc, argv, "hdy_lccp");
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