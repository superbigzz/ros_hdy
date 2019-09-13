# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "visp_hand2eye_calibration: 1 messages, 3 services")

set(MSG_I_FLAGS "-Ivisp_hand2eye_calibration:/home/hdy/catkin_ws/src/vision_visp/visp_hand2eye_calibration/msg;-Igeometry_msgs:/opt/ros/kinetic/share/geometry_msgs/cmake/../msg;-Isensor_msgs:/opt/ros/kinetic/share/sensor_msgs/cmake/../msg;-Istd_msgs:/opt/ros/kinetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(visp_hand2eye_calibration_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/hdy/catkin_ws/src/vision_visp/visp_hand2eye_calibration/srv/compute_effector_camera_quick.srv" NAME_WE)
add_custom_target(_visp_hand2eye_calibration_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "visp_hand2eye_calibration" "/home/hdy/catkin_ws/src/vision_visp/visp_hand2eye_calibration/srv/compute_effector_camera_quick.srv" "geometry_msgs/Quaternion:geometry_msgs/Vector3:visp_hand2eye_calibration/TransformArray:std_msgs/Header:geometry_msgs/Transform"
)

get_filename_component(_filename "/home/hdy/catkin_ws/src/vision_visp/visp_hand2eye_calibration/msg/TransformArray.msg" NAME_WE)
add_custom_target(_visp_hand2eye_calibration_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "visp_hand2eye_calibration" "/home/hdy/catkin_ws/src/vision_visp/visp_hand2eye_calibration/msg/TransformArray.msg" "geometry_msgs/Quaternion:geometry_msgs/Vector3:std_msgs/Header:geometry_msgs/Transform"
)

get_filename_component(_filename "/home/hdy/catkin_ws/src/vision_visp/visp_hand2eye_calibration/srv/reset.srv" NAME_WE)
add_custom_target(_visp_hand2eye_calibration_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "visp_hand2eye_calibration" "/home/hdy/catkin_ws/src/vision_visp/visp_hand2eye_calibration/srv/reset.srv" ""
)

