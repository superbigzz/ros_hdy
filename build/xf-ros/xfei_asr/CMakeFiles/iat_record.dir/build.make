# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.5

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/hdy/catkin_ws/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/hdy/catkin_ws/build

# Include any dependencies generated for this target.
include xf-ros/xfei_asr/CMakeFiles/iat_record.dir/depend.make

# Include the progress variables for this target.
include xf-ros/xfei_asr/CMakeFiles/iat_record.dir/progress.make

# Include the compile flags for this target's objects.
include xf-ros/xfei_asr/CMakeFiles/iat_record.dir/flags.make

xf-ros/xfei_asr/CMakeFiles/iat_record.dir/src/iat_record.c.o: xf-ros/xfei_asr/CMakeFiles/iat_record.dir/flags.make
xf-ros/xfei_asr/CMakeFiles/iat_record.dir/src/iat_record.c.o: /home/hdy/catkin_ws/src/xf-ros/xfei_asr/src/iat_record.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/hdy/catkin_ws/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object xf-ros/xfei_asr/CMakeFiles/iat_record.dir/src/iat_record.c.o"
	cd /home/hdy/catkin_ws/build/xf-ros/xfei_asr && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/iat_record.dir/src/iat_record.c.o   -c /home/hdy/catkin_ws/src/xf-ros/xfei_asr/src/iat_record.c

xf-ros/xfei_asr/CMakeFiles/iat_record.dir/src/iat_record.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/iat_record.dir/src/iat_record.c.i"
	cd /home/hdy/catkin_ws/build/xf-ros/xfei_asr && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/hdy/catkin_ws/src/xf-ros/xfei_asr/src/iat_record.c > CMakeFiles/iat_record.dir/src/iat_record.c.i

xf-ros/xfei_asr/CMakeFiles/iat_record.dir/src/iat_record.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/iat_record.dir/src/iat_record.c.s"
	cd /home/hdy/catkin_ws/build/xf-ros/xfei_asr && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/hdy/catkin_ws/src/xf-ros/xfei_asr/src/iat_record.c -o CMakeFiles/iat_record.dir/src/iat_record.c.s

xf-ros/xfei_asr/CMakeFiles/iat_record.dir/src/iat_record.c.o.requires:

.PHONY : xf-ros/xfei_asr/CMakeFiles/iat_record.dir/src/iat_record.c.o.requires

xf-ros/xfei_asr/CMakeFiles/iat_record.dir/src/iat_record.c.o.provides: xf-ros/xfei_asr/CMakeFiles/iat_record.dir/src/iat_record.c.o.requires
	$(MAKE) -f xf-ros/xfei_asr/CMakeFiles/iat_record.dir/build.make xf-ros/xfei_asr/CMakeFiles/iat_record.dir/src/iat_record.c.o.provides.build
.PHONY : xf-ros/xfei_asr/CMakeFiles/iat_record.dir/src/iat_record.c.o.provides

xf-ros/xfei_asr/CMakeFiles/iat_record.dir/src/iat_record.c.o.provides.build: xf-ros/xfei_asr/CMakeFiles/iat_record.dir/src/iat_record.c.o


xf-ros/xfei_asr/CMakeFiles/iat_record.dir/src/speech_recognizer.c.o: xf-ros/xfei_asr/CMakeFiles/iat_record.dir/flags.make
xf-ros/xfei_asr/CMakeFiles/iat_record.dir/src/speech_recognizer.c.o: /home/hdy/catkin_ws/src/xf-ros/xfei_asr/src/speech_recognizer.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/hdy/catkin_ws/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object xf-ros/xfei_asr/CMakeFiles/iat_record.dir/src/speech_recognizer.c.o"
	cd /home/hdy/catkin_ws/build/xf-ros/xfei_asr && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/iat_record.dir/src/speech_recognizer.c.o   -c /home/hdy/catkin_ws/src/xf-ros/xfei_asr/src/speech_recognizer.c

xf-ros/xfei_asr/CMakeFiles/iat_record.dir/src/speech_recognizer.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/iat_record.dir/src/speech_recognizer.c.i"
	cd /home/hdy/catkin_ws/build/xf-ros/xfei_asr && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/hdy/catkin_ws/src/xf-ros/xfei_asr/src/speech_recognizer.c > CMakeFiles/iat_record.dir/src/speech_recognizer.c.i

xf-ros/xfei_asr/CMakeFiles/iat_record.dir/src/speech_recognizer.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/iat_record.dir/src/speech_recognizer.c.s"
	cd /home/hdy/catkin_ws/build/xf-ros/xfei_asr && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/hdy/catkin_ws/src/xf-ros/xfei_asr/src/speech_recognizer.c -o CMakeFiles/iat_record.dir/src/speech_recognizer.c.s

xf-ros/xfei_asr/CMakeFiles/iat_record.dir/src/speech_recognizer.c.o.requires:

