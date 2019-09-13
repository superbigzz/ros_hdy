#!/usr/bin/env python

import rospy
from std_msgs.msg import Bool

def callback(data):
    rospy.loginfo(rospy.get_caller_id()+"i received %d", data.data)

def listener():
    rospy.init_node('listener', anonymous=True)
    rospy.Subscriber("bool", Bool, callback)
    rospy.spin
 
if __name__ == '__main__':
    try:
        listener()
    except rospy.ROSInterruptException:
        pass