get_filename_component(_filename "/home/hdy/catkin_ws/src/vision_visp/visp_hand2eye_calibration/srv/compute_effector_camera.srv" NAME_WE)
add_custom_target(_visp_hand2eye_calibration_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "visp_hand2eye_calibration" "/home/hdy/catkin_ws/src/vision_visp/visp_hand2eye_calibration/srv/compute_effector_camera.srv" "geometry_msgs/Quaternion:geometry_msgs/Transform:geometry_msgs/Vector3"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(visp_hand2eye_calibration
  "/home/hdy/catkin_ws/src/vision_visp/visp_hand2eye_calibration/msg/TransformArray.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Transform.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/visp_hand2eye_calibration
)

### Generating Services
_generate_srv_cpp(visp_hand2eye_calibration
  "/home/hdy/catkin_ws/src/vision_visp/visp_hand2eye_calibration/srv/compute_effector_camera_quick.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/home/hdy/catkin_ws/src/vision_visp/visp_hand2eye_calibration/msg/TransformArray.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Transform.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/visp_hand2eye_calibration
)
_generate_srv_cpp(visp_hand2eye_calibration
  "/home/hdy/catkin_ws/src/vision_visp/visp_hand2eye_calibration/srv/compute_effector_camera.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Transform.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/visp_hand2eye_calibration
)
_generate_srv_cpp(visp_hand2eye_calibration
  "/home/hdy/catkin_ws/src/vision_visp/visp_hand2eye_calibration/srv/reset.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/visp_hand2eye_calibration
)

### Generating Module File
_generate_module_cpp(visp_hand2eye_calibration
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/visp_hand2eye_calibration
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(visp_hand2eye_calibration_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(visp_hand2eye_calibration_generate_messages visp_hand2eye_calibration_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/hdy/catkin_ws/src/vision_visp/visp_hand2eye_calibration/srv/compute_effector_camera_quick.srv" NAME_WE)
add_dependencies(visp_hand2eye_calibration_generate_messages_cpp _visp_hand2eye_calibration_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/hdy/catkin_ws/src/vision_visp/visp_hand2eye_calibration/msg/TransformArray.msg" NAME_WE)
add_dependencies(visp_hand2eye_calibration_generate_messages_cpp _visp_hand2eye_calibration_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/hdy/catkin_ws/src/vision_visp/visp_hand2eye_calibration/srv/reset.srv" NAME_WE)
add_dependencies(visp_hand2eye_calibration_generate_messages_cpp _visp_hand2eye_calibration_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/hdy/catkin_ws/src/vision_visp/visp_hand2eye_calibration/srv/compute_effector_camera.srv" NAME_WE)
add_dependencies(visp_hand2eye_calibration_generate_messages_cpp _visp_hand2eye_calibration_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(visp_hand2eye_calibration_gencpp)
add_dependencies(visp_hand2eye_calibration_gencpp visp_hand2eye_calibration_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS visp_hand2eye_calibration_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(visp_hand2eye_calibration
  "/home/hdy/catkin_ws/src/vision_visp/visp_hand2eye_calibration/msg/TransformArray.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Transform.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/visp_hand2eye_calibration
)

### Generating Services
_generate_srv_eus(visp_hand2eye_calibration
  "/home/hdy/catkin_ws/src/vision_visp/visp_hand2eye_calibration/srv/compute_effector_camera_quick.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/home/hdy/catkin_ws/src/vision_visp/visp_hand2eye_calibration/msg/TransformArray.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Transform.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/visp_hand2eye_calibration
)
_generate_srv_eus(visp_hand2eye_calibration
  "/home/hdy/catkin_ws/src/vision_visp/visp_hand2eye_calibration/srv/compute_effector_camera.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Transform.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/visp_hand2eye_calibration
)
_generate_srv_eus(visp_hand2eye_calibration
  "/home/hdy/catkin_ws/src/vision_visp/visp_hand2eye_calibration/srv/reset.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/visp_hand2eye_calibration
)

### Generating Module File
_generate_module_eus(visp_hand2eye_calibration
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/visp_hand2eye_calibration
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(visp_hand2eye_calibration_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(visp_hand2eye_calibration_generate_messages visp_hand2eye_calibration_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/hdy/catkin_ws/src/vision_visp/visp_hand2eye_calibration/srv/compute_effector_camera_quick.srv" NAME_WE)
add_dependencies(visp_hand2eye_calibration_generate_messages_eus _visp_hand2eye_calibration_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/hdy/catkin_ws/src/vision_visp/visp_hand2eye_calibration/msg/TransformArray.msg" NAME_WE)
add_dependencies(visp_hand2eye_calibration_generate_messages_eus _visp_hand2eye_calibration_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/hdy/catkin_ws/src/vision_visp/visp_hand2eye_calibration/srv/reset.srv" NAME_WE)
add_dependencies(visp_hand2eye_calibration_generate_messages_eus _visp_hand2eye_calibration_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/hdy/catkin_ws/src/vision_visp/visp_hand2eye_calibration/srv/compute_effector_camera.srv" NAME_WE)
add_dependencies(visp_hand2eye_calibration_generate_messages_eus _visp_hand2eye_calibration_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(visp_hand2eye_calibration_geneus)
add_dependencies(visp_hand2eye_calibration_geneus visp_hand2eye_calibration_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS visp_hand2eye_calibration_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(visp_hand2eye_calibration
  "/home/hdy/catkin_ws/src/vision_visp/visp_hand2eye_calibration/msg/TransformArray.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Transform.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/visp_hand2eye_calibration
)

### Generating Services
_generate_srv_lisp(visp_hand2eye_calibration
  "/home/hdy/catkin_ws/src/vision_visp/visp_hand2eye_calibration/srv/compute_effector_camera_quick.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/home/hdy/catkin_ws/src/vision_visp/visp_hand2eye_calibration/msg/TransformArray.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Transform.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/visp_hand2eye_calibration
)
_generate_srv_lisp(visp_hand2eye_calibration
  "/home/hdy/catkin_ws/src/vision_visp/visp_hand2eye_calibration/srv/compute_effector_camera.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Transform.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/visp_hand2eye_calibration
)
_generate_srv_lisp(visp_hand2eye_calibration
  "/home/hdy/catkin_ws/src/vision_visp/visp_hand2eye_calibration/srv/reset.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/visp_hand2eye_calibration
)

### Generating Module File
_generate_module_lisp(visp_hand2eye_calibration
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/visp_hand2eye_calibration
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(visp_hand2eye_calibration_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(visp_hand2eye_calibration_generate_messages visp_hand2eye_calibration_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/hdy/catkin_ws/src/vision_visp/visp_hand2eye_calibration/srv/compute_effector_camera_quick.srv" NAME_WE)
add_dependencies(visp_hand2eye_calibration_generate_messages_lisp _visp_hand2eye_calibration_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/hdy/catkin_ws/src/vision_visp/visp_hand2eye_calibration/msg/TransformArray.msg" NAME_WE)
add_dependencies(visp_hand2eye_calibration_generate_messages_lisp _visp_hand2eye_calibration_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/hdy/catkin_ws/src/vision_visp/visp_hand2eye_calibration/srv/reset.srv" NAME_WE)
add_dependencies(visp_hand2eye_calibration_generate_messages_lisp _visp_hand2eye_calibration_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/hdy/catkin_ws/src/vision_visp/visp_hand2eye_calibration/srv/compute_effector_camera.srv" NAME_WE)
add_dependencies(visp_hand2eye_calibration_generate_messages_lisp _visp_hand2eye_calibration_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(visp_hand2eye_calibration_genlisp)
add_dependencies(visp_hand2eye_calibration_genlisp visp_hand2eye_calibration_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS visp_hand2eye_calibration_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(visp_hand2eye_calibration
  "/home/hdy/catkin_ws/src/vision_visp/visp_hand2eye_calibration/msg/TransformArray.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Transform.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/visp_hand2eye_calibration
)

### Generating Services
_generate_srv_nodejs(visp_hand2eye_calibration
  "/home/hdy/catkin_ws/src/vision_visp/visp_hand2eye_calibration/srv/compute_effector_camera_quick.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/home/hdy/catkin_ws/src/vision_visp/visp_hand2eye_calibration/msg/TransformArray.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Transform.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/visp_hand2eye_calibration
)
_generate_srv_nodejs(visp_hand2eye_calibration
  "/home/hdy/catkin_ws/src/vision_visp/visp_hand2eye_calibration/srv/compute_effector_camera.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Transform.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/visp_hand2eye_calibration
)
_generate_srv_nodejs(visp_hand2eye_calibration
  "/home/hdy/catkin_ws/src/vision_visp/visp_hand2eye_calibration/srv/reset.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/visp_hand2eye_calibration
)

### Generating Module File
_generate_module_nodejs(visp_hand2eye_calibration
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/visp_hand2eye_calibration
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(visp_hand2eye_calibration_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(visp_hand2eye_calibration_generate_messages visp_hand2eye_calibration_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/hdy/catkin_ws/src/vision_visp/visp_hand2eye_calibration/srv/compute_effector_camera_quick.srv" NAME_WE)
add_dependencies(visp_hand2eye_calibration_generate_messages_nodejs _visp_hand2eye_calibration_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/hdy/catkin_ws/src/vision_visp/visp_hand2eye_calibration/msg/TransformArray.msg" NAME_WE)
add_dependencies(visp_hand2eye_calibration_generate_messages_nodejs _visp_hand2eye_calibration_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/hdy/catkin_ws/src/vision_visp/visp_hand2eye_calibration/srv/reset.srv" NAME_WE)
add_dependencies(visp_hand2eye_calibration_generate_messages_nodejs _visp_hand2eye_calibration_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/hdy/catkin_ws/src/vision_visp/visp_hand2eye_calibration/srv/compute_effector_camera.srv" NAME_WE)
add_dependencies(visp_hand2eye_calibration_generate_messages_nodejs _visp_hand2eye_calibration_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(visp_hand2eye_calibration_gennodejs)
add_dependencies(visp_hand2eye_calibration_gennodejs visp_hand2eye_calibration_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS visp_hand2eye_calibration_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(visp_hand2eye_calibration
  "/home/hdy/catkin_ws/src/vision_visp/visp_hand2eye_calibration/msg/TransformArray.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Transform.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/visp_hand2eye_calibration
)

### Generating Services
_generate_srv_py(visp_hand2eye_calibration
  "/home/hdy/catkin_ws/src/vision_visp/visp_hand2eye_calibration/srv/compute_effector_camera_quick.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/home/hdy/catkin_ws/src/vision_visp/visp_hand2eye_calibration/msg/TransformArray.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Transform.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/visp_hand2eye_calibration
)
_generate_srv_py(visp_hand2eye_calibration
  "/home/hdy/catkin_ws/src/vision_visp/visp_hand2eye_calibration/srv/compute_effector_camera.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Transform.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/visp_hand2eye_calibration
)
_generate_srv_py(visp_hand2eye_calibration
  "/home/hdy/catkin_ws/src/vision_visp/visp_hand2eye_calibration/srv/reset.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/visp_hand2eye_calibration
)

### Generating Module File
_generate_module_py(visp_hand2eye_calibration
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/visp_hand2eye_calibration
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(visp_hand2eye_calibration_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(visp_hand2eye_calibration_generate_messages visp_hand2eye_calibration_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/hdy/catkin_ws/src/vision_visp/visp_hand2eye_calibration/srv/compute_effector_camera_quick.srv" NAME_WE)
add_dependencies(visp_hand2eye_calibration_generate_messages_py _visp_hand2eye_calibration_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/hdy/catkin_ws/src/vision_visp/visp_hand2eye_calibration/msg/TransformArray.msg" NAME_WE)
add_dependencies(visp_hand2eye_calibration_generate_messages_py _visp_hand2eye_calibration_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/hdy/catkin_ws/src/vision_visp/visp_hand2eye_calibration/srv/reset.srv" NAME_WE)
add_dependencies(visp_hand2eye_calibration_generate_messages_py _visp_hand2eye_calibration_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/hdy/catkin_ws/src/vision_visp/visp_hand2eye_calibration/srv/compute_effector_camera.srv" NAME_WE)
add_dependencies(visp_hand2eye_calibration_generate_messages_py _visp_hand2eye_calibration_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(visp_hand2eye_calibration_genpy)
add_dependencies(visp_hand2eye_calibration_genpy visp_hand2eye_calibration_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS visp_hand2eye_calibration_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/visp_hand2eye_calibration)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/visp_hand2eye_calibration
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(visp_hand2eye_calibration_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()
if(TARGET sensor_msgs_generate_messages_cpp)
  add_dependencies(visp_hand2eye_calibration_generate_messages_cpp sensor_msgs_generate_messages_cpp)
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(visp_hand2eye_calibration_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/visp_hand2eye_calibration)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/visp_hand2eye_calibration
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(visp_hand2eye_calibration_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()
if(TARGET sensor_msgs_generate_messages_eus)
  add_dependencies(visp_hand2eye_calibration_generate_messages_eus sensor_msgs_generate_messages_eus)
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(visp_hand2eye_calibration_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/visp_hand2eye_calibration)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/visp_hand2eye_calibration
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(visp_hand2eye_calibration_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()
if(TARGET sensor_msgs_generate_messages_lisp)
  add_dependencies(visp_hand2eye_calibration_generate_messages_lisp sensor_msgs_generate_messages_lisp)
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(visp_hand2eye_calibration_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/visp_hand2eye_calibration)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/visp_hand2eye_calibration
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(visp_hand2eye_calibration_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()
if(TARGET sensor_msgs_generate_messages_nodejs)
  add_dependencies(visp_hand2eye_calibration_generate_messages_nodejs sensor_msgs_generate_messages_nodejs)
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(visp_hand2eye_calibration_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/visp_hand2eye_calibration)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/visp_hand2eye_calibration\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/visp_hand2eye_calibration
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(visp_hand2eye_calibration_generate_messages_py geometry_msgs_generate_messages_py)
endif()
if(TARGET sensor_msgs_generate_messages_py)
  add_dependencies(visp_hand2eye_calibration_generate_messages_py sensor_msgs_generate_messages_py)
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(visp_hand2eye_calibration_generate_messages_py std_msgs_generate_messages_py)
endif()