.PHONY : xf-ros/xfei_asr/CMakeFiles/iat_record.dir/src/speech_recognizer.c.o.requires

xf-ros/xfei_asr/CMakeFiles/iat_record.dir/src/speech_recognizer.c.o.provides: xf-ros/xfei_asr/CMakeFiles/iat_record.dir/src/speech_recognizer.c.o.requires
	$(MAKE) -f xf-ros/xfei_asr/CMakeFiles/iat_record.dir/build.make xf-ros/xfei_asr/CMakeFiles/iat_record.dir/src/speech_recognizer.c.o.provides.build
.PHONY : xf-ros/xfei_asr/CMakeFiles/iat_record.dir/src/speech_recognizer.c.o.provides

xf-ros/xfei_asr/CMakeFiles/iat_record.dir/src/speech_recognizer.c.o.provides.build: xf-ros/xfei_asr/CMakeFiles/iat_record.dir/src/speech_recognizer.c.o


xf-ros/xfei_asr/CMakeFiles/iat_record.dir/src/linuxrec.c.o: xf-ros/xfei_asr/CMakeFiles/iat_record.dir/flags.make
xf-ros/xfei_asr/CMakeFiles/iat_record.dir/src/linuxrec.c.o: /home/hdy/catkin_ws/src/xf-ros/xfei_asr/src/linuxrec.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/hdy/catkin_ws/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object xf-ros/xfei_asr/CMakeFiles/iat_record.dir/src/linuxrec.c.o"
	cd /home/hdy/catkin_ws/build/xf-ros/xfei_asr && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/iat_record.dir/src/linuxrec.c.o   -c /home/hdy/catkin_ws/src/xf-ros/xfei_asr/src/linuxrec.c

xf-ros/xfei_asr/CMakeFiles/iat_record.dir/src/linuxrec.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/iat_record.dir/src/linuxrec.c.i"
	cd /home/hdy/catkin_ws/build/xf-ros/xfei_asr && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/hdy/catkin_ws/src/xf-ros/xfei_asr/src/linuxrec.c > CMakeFiles/iat_record.dir/src/linuxrec.c.i

xf-ros/xfei_asr/CMakeFiles/iat_record.dir/src/linuxrec.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/iat_record.dir/src/linuxrec.c.s"
	cd /home/hdy/catkin_ws/build/xf-ros/xfei_asr && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/hdy/catkin_ws/src/xf-ros/xfei_asr/src/linuxrec.c -o CMakeFiles/iat_record.dir/src/linuxrec.c.s

xf-ros/xfei_asr/CMakeFiles/iat_record.dir/src/linuxrec.c.o.requires:

.PHONY : xf-ros/xfei_asr/CMakeFiles/iat_record.dir/src/linuxrec.c.o.requires

xf-ros/xfei_asr/CMakeFiles/iat_record.dir/src/linuxrec.c.o.provides: xf-ros/xfei_asr/CMakeFiles/iat_record.dir/src/linuxrec.c.o.requires
	$(MAKE) -f xf-ros/xfei_asr/CMakeFiles/iat_record.dir/build.make xf-ros/xfei_asr/CMakeFiles/iat_record.dir/src/linuxrec.c.o.provides.build
.PHONY : xf-ros/xfei_asr/CMakeFiles/iat_record.dir/src/linuxrec.c.o.provides

xf-ros/xfei_asr/CMakeFiles/iat_record.dir/src/linuxrec.c.o.provides.build: xf-ros/xfei_asr/CMakeFiles/iat_record.dir/src/linuxrec.c.o


# Object files for target iat_record
iat_record_OBJECTS = \
"CMakeFiles/iat_record.dir/src/iat_record.c.o" \
"CMakeFiles/iat_record.dir/src/speech_recognizer.c.o" \
"CMakeFiles/iat_record.dir/src/linuxrec.c.o"

# External object files for target iat_record
iat_record_EXTERNAL_OBJECTS =

