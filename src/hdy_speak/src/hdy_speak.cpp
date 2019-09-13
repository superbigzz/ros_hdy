#include <ros/ros.h>
#include <sound_play/SoundRequest.h>
int main(int argc, char** argv)
{
 ros::init(argc, argv, "hdy_speak");
 ros::NodeHandle n;
 ros::Publisher tts_pub = n.advertise<sound_play::SoundRequest>("/robotsound", 20);
 ros::Rate r(0.2);
 while(n.ok())
 {
    sound_play::SoundRequest sp;
    sp.sound = sound_play::SoundRequest::SAY;
    sp.command = sound_play::SoundRequest::PLAY_ONCE;
    sp.volume = 2.0;
    sp.arg = "hello world";
    ROS_INFO("SAY ONE TIME");
    tts_pub.publish(sp);
    ros::spinOnce();
    r.sleep();
 }
 return 0;
}