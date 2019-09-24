/*********************************************************************
* Software License Agreement (BSD License)
* 
*  Copyright (c) 2017-2020, Waterplus http://www.6-robot.com
*  All rights reserved.
* 
*  Redistribution and use in source and binary forms, with or without
*  modification, are permitted provided that the following conditions
*  are met:
* 
*   * Redistributions of source code must retain the above copyright
*     notice, this list of conditions and the following disclaimer.
*   * Redistributions in binary form must reproduce the above
*     copyright notice, this list of conditions and the following
*     disclaimer in the documentation and/or other materials provided
*     with the distribution.
*   * Neither the name of the WaterPlus nor the names of its
*     contributors may be used to endorse or promote products derived
*     from this software without specific prior written permission.
* 
*  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
*  "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
*  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
*  FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
*  COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
*  FOOTPRINTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
*  BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
*  LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
*  CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
*  LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
*  ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
*  POSSIBILITY OF SUCH DAMAGE.
*********************************************************************/
/* @author Zhang Wanjie                                             */
#include <ros/ros.h>
#include <std_msgs/String.h>
#include "wpb_home_tutorials/Follow.h"
#include <geometry_msgs/Twist.h>
#include "xfyun_waterplus/IATSwitch.h"
#include <sound_play/SoundRequest.h>
#include "wpb_home_tutorials/Follow.h"
#include <move_base_msgs/MoveBaseAction.h>
#include <actionlib/client/simple_action_client.h>
#include <waterplus_map_tools/Waypoint.h>
#include <waterplus_map_tools/GetWaypointByName.h>
#include <tf/transform_listener.h>
#include <geometry_msgs/PoseStamped.h>
#include "std_msgs/Bool.h"
#include "cv_bridge/cv_bridge.h"
#include <image_transport/image_transport.h>

using namespace std;

#define STATE_READY     0
#define STATE_FOLLOW    1
#define STATE_ASK       2
#define STATE_GOTO      3
#define STATE_OBJDET    4
#define STATE_COMEBACK  5
#define STATE_TAKE      6

#define action_water    1
#define action_book     2
#define action_chess    3

typedef actionlib::SimpleActionClient<move_base_msgs::MoveBaseAction> MoveBaseClient;
static string strGoto;
static sound_play::SoundRequest spk_msg;
static ros::Publisher spk_pub;
static ros::Publisher vel_pub;
static string strToSpeak = "";
static string strKeyWord = "";
static ros::ServiceClient clientIAT;
static xfyun_waterplus::IATSwitch srvIAT;
static ros::ServiceClient cliGetWPName;
static waterplus_map_tools::GetWaypointByName srvName;
static ros::Publisher add_waypoint_pub;
static ros::ServiceClient follow_start;
static ros::ServiceClient follow_stop;
static ros::ServiceClient follow_resume;
static wpb_home_tutorials::Follow srvFlw;
static ros::Publisher behaviors_pub;
static std_msgs::String behavior_msg;

static int nState = STATE_READY;
static int nDelay = 0;
int backflag;
std::string action;
cv::Mat sendImage;
sensor_msgs::Image pubImage;

static vector<string> arKeyword;
static vector<string> commandword;
std::string OriginPose;
geometry_msgs::PoseStamped CurrentPose;
// 添加航点关键词
void InitKeyword()
{
    arKeyword.push_back("start");   //机器人开始启动的地点,最后要回去
    arKeyword.push_back("kitchen");
    arKeyword.push_back("study");
    arKeyword.push_back("living");

    commandword.push_back("跟着我");   //机器人开始启动的地点,最后要回去
    commandword.push_back("厨房");
    commandword.push_back("书房");
    commandword.push_back("客厅");
    commandword.push_back("拿水");
    commandword.push_back("拿书");
    commandword.push_back("下棋");
}

// 从句子里找arKeyword里存在的关键词
static string FindKeyword(string inSentence)
{
    string res = "";
    int nSize = arKeyword.size();
    for(int i=0;i<nSize;i++)
    {
        int nFindIndex = inSentence.find(arKeyword[i]);
        if(nFindIndex >= 0)
        {
            res = arKeyword[i];
            break;
        }
    }
    return res;
}