/home/hdy/catkin_ws/devel/lib/xfei_asr/iat_record: xf-ros/xfei_asr/CMakeFiles/iat_record.dir/src/iat_record.c.o
/home/hdy/catkin_ws/devel/lib/xfei_asr/iat_record: xf-ros/xfei_asr/CMakeFiles/iat_record.dir/src/speech_recognizer.c.o
/home/hdy/catkin_ws/devel/lib/xfei_asr/iat_record: xf-ros/xfei_asr/CMakeFiles/iat_record.dir/src/linuxrec.c.o
/home/hdy/catkin_ws/devel/lib/xfei_asr/iat_record: xf-ros/xfei_asr/CMakeFiles/iat_record.dir/build.make
/home/hdy/catkin_ws/devel/lib/xfei_asr/iat_record: /opt/ros/kinetic/lib/libroscpp.so
/home/hdy/catkin_ws/devel/lib/xfei_asr/iat_record: /usr/lib/x86_64-linux-gnu/libboost_filesystem.so
/home/hdy/catkin_ws/devel/lib/xfei_asr/iat_record: /usr/lib/x86_64-linux-gnu/libboost_signals.so
/home/hdy/catkin_ws/devel/lib/xfei_asr/iat_record: /opt/ros/kinetic/lib/librosconsole.so
/home/hdy/catkin_ws/devel/lib/xfei_asr/iat_record: /opt/ros/kinetic/lib/librosconsole_log4cxx.so
/home/hdy/catkin_ws/devel/lib/xfei_asr/iat_record: /opt/ros/kinetic/lib/librosconsole_backend_interface.so
/home/hdy/catkin_ws/devel/lib/xfei_asr/iat_record: /usr/lib/x86_64-linux-gnu/liblog4cxx.so
/home/hdy/catkin_ws/devel/lib/xfei_asr/iat_record: /usr/lib/x86_64-linux-gnu/libboost_regex.so
/home/hdy/catkin_ws/devel/lib/xfei_asr/iat_record: /opt/ros/kinetic/lib/libxmlrpcpp.so
/home/hdy/catkin_ws/devel/lib/xfei_asr/iat_record: /opt/ros/kinetic/lib/libroscpp_serialization.so
/home/hdy/catkin_ws/devel/lib/xfei_asr/iat_record: /opt/ros/kinetic/lib/librostime.so
/home/hdy/catkin_ws/devel/lib/xfei_asr/iat_record: /opt/ros/kinetic/lib/libcpp_common.so
/home/hdy/catkin_ws/devel/lib/xfei_asr/iat_record: /usr/lib/x86_64-linux-gnu/libboost_system.so
/home/hdy/catkin_ws/devel/lib/xfei_asr/iat_record: /usr/lib/x86_64-linux-gnu/libboost_thread.so
/home/hdy/catkin_ws/devel/lib/xfei_asr/iat_record: /usr/lib/x86_64-linux-gnu/libboost_chrono.so
/home/hdy/catkin_ws/devel/lib/xfei_asr/iat_record: /usr/lib/x86_64-linux-gnu/libboost_date_time.so
/home/hdy/catkin_ws/devel/lib/xfei_asr/iat_record: /usr/lib/x86_64-linux-gnu/libboost_atomic.so
/home/hdy/catkin_ws/devel/lib/xfei_asr/iat_record: /usr/lib/x86_64-linux-gnu/libpthread.so
/home/hdy/catkin_ws/devel/lib/xfei_asr/iat_record: /usr/lib/x86_64-linux-gnu/libconsole_bridge.so
/home/hdy/catkin_ws/devel/lib/xfei_asr/iat_record: /home/hdy/catkin_ws/src/xf-ros/xfei_asr/lib/libmsc.so
/home/hdy/catkin_ws/devel/lib/xfei_asr/iat_record: xf-ros/xfei_asr/CMakeFiles/iat_record.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/hdy/catkin_ws/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Linking C executable /home/hdy/catkin_ws/devel/lib/xfei_asr/iat_record"
	cd /home/hdy/catkin_ws/build/xf-ros/xfei_asr && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/iat_record.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
xf-ros/xfei_asr/CMakeFiles/iat_record.dir/build: /home/hdy/catkin_ws/devel/lib/xfei_asr/iat_record

.PHONY : xf-ros/xfei_asr/CMakeFiles/iat_record.dir/build

xf-ros/xfei_asr/CMakeFiles/iat_record.dir/requires: xf-ros/xfei_asr/CMakeFiles/iat_record.dir/src/iat_record.c.o.requires
xf-ros/xfei_asr/CMakeFiles/iat_record.dir/requires: xf-ros/xfei_asr/CMakeFiles/iat_record.dir/src/speech_recognizer.c.o.requires
xf-ros/xfei_asr/CMakeFiles/iat_record.dir/requires: xf-ros/xfei_asr/CMakeFiles/iat_record.dir/src/linuxrec.c.o.requires

.PHONY : xf-ros/xfei_asr/CMakeFiles/iat_record.dir/requires

xf-ros/xfei_asr/CMakeFiles/iat_record.dir/clean:
	cd /home/hdy/catkin_ws/build/xf-ros/xfei_asr && $(CMAKE_COMMAND) -P CMakeFiles/iat_record.dir/cmake_clean.cmake
.PHONY : xf-ros/xfei_asr/CMakeFiles/iat_record.dir/clean

xf-ros/xfei_asr/CMakeFiles/iat_record.dir/depend:
	cd /home/hdy/catkin_ws/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/hdy/catkin_ws/src /home/hdy/catkin_ws/src/xf-ros/xfei_asr /home/hdy/catkin_ws/build /home/hdy/catkin_ws/build/xf-ros/xfei_asr /home/hdy/catkin_ws/build/xf-ros/xfei_asr/CMakeFiles/iat_record.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : xf-ros/xfei_asr/CMakeFiles/iat_record.dir/depend
