# CMake generated Testfile for 
# Source directory: /home/hdy/catkin_ws/src/rgbd_launch
# Build directory: /home/hdy/catkin_ws/build/rgbd_launch
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(_ctest_rgbd_launch_roslaunch-check_launch "/home/hdy/catkin_ws/build/catkin_generated/env_cached.sh" "/usr/bin/python" "/opt/ros/kinetic/share/catkin/cmake/test/run_tests.py" "/home/hdy/catkin_ws/build/test_results/rgbd_launch/roslaunch-check_launch.xml" "--return-code" "/usr/bin/cmake -E make_directory /home/hdy/catkin_ws/build/test_results/rgbd_launch" "/opt/ros/kinetic/share/roslaunch/cmake/../scripts/roslaunch-check -o '/home/hdy/catkin_ws/build/test_results/rgbd_launch/roslaunch-check_launch.xml' '/home/hdy/catkin_ws/src/rgbd_launch/launch' ")
add_test(_ctest_rgbd_launch_roslaunch-check_test "/home/hdy/catkin_ws/build/catkin_generated/env_cached.sh" "/usr/bin/python" "/opt/ros/kinetic/share/catkin/cmake/test/run_tests.py" "/home/hdy/catkin_ws/build/test_results/rgbd_launch/roslaunch-check_test.xml" "--return-code" "/usr/bin/cmake -E make_directory /home/hdy/catkin_ws/build/test_results/rgbd_launch" "/opt/ros/kinetic/share/roslaunch/cmake/../scripts/roslaunch-check -o '/home/hdy/catkin_ws/build/test_results/rgbd_launch/roslaunch-check_test.xml' '/home/hdy/catkin_ws/src/rgbd_launch/test' ")
add_test(_ctest_rgbd_launch_rostest_test_camera.test "/home/hdy/catkin_ws/build/catkin_generated/env_cached.sh" "/usr/bin/python" "/opt/ros/kinetic/share/catkin/cmake/test/run_tests.py" "/home/hdy/catkin_ws/build/test_results/rgbd_launch/rostest-test_camera.xml" "--return-code" "/opt/ros/kinetic/share/rostest/cmake/../../../bin/rostest --pkgdir=/home/hdy/catkin_ws/src/rgbd_launch --package=rgbd_launch --results-filename test_camera.xml --results-base-dir \"/home/hdy/catkin_ws/build/test_results\" /home/hdy/catkin_ws/src/rgbd_launch/test/camera.test ")