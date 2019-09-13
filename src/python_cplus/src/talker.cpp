#include "ros/ros.h"
#include "std_msgs/String.h"
#include "std_msgs/Bool.h"
 
int main(int argc, char *argv[])
{
    //初始化ros，名字重映射（唯一），必须为base name，不含/
	ros::init(argc, argv, "talker");
    //为进程创建一个句柄，第一个创建的nodehandle初始化节点
	ros::NodeHandle nh;
    //告诉主机要在chatter topic上发布一个std_msgs消息
    //主机会订阅所有chatter topic 节点，参数表示发布队列的大小（先进先出）

	ros::Publisher flag_pub = nh.advertise<std_msgs::Bool>("bool", 10);
    ros::Rate loop_rate(5);  //自循环频率
    int count = 0;
    while(ros::ok())
    {
        std_msgs::Bool msg;
        msg.data = true;
        
        flag_pub.publish(msg);
        std::cout << "send flag" << std::endl;
        std::cout << msg << std::endl;
        count ++;
        std::cout << count << std::endl;

        ros::spinOnce();
        loop_rate.sleep();
    }

	return 0;
}