// 将机器人当前位置保存为新航点
void AddNewWaypoint(string inStr)
{
    tf::TransformListener listener;
    tf::StampedTransform transform;
    try
    {
        listener.waitForTransform("/map","/base_footprint",  ros::Time(0), ros::Duration(10.0) );
        listener.lookupTransform("/map","/base_footprint", ros::Time(0), transform);
    }
    catch (tf::TransformException &ex) 
    {
        ROS_ERROR("[lookupTransform] %s",ex.what());
        return;
    }

    float tx = transform.getOrigin().x();
    float ty = transform.getOrigin().y();
    tf::Stamped<tf::Pose> p = tf::Stamped<tf::Pose>(tf::Pose(transform.getRotation() , tf::Point(tx, ty, 0.0)), ros::Time::now(), "map");
    geometry_msgs::PoseStamped new_pos;
    tf::poseStampedTFToMsg(p, new_pos);

    waterplus_map_tools::Waypoint new_waypoint;
    new_waypoint.name = inStr;
    new_waypoint.pose = new_pos.pose;
    add_waypoint_pub.publish(new_waypoint);

    ROS_WARN("[New Waypoint] %s ( %.2f , %.2f )" , new_waypoint.name.c_str(), tx, ty);
}

// 获取机器人当前位置
void GetCurrentPose()
{
    tf::TransformListener listener;
    tf::StampedTransform transform;
    try
    {
        listener.waitForTransform("/map","/base_footprint",  ros::Time(0), ros::Duration(10.0) );
        listener.lookupTransform("/map","/base_footprint", ros::Time(0), transform);
    }
    catch (tf::TransformException &ex) 
    {
        ROS_ERROR("[lookupTransform] %s",ex.what());
        return;
    }

    float tx = transform.getOrigin().x();
    float ty = transform.getOrigin().y();
    tf::Stamped<tf::Pose> p = tf::Stamped<tf::Pose>(tf::Pose(transform.getRotation() , tf::Point(tx, ty, 0.0)), ros::Time::now(), "map");

    tf::poseStampedTFToMsg(p, CurrentPose);

    //ROS_WARN("[New Waypoint] %s ( %.2f , %.2f )" , new_waypoint.name.c_str(), tx, ty);
}

// 语音说话
void Speak(string inStr)
{
    std_msgs::String spk_str;
    spk_str.data = inStr;
    spk_pub.publish(spk_str);
}

// 跟随模式开关
static void FollowSwitch(bool inActive, float inDist)
{
    if(inActive == true)
    {
        srvFlw.request.thredhold = inDist;
        if (!follow_start.call(srvFlw))
        {
            ROS_WARN("[CActionManager] - follow start failed...");
        }
    }
    else
    {
        if (!follow_stop.call(srvFlw))
        {
            ROS_WARN("[CActionManager] - failed to stop following...");
        }
    }
}


// 语音识别结果处理函数
void KeywordCB(const std_msgs::String::ConstPtr & msg)
{
    ROS_WARN("------ Keyword = %s ------",msg->data.c_str());
    if(nState == STATE_FOLLOW)
    {
        /*
        // 从识别结果句子中查找物品（航点）关键词
        string strKeyword = FindKeyword(msg->data);
        int nLenOfKW = strlen(strKeyword.c_str());
        if(nLenOfKW > 0)
        {
            // 发现物品（航点）关键词
            AddNewWaypoint(strKeyword);
            //string strSpeak = strKeyword + " . OK. I have memoried. Next one , please"; 
            //Speak(strSpeak);
        }
        */
        // 停止跟随的指令
        int nFindIndex = msg->data.find("停止跟随");
        if(nFindIndex >= 0)
        {
            FollowSwitch(false, 0);
            //AddNewWaypoint("master");
            nState = STATE_ASK;
            nDelay = 0;
            Speak("好的收到");
        }
    }

    if(nState == STATE_ASK)
    {
        std::string listen;
        int key = -1;
        int key2 = -1;
        listen = msg->data;
        backflag = 0;
        //OriginPose = strGoto;
        for(int i = 0; i < commandword.size(); i++)
        {
            key = listen.find(commandword[i]);
            if(key >=0)
            {
                if(i == 0)
                {
                    nState = STATE_FOLLOW;       
                    ROS_INFO("FOLLOW");
                }
                else if(i >= 1 && i < 4)
                {
                    strGoto = arKeyword[i];
                    nState = STATE_GOTO;
                    for(int j = 4; j < commandword.size(); j++)
                    {
                        key2  = listen.find(commandword[i]);
                        if(key2 >= 0)
                        {
                            backflag = 1;
                            action = commandword[i];
                        }
                    }
                    //ROS_INFO(arKeyword[i]);
                }
                else if(i >= 4)
                {
                    nState = STATE_GOTO;
                    strGoto = arKeyword[i-3];
                    backflag = 1;
                    GetCurrentPose();

                }
                break;
            }
        }
            // 从识别结果句子中查找物品（航点）关键词
            //string strKeyword = FindKeyword(msg->data);
            //int nLenOfKW = strlen(strKeyword.c_str());
            //if(nLenOfKW > 0)
            //{
                // 发现物品（航点）关键词
                //strGoto = strKeyword;
                //string strSpeak = strKeyword + " . OK. I will go to get it for you."; 
                //Speak(strSpeak);
                //nState = STATE_GOTO;
    }
}

