# generated from catkin/cmake/template/pkgConfig.cmake.in

# append elements to a list and remove existing duplicates from the list
# copied from catkin/cmake/list_append_deduplicate.cmake to keep pkgConfig
# self contained
macro(_list_append_deduplicate listname)
  if(NOT "${ARGN}" STREQUAL "")
    if(${listname})
      list(REMOVE_ITEM ${listname} ${ARGN})
    endif()
    list(APPEND ${listname} ${ARGN})
  endif()
endmacro()

# append elements to a list if they are not already in the list
# copied from catkin/cmake/list_append_unique.cmake to keep pkgConfig
# self contained
macro(_list_append_unique listname)
  foreach(_item ${ARGN})
    list(FIND ${listname} ${_item} _index)
    if(_index EQUAL -1)
      list(APPEND ${listname} ${_item})
    endif()
  endforeach()
endmacro()

# pack a list of libraries with optional build configuration keywords
# copied from catkin/cmake/catkin_libraries.cmake to keep pkgConfig
# self contained
macro(_pack_libraries_with_build_configuration VAR)
  set(${VAR} "")
  set(_argn ${ARGN})
  list(LENGTH _argn _count)
  set(_index 0)
  while(${_index} LESS ${_count})
    list(GET _argn ${_index} lib)
    if("${lib}" MATCHES "^(debug|optimized|general)$")
      math(EXPR _index "${_index} + 1")
      if(${_index} EQUAL ${_count})
        message(FATAL_ERROR "_pack_libraries_with_build_configuration() the list of libraries '${ARGN}' ends with '${lib}' which is a build configuration keyword and must be followed by a library")
      endif()
      list(GET _argn ${_index} library)
      list(APPEND ${VAR} "${lib}${CATKIN_BUILD_CONFIGURATION_KEYWORD_SEPARATOR}${library}")
    else()
      list(APPEND ${VAR} "${lib}")
    endif()
    math(EXPR _index "${_index} + 1")
  endwhile()
endmacro()

# unpack a list of libraries with optional build configuration keyword prefixes
# copied from catkin/cmake/catkin_libraries.cmake to keep pkgConfig
# self contained
macro(_unpack_libraries_with_build_configuration VAR)
  set(${VAR} "")
  foreach(lib ${ARGN})
    string(REGEX REPLACE "^(debug|optimized|general)${CATKIN_BUILD_CONFIGURATION_KEYWORD_SEPARATOR}(.+)$" "\\1;\\2" lib "${lib}")
    list(APPEND ${VAR} "${lib}")
  endforeach()
endmacro()


if(visp_bridge_CONFIG_INCLUDED)
  return()
endif()
set(visp_bridge_CONFIG_INCLUDED TRUE)

# set variables for source/devel/install prefixes
if("FALSE" STREQUAL "TRUE")
  set(visp_bridge_SOURCE_PREFIX /home/hdy/catkin_ws/src/vision_visp/visp_bridge)
  set(visp_bridge_DEVEL_PREFIX /home/hdy/catkin_ws/devel)
  set(visp_bridge_INSTALL_PREFIX "")
  set(visp_bridge_PREFIX ${visp_bridge_DEVEL_PREFIX})
else()
  set(visp_bridge_SOURCE_PREFIX "")
  set(visp_bridge_DEVEL_PREFIX "")
  set(visp_bridge_INSTALL_PREFIX /home/hdy/catkin_ws/install)
  set(visp_bridge_PREFIX ${visp_bridge_INSTALL_PREFIX})
endif()

# warn when using a deprecated package
if(NOT "" STREQUAL "")
  set(_msg "WARNING: package 'visp_bridge' is deprecated")
  # append custom deprecation text if available
  if(NOT "" STREQUAL "TRUE")
    set(_msg "${_msg} ()")
  endif()
  message("${_msg}")
endif()

# flag project as catkin-based to distinguish if a find_package()-ed project is a catkin project
set(visp_bridge_FOUND_CATKIN_PROJECT TRUE)

