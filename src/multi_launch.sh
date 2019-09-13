#!/bin/bash

roslaunch wpb_home_apps innovation.launch &
sleep 1
echo "launch innovation successfully"

roslaunch tensorflow_object_detection ros_tensorflow_objection.launch &
sleep 1
echo "launch ros_tensorflow_objection successfully"

wait
exit 0
