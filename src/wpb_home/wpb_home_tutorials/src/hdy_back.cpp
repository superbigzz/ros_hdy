#include <ros/ros.h>
#include <move_base_msgs/MoveBaseAction.h>
#include <actionlib/client/simple_action_client.h>
#include <tf/tf.h>
#include <tf/transform_listener.h>
#include <visualization_msgs/Marker.h>
#include "std_msgs/Bool.h"

typedef actionlib::SimpleActionClient<move_base_msgs::MoveBaseAction> MoveBaseClient_my;

geometry_msgs::PoseStamped goal;
move_base_msgs::MoveBaseGoal goalpoint;
bool Callback_flag = false;
bool arrive_flag = 0;
bool detect_flag = 0;

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

/*
void SendArriveFlag()
{
	ros::NodeHandle flagn;
    //告诉主机要在chatter topic上发布一个std_msgs消息
    //主机会订阅所有chatter topic 节点，参数表示发布队列的大小（先进先出）

	ros::Publisher flag_pub = flagn.advertise<std_msgs::Bool>("bool", 1);
    ros::Rate loop_rate(10);  //自循环频率
    int count = 0;
    while(count < 5)
    {
        std_msgs::Bool msg;
        msg.data = arrive_flag; 
        flag_pub.publish(msg);
        loop_rate.sleep();
        count ++;
    } 
    //ros::spinOnce();
    //loop_rate.sleep();
}
*/
/****订阅物体检测标志位，回调函数****/
void FlagCallback(const std_msgs::Bool::ConstPtr& msg)
{
    detect_flag = msg;
    //ROS_INFO("detect_flag: %d", detect_flag); 
}

/*
//订阅物体检测标志位函数
void ReceiveDetectFlag()
{
  ros::NodeHandle nFlag;
  // 告诉master需要订阅chatter topic消息
  ros::Subscriber flag_sub = nFlag.subscribe("bool", 1, FlagCallback);
  ROS_INFO("ReceiveDetectFlag");
  ros::spinOnce(); // 自循环
}
*/

/****发送目标点****/
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
        arrive_flag = 1;
    }
    else
    {
        ROS_INFO("failed to arrive goal");
        arrive_flag = 0;
    }
    
}

/****订阅目标获取，回调函数****/
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

/*
int main(int argc, char** argv)
{
    ros::init(argc, argv, "hdy_back");
    ros::NodeHandle n;
    ros::Subscriber subpoint = n.subscribe("/move_base_simple/goal", 1, poseCallback);
    ROS_INFO("MARK1");

    while(ros::ok())
    {
        //ROS_INFO("in the loop");
        if(Callback_flag == true)
        {
            ROS_INFO("message has been received");
            InitGoal();
            SendGoal();
            ROS_INFO("back");
            InitOringin();
            SendGoal();
            Callback_flag = false;
        }
        else{}
        ros::spinOnce();
    }
    return 0;
}
*/
int main(int argc, char** argv)
{
    ros::init(argc, argv, "hdy_back");
    
    //ROS_INFO("HSDFHKSDJAFJA");
    //订阅goal消息
    ros::NodeHandle n;
    ros::Subscriber subpoint = n.subscribe("/move_base_simple/goal", 1, poseCallback);
    //订阅检测标志位消息
    ros::NodeHandle ndetect;
    ros::Subscriber detect_sub = ndetect.subscribe("detect_flag", 1, FlagCallback);

    //发送到达标志位
    ros::NodeHandle narrive;
    ros::Publisher arrive_pub = narrive.advertise<std_msgs::Bool>("arrive_flag", 1);

    detect_flag = 0;
    arrive_flag = 0;

    ros::Rate loop_rate(10);  //自循环频率

    while(ros::ok())
    {
        
        std_msgs::Bool msg;
        msg.data = arrive_flag; 
        
        //ROS_INFO("in the loop");
        if(Callback_flag == 1 && arrive_flag == 0)
        {
            ROS_INFO("message has been received");
            InitGoal();
            SendGoal();
            //SendArriveFlag();
            Callback_flag = 0;
        }

        /*
        while(detect_flag == 0)
        {
            ROS_INFO("wait for the detection flag");
            ReceiveDetectFlag();
        }
        */

        if(detect_flag == 1 && arrive_flag == 1)
        {
            ROS_INFO("back");
            InitOringin();
            SendGoal();
            //ROS_INFO("end!");
            arrive_flag = 0;
            //Callback_flag = 0;
            detect_flag = 0;
        }

        arrive_pub.publish(msg);
        loop_rate.sleep();
        ros::spinOnce();
    }
    return 0;
}