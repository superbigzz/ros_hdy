# Install script for directory: /home/hdy/catkin_ws/src

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/hdy/catkin_ws/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  
      if (NOT EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}")
        file(MAKE_DIRECTORY "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}")
      endif()
      if (NOT EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/.catkin")
        file(WRITE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/.catkin" "")
      endif()
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/hdy/catkin_ws/install/_setup_util.py")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/hdy/catkin_ws/install" TYPE PROGRAM FILES "/home/hdy/catkin_ws/build/catkin_generated/installspace/_setup_util.py")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/hdy/catkin_ws/install/env.sh")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/hdy/catkin_ws/install" TYPE PROGRAM FILES "/home/hdy/catkin_ws/build/catkin_generated/installspace/env.sh")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/hdy/catkin_ws/install/setup.bash;/home/hdy/catkin_ws/install/local_setup.bash")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/hdy/catkin_ws/install" TYPE FILE FILES
    "/home/hdy/catkin_ws/build/catkin_generated/installspace/setup.bash"
    "/home/hdy/catkin_ws/build/catkin_generated/installspace/local_setup.bash"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/hdy/catkin_ws/install/setup.sh;/home/hdy/catkin_ws/install/local_setup.sh")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/hdy/catkin_ws/install" TYPE FILE FILES
    "/home/hdy/catkin_ws/build/catkin_generated/installspace/setup.sh"
    "/home/hdy/catkin_ws/build/catkin_generated/installspace/local_setup.sh"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/hdy/catkin_ws/install/setup.zsh;/home/hdy/catkin_ws/install/local_setup.zsh")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/hdy/catkin_ws/install" TYPE FILE FILES
    "/home/hdy/catkin_ws/build/catkin_generated/installspace/setup.zsh"
    "/home/hdy/catkin_ws/build/catkin_generated/installspace/local_setup.zsh"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/hdy/catkin_ws/install/.rosinstall")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/hdy/catkin_ws/install" TYPE FILE FILES "/home/hdy/catkin_ws/build/catkin_generated/installspace/.rosinstall")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/hdy/catkin_ws/build/gtest/cmake_install.cmake")
  include("/home/hdy/catkin_ws/build/audio_common/audio_common/cmake_install.cmake")
  include("/home/hdy/catkin_ws/build/iai_kinect2/iai_kinect2/cmake_install.cmake")
  include("/home/hdy/catkin_ws/build/audio_common/audio_common_msgs/cmake_install.cmake")
  include("/home/hdy/catkin_ws/build/pocketsphinx/cmake_install.cmake")
  include("/home/hdy/catkin_ws/build/easy_handeye/rqt_easy_handeye/cmake_install.cmake")
  include("/home/hdy/catkin_ws/build/aruco_ros/aruco_msgs/cmake_install.cmake")
  include("/home/hdy/catkin_ws/build/vision_visp/vision_visp/cmake_install.cmake")
  include("/home/hdy/catkin_ws/build/wpb_home/wpb_home_bringup/cmake_install.cmake")
  include("/home/hdy/catkin_ws/build/wpb_home/wpb_home_remote/cmake_install.cmake")
  include("/home/hdy/catkin_ws/build/audio_common/audio_capture/cmake_install.cmake")
  include("/home/hdy/catkin_ws/build/audio_common/audio_play/cmake_install.cmake")
  include("/home/hdy/catkin_ws/build/python_cplus/cmake_install.cmake")
  include("/home/hdy/catkin_ws/build/camera_calibration/cmake_install.cmake")
  include("/home/hdy/catkin_ws/build/aruco_ros/aruco/cmake_install.cmake")
  include("/home/hdy/catkin_ws/build/iai_kinect2/kinect2_registration/cmake_install.cmake")
  include("/home/hdy/catkin_ws/build/robot_vision/cmake_install.cmake")
  include("/home/hdy/catkin_ws/build/ros_tensorflow/cmake_install.cmake")
  include("/home/hdy/catkin_ws/build/rplidar_ros/cmake_install.cmake")
  include("/home/hdy/catkin_ws/build/audio_common/sound_play/cmake_install.cmake")
  include("/home/hdy/catkin_ws/build/hdy_speak/cmake_install.cmake")
  include("/home/hdy/catkin_ws/build/tensorflow_object_detection/cmake_install.cmake")
  include("/home/hdy/catkin_ws/build/aruco_ros/aruco_ros/cmake_install.cmake")
  include("/home/hdy/catkin_ws/build/iai_kinect2/kinect2_bridge/cmake_install.cmake")
  include("/home/hdy/catkin_ws/build/iai_kinect2/kinect2_calibration/cmake_install.cmake")
  include("/home/hdy/catkin_ws/build/iai_kinect2/kinect2_viewer/cmake_install.cmake")
  include("/home/hdy/catkin_ws/build/usb_cam/cmake_install.cmake")
  include("/home/hdy/catkin_ws/build/vision_visp/visp_bridge/cmake_install.cmake")
  include("/home/hdy/catkin_ws/build/vision_visp/visp_camera_calibration/cmake_install.cmake")
  include("/home/hdy/catkin_ws/build/vision_visp/visp_hand2eye_calibration/cmake_install.cmake")
  include("/home/hdy/catkin_ws/build/easy_handeye/easy_handeye/cmake_install.cmake")
  include("/home/hdy/catkin_ws/build/vision_visp/visp_tracker/cmake_install.cmake")
  include("/home/hdy/catkin_ws/build/vision_visp/visp_auto_tracker/cmake_install.cmake")
  include("/home/hdy/catkin_ws/build/costmap_2d/cmake_install.cmake")
  include("/home/hdy/catkin_ws/build/base_local_planner/cmake_install.cmake")
  include("/home/hdy/catkin_ws/build/dwa_local_planner/cmake_install.cmake")
  include("/home/hdy/catkin_ws/build/move_base/cmake_install.cmake")
  include("/home/hdy/catkin_ws/build/simple_layers/cmake_install.cmake")
  include("/home/hdy/catkin_ws/build/waterplus_map_tools/cmake_install.cmake")
  include("/home/hdy/catkin_ws/build/wpb_home/wpb_home_behaviors/cmake_install.cmake")
  include("/home/hdy/catkin_ws/build/wpb_home/wpb_home_tutorials/cmake_install.cmake")
  include("/home/hdy/catkin_ws/build/wpb_home/wpbh_local_planner/cmake_install.cmake")
  include("/home/hdy/catkin_ws/build/xf-ros/xfei_asr/cmake_install.cmake")
  include("/home/hdy/catkin_ws/build/xfyun_kinetic/cmake_install.cmake")
  include("/home/hdy/catkin_ws/build/wpb_home_apps/cmake_install.cmake")

endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "/home/hdy/catkin_ws/build/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