if(NOT "include;/usr/include;/opt/ros/kinetic/include;/opt/ros/kinetic/include/opencv-3.3.1-dev;/opt/ros/kinetic/include/opencv-3.3.1-dev/opencv;/usr/include/eigen3;/usr/include/libxml2;/usr/include/libusb-1.0;/usr/include/OGRE;/usr/include/ois " STREQUAL " ")
  set(visp_bridge_INCLUDE_DIRS "")
  set(_include_dirs "include;/usr/include;/opt/ros/kinetic/include;/opt/ros/kinetic/include/opencv-3.3.1-dev;/opt/ros/kinetic/include/opencv-3.3.1-dev/opencv;/usr/include/eigen3;/usr/include/libxml2;/usr/include/libusb-1.0;/usr/include/OGRE;/usr/include/ois")
  if(NOT " " STREQUAL " ")
    set(_report "Check the issue tracker '' and consider creating a ticket if the problem has not been reported yet.")
  elseif(NOT "http://wiki.ros.org/visp_bridge " STREQUAL " ")
    set(_report "Check the website 'http://wiki.ros.org/visp_bridge' for information and consider reporting the problem.")
  else()
    set(_report "Report the problem to the maintainer 'Fabien Spindler <Fabien.Spindler@inria.fr>' and request to fix the problem.")
  endif()
  foreach(idir ${_include_dirs})
    if(IS_ABSOLUTE ${idir} AND IS_DIRECTORY ${idir})
      set(include ${idir})
    elseif("${idir} " STREQUAL "include ")
      get_filename_component(include "${visp_bridge_DIR}/../../../include" ABSOLUTE)
      if(NOT IS_DIRECTORY ${include})
        message(FATAL_ERROR "Project 'visp_bridge' specifies '${idir}' as an include dir, which is not found.  It does not exist in '${include}'.  ${_report}")
      endif()
    else()
      message(FATAL_ERROR "Project 'visp_bridge' specifies '${idir}' as an include dir, which is not found.  It does neither exist as an absolute directory nor in '/home/hdy/catkin_ws/install/${idir}'.  ${_report}")
    endif()
    _list_append_unique(visp_bridge_INCLUDE_DIRS ${include})
  endforeach()
endif()

set(libraries "visp_bridge;/usr/lib/x86_64-linux-gnu/libboost_filesystem.so;/usr/lib/x86_64-linux-gnu/libboost_program_options.so;/usr/lib/x86_64-linux-gnu/libboost_system.so;/opt/ros/kinetic/lib/x86_64-linux-gnu/libvisp_vs.so.3.2.0;/opt/ros/kinetic/lib/x86_64-linux-gnu/libvisp_visual_features.so.3.2.0;/opt/ros/kinetic/lib/x86_64-linux-gnu/libvisp_vision.so.3.2.0;/opt/ros/kinetic/lib/x86_64-linux-gnu/libvisp_tt_mi.so.3.2.0;/opt/ros/kinetic/lib/x86_64-linux-gnu/libvisp_tt.so.3.2.0;/opt/ros/kinetic/lib/x86_64-linux-gnu/libvisp_me.so.3.2.0;/opt/ros/kinetic/lib/x86_64-linux-gnu/libvisp_mbt.so.3.2.0;/opt/ros/kinetic/lib/x86_64-linux-gnu/libvisp_klt.so.3.2.0;/opt/ros/kinetic/lib/x86_64-linux-gnu/libvisp_blob.so.3.2.0;/opt/ros/kinetic/lib/x86_64-linux-gnu/libvisp_sensor.so.3.2.0;/opt/ros/kinetic/lib/x86_64-linux-gnu/libvisp_robot.so.3.2.0;/opt/ros/kinetic/lib/x86_64-linux-gnu/libvisp_io.so.3.2.0;/opt/ros/kinetic/lib/x86_64-linux-gnu/libvisp_imgproc.so.3.2.0;/opt/ros/kinetic/lib/x86_64-linux-gnu/libvisp_gui.so.3.2.0;/opt/ros/kinetic/lib/x86_64-linux-gnu/libvisp_detection.so.3.2.0;/opt/ros/kinetic/lib/x86_64-linux-gnu/libvisp_core.so.3.2.0;/opt/ros/kinetic/lib/x86_64-linux-gnu/libvisp_ar.so.3.2.0")
foreach(library ${libraries})
  # keep build configuration keywords, target names and absolute libraries as-is
  if("${library}" MATCHES "^(debug|optimized|general)$")
    list(APPEND visp_bridge_LIBRARIES ${library})
  elseif(${library} MATCHES "^-l")
    list(APPEND visp_bridge_LIBRARIES ${library})
  elseif(TARGET ${library})
    list(APPEND visp_bridge_LIBRARIES ${library})
  elseif(IS_ABSOLUTE ${library})
    list(APPEND visp_bridge_LIBRARIES ${library})
  else()
    set(lib_path "")
    set(lib "${library}-NOTFOUND")
    # since the path where the library is found is returned we have to iterate over the paths manually
    foreach(path /home/hdy/catkin_ws/install/lib;/home/hdy/catkin_ws/devel/lib;/opt/ros/kinetic/lib)
      find_library(lib ${library}
        PATHS ${path}
        NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH)
      if(lib)
        set(lib_path ${path})
        break()
      endif()
    endforeach()
    if(lib)
      _list_append_unique(visp_bridge_LIBRARY_DIRS ${lib_path})
      list(APPEND visp_bridge_LIBRARIES ${lib})
    else()
      # as a fall back for non-catkin libraries try to search globally
      find_library(lib ${library})
      if(NOT lib)
        message(FATAL_ERROR "Project '${PROJECT_NAME}' tried to find library '${library}'.  The library is neither a target nor built/installed properly.  Did you compile project 'visp_bridge'?  Did you find_package() it before the subdirectory containing its code is included?")
      endif()
      list(APPEND visp_bridge_LIBRARIES ${lib})
    endif()
  endif()