bool detect_flag;
/****订阅物体检测标志位，回调函数****/
void FlagCallback(const std_msgs::Bool::ConstPtr& msg)
{
    detect_flag = msg;
    //ROS_INFO("detect_flag: %d", detect_flag); 
}
/****订阅图像回调函数****/
void ImageCallback(const sensor_msgs::ImageConstPtr& msg)
{
    pubImage = *msg;
    /*
    cv_bridge::CvImagePtr pCvImage;
    try
    {
        pCvImage = cv_bridge::toCvCopy(msg, sensor_msgs::image_encodings::BGR8);
        sendImage = pCvImage->image;
        ROS_INFO("RECEIVED");
    }
    catch(cv_bridge::Exception& e)
    {
        ROS_ERROR("cv::bridge exception: %s", e.what());
        //ROS_INFO("RECEIVED ERROR");
        return;
    }
    */
    //ROS_INFO("CALLBACK");
    //cv::waitKey(1);
    //ROS_INFO("detect_flag: %d", detect_flag); 
    //sendImage = *msgImage;
    //sendImage.encoding = "bgr8";
    //msgImage.copyTo(sendImage);
}

int main(int argc, char** argv)
{
    ros::init(argc, argv, "hdy_home");

    ros::NodeHandle n;
    ros::Subscriber sub_sr = n.subscribe("/xfyun/iat", 10, KeywordCB);
    follow_start = n.serviceClient<wpb_home_tutorials::Follow>("wpb_home_follow/start");
    follow_stop = n.serviceClient<wpb_home_tutorials::Follow>("wpb_home_follow/stop");
    follow_resume = n.serviceClient<wpb_home_tutorials::Follow>("wpb_home_follow/resume");
    cliGetWPName = n.serviceClient<waterplus_map_tools::GetWaypointByName>("/waterplus/get_waypoint_name");
    add_waypoint_pub = n.advertise<waterplus_map_tools::Waypoint>( "/waterplus/add_waypoint", 1);
    //spk_pub = n.advertise<sound_play::SoundRequest>("/robotsound", 20);
    spk_pub = n.advertise<std_msgs::String>("/xfyun/tts", 20);
    //spk_msg.sound = sound_play::SoundRequest::SAY;
    //spk_msg.command = sound_play::SoundRequest::PLAY_ONCE;
    vel_pub = n.advertise<geometry_msgs::Twist>("/cmd_vel", 10);
    clientIAT = n.serviceClient<xfyun_waterplus::IATSwitch>("xfyun_waterplus/IATSwitch");
    behaviors_pub = n.advertise<std_msgs::String>("/wpb_home/behaviors", 30);

    ros::Subscriber image_sub = n.subscribe("/kinect2/qhd/image_color", 1, ImageCallback);
    ros::Subscriber detect_sub = n.subscribe("detect_flag", 1, FlagCallback);
    ros::Publisher arrive_pub = n.advertise<std_msgs::String>("arrive_action", 1);
    ros::Publisher image_pub = n.advertise<sensor_msgs::Image>("hdy_home/image_detection", 1);

    InitKeyword();

    OriginPose = "start";

    ROS_WARN("[main] hdy_home");
    ros::Rate r(30);
    while(ros::ok())
    {
        // 1、刚启动，准备
        if(nState == STATE_READY)
        {
            // 启动后延迟一段时间然后开始跟随
            nDelay ++;
            // ROS_WARN("[STATE_READY] - nDelay = %d", nDelay);
            if(nDelay > 100)
            {
                AddNewWaypoint("start");
                nDelay = 0;
                nState = STATE_ASK;
            }
        }

        // 2、跟随阶段
        if(nState == STATE_FOLLOW)
        {
            if(nDelay == 0)
            {
               FollowSwitch(true, 0.6);
            }
            nDelay ++;
        }

        // 3、询问要去哪个航点
        if(nState == STATE_ASK)
        {
            
        }

        // 4、导航去指定航点
        if(nState == STATE_GOTO)
        {
            srvName.request.name = strGoto;
            if (cliGetWPName.call(srvName))
            {
                std::string name = srvName.response.name;
                float x = srvName.response.pose.position.x;
                float y = srvName.response.pose.position.y;
                ROS_INFO("[STATE_GOTO] Get_wp_name = %s (%.2f,%.2f)", strGoto.c_str(),x,y);

                MoveBaseClient ac("move_base", true);
                if(!ac.waitForServer(ros::Duration(5.0)))
                {
                    ROS_INFO("The move_base action server is no running. action abort...");
                }
                else
                {
                    move_base_msgs::MoveBaseGoal goal;
                    goal.target_pose.header.frame_id = "map";
                    goal.target_pose.header.stamp = ros::Time::now();
                    goal.target_pose.pose = srvName.response.pose;
                    ac.sendGoal(goal);
                    ac.waitForResult();
                    if(ac.getState() == actionlib::SimpleClientGoalState::SUCCEEDED)
                    {
                        ROS_INFO("Arrived at %s!",strGoto.c_str());
                        Speak("我已抵达.");
                        if(backflag == 1)nState = STATE_OBJDET;
                        else nState = STATE_ASK;
                        nDelay = 0;
                    }
                    else
                    {
                        ROS_INFO("Failed to get to %s ...",strGoto.c_str() );
                        Speak("无法抵达");
                        if(backflag == 1)nState = STATE_OBJDET;
                        else nState = STATE_ASK;
                    }
                }
                
            }
            else
            {
                ROS_ERROR("Failed to call service GetWaypointByName");
                Speak("没有该地点");
                nState = STATE_ASK;
            }
        }

        // 5、检测物体
        if(nState == STATE_OBJDET)
        {
            //bool arrive_flag = action;
            detect_flag = 0;
            /* 
            //发送到达标志位
            ros::NodeHandle ndetect;
            ros::Subscriber detect_sub = ndetect.subscribe("detect_flag", 1, FlagCallback);
            ros::Publisher arrive_pub = ndetect.advertise<std_msgs::String>("arrive_action", 1);
            //ndetect.setParam("image_topic", "/kinect2/qhd/image_color");
            ros::NodeHandle nreceive;
            ros::Subscriber image_sub = nreceive.subscribe("/kinect2/qhd/image_color", 1, ImageCallback);
            //ros::Subscriber class_sub = ndetect.subscribe("object_class", 1, ClassCallback);
            ros::NodeHandle narrive;
            //image_transport::ImageTransport it(narrive); 
            //image_transport::Publisher image_pub = it.advertise("hdy_home/image_detection", 1);
            //sensor_msgs::ImagePtr msg = cv_bridge::CvImage(std_msgs::Header(), "bgr8", sendImage).toImageMsg();
            ros::Publisher image_pub = narrive.advertise<sensor_msgs::Image>("hdy_home/image_detection", 1);
            */
            ros::Rate loop_rate(10);  //自循环频率

            while(ros::ok())
            {
                std_msgs::String msgAction;
                msgAction.data = action;

                //sensor_msgs::Image Imagemsg;
                //Imagemsg.data = sendImage;

                arrive_pub.publish(msgAction);
          
                image_pub.publish(pubImage);
    
                //ROS_INFO("DETETCING");
                if(detect_flag == 1)
                {
                    Speak("已检测到物品");
                    nState = STATE_COMEBACK;
                    //narrive.setParam("image_topic", "");
                    break;
                }

                ros::spinOnce();
                loop_rate.sleep();
            }
        }
        // 6、回来
        if(nState == STATE_COMEBACK)
        {
            MoveBaseClient ac("move_base", true);
            if(!ac.waitForServer(ros::Duration(5.0)))
            {
                ROS_INFO("The move_base action server is no running. action abort...");
            }
            else
            {
                move_base_msgs::MoveBaseGoal goal;
                goal.target_pose.header.frame_id = "map";
                goal.target_pose.header.stamp = ros::Time::now();
                goal.target_pose.pose = CurrentPose.pose;
                ac.sendGoal(goal);
                ac.waitForResult();
                if(ac.getState() == actionlib::SimpleClientGoalState::SUCCEEDED)
                {
                    ROS_INFO("Arrived at %s!",strGoto.c_str());
                    Speak("我已回来");
                    nState = STATE_ASK;
                    nDelay = 0;
                }
                else
                {
                    ROS_INFO("Failed to get to %s ...",strGoto.c_str() );
                    Speak("无法回到");
                    nState = STATE_ASK;
                }
            }
        }
        
        ros::spinOnce();
        r.sleep();
    }

    return 0;
}