endforeach()

set(visp_bridge_EXPORTED_TARGETS "")
# create dummy targets for exported code generation targets to make life of users easier
foreach(t ${visp_bridge_EXPORTED_TARGETS})
  if(NOT TARGET ${t})
    add_custom_target(${t})
  endif()
endforeach()

set(depends "camera_calibration_parsers;geometry_msgs;roscpp;sensor_msgs;std_msgs")
foreach(depend ${depends})
  string(REPLACE " " ";" depend_list ${depend})
  # the package name of the dependency must be kept in a unique variable so that it is not overwritten in recursive calls
  list(GET depend_list 0 visp_bridge_dep)
  list(LENGTH depend_list count)
  if(${count} EQUAL 1)
    # simple dependencies must only be find_package()-ed once
    if(NOT ${visp_bridge_dep}_FOUND)
      find_package(${visp_bridge_dep} REQUIRED NO_MODULE)
    endif()
  else()
    # dependencies with components must be find_package()-ed again
    list(REMOVE_AT depend_list 0)
    find_package(${visp_bridge_dep} REQUIRED NO_MODULE ${depend_list})
  endif()
  _list_append_unique(visp_bridge_INCLUDE_DIRS ${${visp_bridge_dep}_INCLUDE_DIRS})

  # merge build configuration keywords with library names to correctly deduplicate
  _pack_libraries_with_build_configuration(visp_bridge_LIBRARIES ${visp_bridge_LIBRARIES})
  _pack_libraries_with_build_configuration(_libraries ${${visp_bridge_dep}_LIBRARIES})
  _list_append_deduplicate(visp_bridge_LIBRARIES ${_libraries})
  # undo build configuration keyword merging after deduplication
  _unpack_libraries_with_build_configuration(visp_bridge_LIBRARIES ${visp_bridge_LIBRARIES})

  _list_append_unique(visp_bridge_LIBRARY_DIRS ${${visp_bridge_dep}_LIBRARY_DIRS})
  list(APPEND visp_bridge_EXPORTED_TARGETS ${${visp_bridge_dep}_EXPORTED_TARGETS})
endforeach()

set(pkg_cfg_extras "")
foreach(extra ${pkg_cfg_extras})
  if(NOT IS_ABSOLUTE ${extra})
    set(extra ${visp_bridge_DIR}/${extra})
  endif()
  include(${extra})
endforeach()
