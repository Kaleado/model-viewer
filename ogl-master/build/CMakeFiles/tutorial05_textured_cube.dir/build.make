# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.10

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
CMAKE_SOURCE_DIR = /home/kaleado/Downloads/ogl-master

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/kaleado/Downloads/ogl-master/build

# Include any dependencies generated for this target.
include CMakeFiles/tutorial05_textured_cube.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/tutorial05_textured_cube.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/tutorial05_textured_cube.dir/flags.make

CMakeFiles/tutorial05_textured_cube.dir/tutorial05_textured_cube/tutorial05.cpp.o: CMakeFiles/tutorial05_textured_cube.dir/flags.make
CMakeFiles/tutorial05_textured_cube.dir/tutorial05_textured_cube/tutorial05.cpp.o: ../tutorial05_textured_cube/tutorial05.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/kaleado/Downloads/ogl-master/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/tutorial05_textured_cube.dir/tutorial05_textured_cube/tutorial05.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/tutorial05_textured_cube.dir/tutorial05_textured_cube/tutorial05.cpp.o -c /home/kaleado/Downloads/ogl-master/tutorial05_textured_cube/tutorial05.cpp

CMakeFiles/tutorial05_textured_cube.dir/tutorial05_textured_cube/tutorial05.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/tutorial05_textured_cube.dir/tutorial05_textured_cube/tutorial05.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/kaleado/Downloads/ogl-master/tutorial05_textured_cube/tutorial05.cpp > CMakeFiles/tutorial05_textured_cube.dir/tutorial05_textured_cube/tutorial05.cpp.i

CMakeFiles/tutorial05_textured_cube.dir/tutorial05_textured_cube/tutorial05.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/tutorial05_textured_cube.dir/tutorial05_textured_cube/tutorial05.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/kaleado/Downloads/ogl-master/tutorial05_textured_cube/tutorial05.cpp -o CMakeFiles/tutorial05_textured_cube.dir/tutorial05_textured_cube/tutorial05.cpp.s

CMakeFiles/tutorial05_textured_cube.dir/tutorial05_textured_cube/tutorial05.cpp.o.requires:

.PHONY : CMakeFiles/tutorial05_textured_cube.dir/tutorial05_textured_cube/tutorial05.cpp.o.requires

CMakeFiles/tutorial05_textured_cube.dir/tutorial05_textured_cube/tutorial05.cpp.o.provides: CMakeFiles/tutorial05_textured_cube.dir/tutorial05_textured_cube/tutorial05.cpp.o.requires
	$(MAKE) -f CMakeFiles/tutorial05_textured_cube.dir/build.make CMakeFiles/tutorial05_textured_cube.dir/tutorial05_textured_cube/tutorial05.cpp.o.provides.build
.PHONY : CMakeFiles/tutorial05_textured_cube.dir/tutorial05_textured_cube/tutorial05.cpp.o.provides

CMakeFiles/tutorial05_textured_cube.dir/tutorial05_textured_cube/tutorial05.cpp.o.provides.build: CMakeFiles/tutorial05_textured_cube.dir/tutorial05_textured_cube/tutorial05.cpp.o


CMakeFiles/tutorial05_textured_cube.dir/common/shader.cpp.o: CMakeFiles/tutorial05_textured_cube.dir/flags.make
CMakeFiles/tutorial05_textured_cube.dir/common/shader.cpp.o: ../common/shader.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/kaleado/Downloads/ogl-master/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/tutorial05_textured_cube.dir/common/shader.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/tutorial05_textured_cube.dir/common/shader.cpp.o -c /home/kaleado/Downloads/ogl-master/common/shader.cpp

CMakeFiles/tutorial05_textured_cube.dir/common/shader.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/tutorial05_textured_cube.dir/common/shader.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/kaleado/Downloads/ogl-master/common/shader.cpp > CMakeFiles/tutorial05_textured_cube.dir/common/shader.cpp.i

CMakeFiles/tutorial05_textured_cube.dir/common/shader.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/tutorial05_textured_cube.dir/common/shader.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/kaleado/Downloads/ogl-master/common/shader.cpp -o CMakeFiles/tutorial05_textured_cube.dir/common/shader.cpp.s

CMakeFiles/tutorial05_textured_cube.dir/common/shader.cpp.o.requires:

.PHONY : CMakeFiles/tutorial05_textured_cube.dir/common/shader.cpp.o.requires

CMakeFiles/tutorial05_textured_cube.dir/common/shader.cpp.o.provides: CMakeFiles/tutorial05_textured_cube.dir/common/shader.cpp.o.requires
	$(MAKE) -f CMakeFiles/tutorial05_textured_cube.dir/build.make CMakeFiles/tutorial05_textured_cube.dir/common/shader.cpp.o.provides.build
.PHONY : CMakeFiles/tutorial05_textured_cube.dir/common/shader.cpp.o.provides

CMakeFiles/tutorial05_textured_cube.dir/common/shader.cpp.o.provides.build: CMakeFiles/tutorial05_textured_cube.dir/common/shader.cpp.o


CMakeFiles/tutorial05_textured_cube.dir/common/texture.cpp.o: CMakeFiles/tutorial05_textured_cube.dir/flags.make
CMakeFiles/tutorial05_textured_cube.dir/common/texture.cpp.o: ../common/texture.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/kaleado/Downloads/ogl-master/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/tutorial05_textured_cube.dir/common/texture.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/tutorial05_textured_cube.dir/common/texture.cpp.o -c /home/kaleado/Downloads/ogl-master/common/texture.cpp

CMakeFiles/tutorial05_textured_cube.dir/common/texture.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/tutorial05_textured_cube.dir/common/texture.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/kaleado/Downloads/ogl-master/common/texture.cpp > CMakeFiles/tutorial05_textured_cube.dir/common/texture.cpp.i

CMakeFiles/tutorial05_textured_cube.dir/common/texture.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/tutorial05_textured_cube.dir/common/texture.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/kaleado/Downloads/ogl-master/common/texture.cpp -o CMakeFiles/tutorial05_textured_cube.dir/common/texture.cpp.s

CMakeFiles/tutorial05_textured_cube.dir/common/texture.cpp.o.requires:

.PHONY : CMakeFiles/tutorial05_textured_cube.dir/common/texture.cpp.o.requires

CMakeFiles/tutorial05_textured_cube.dir/common/texture.cpp.o.provides: CMakeFiles/tutorial05_textured_cube.dir/common/texture.cpp.o.requires
	$(MAKE) -f CMakeFiles/tutorial05_textured_cube.dir/build.make CMakeFiles/tutorial05_textured_cube.dir/common/texture.cpp.o.provides.build
.PHONY : CMakeFiles/tutorial05_textured_cube.dir/common/texture.cpp.o.provides

CMakeFiles/tutorial05_textured_cube.dir/common/texture.cpp.o.provides.build: CMakeFiles/tutorial05_textured_cube.dir/common/texture.cpp.o


# Object files for target tutorial05_textured_cube
tutorial05_textured_cube_OBJECTS = \
"CMakeFiles/tutorial05_textured_cube.dir/tutorial05_textured_cube/tutorial05.cpp.o" \
"CMakeFiles/tutorial05_textured_cube.dir/common/shader.cpp.o" \
"CMakeFiles/tutorial05_textured_cube.dir/common/texture.cpp.o"

# External object files for target tutorial05_textured_cube
tutorial05_textured_cube_EXTERNAL_OBJECTS =

tutorial05_textured_cube: CMakeFiles/tutorial05_textured_cube.dir/tutorial05_textured_cube/tutorial05.cpp.o
tutorial05_textured_cube: CMakeFiles/tutorial05_textured_cube.dir/common/shader.cpp.o
tutorial05_textured_cube: CMakeFiles/tutorial05_textured_cube.dir/common/texture.cpp.o
tutorial05_textured_cube: CMakeFiles/tutorial05_textured_cube.dir/build.make
tutorial05_textured_cube: /usr/lib/x86_64-linux-gnu/libGL.so
tutorial05_textured_cube: /usr/lib/x86_64-linux-gnu/libGLU.so
tutorial05_textured_cube: external/glfw-3.1.2/src/libglfw3.a
tutorial05_textured_cube: external/libGLEW_1130.a
tutorial05_textured_cube: /usr/lib/x86_64-linux-gnu/librt.so
tutorial05_textured_cube: /usr/lib/x86_64-linux-gnu/libm.so
tutorial05_textured_cube: /usr/lib/x86_64-linux-gnu/libX11.so
tutorial05_textured_cube: /usr/lib/x86_64-linux-gnu/libXrandr.so
tutorial05_textured_cube: /usr/lib/x86_64-linux-gnu/libXinerama.so
tutorial05_textured_cube: /usr/lib/x86_64-linux-gnu/libXi.so
tutorial05_textured_cube: /usr/lib/x86_64-linux-gnu/libXxf86vm.so
tutorial05_textured_cube: /usr/lib/x86_64-linux-gnu/libXcursor.so
tutorial05_textured_cube: /usr/lib/x86_64-linux-gnu/librt.so
tutorial05_textured_cube: /usr/lib/x86_64-linux-gnu/libm.so
tutorial05_textured_cube: /usr/lib/x86_64-linux-gnu/libX11.so
tutorial05_textured_cube: /usr/lib/x86_64-linux-gnu/libXrandr.so
tutorial05_textured_cube: /usr/lib/x86_64-linux-gnu/libXinerama.so
tutorial05_textured_cube: /usr/lib/x86_64-linux-gnu/libXi.so
tutorial05_textured_cube: /usr/lib/x86_64-linux-gnu/libXxf86vm.so
tutorial05_textured_cube: /usr/lib/x86_64-linux-gnu/libXcursor.so
tutorial05_textured_cube: /usr/lib/x86_64-linux-gnu/libGL.so
tutorial05_textured_cube: /usr/lib/x86_64-linux-gnu/libGLU.so
tutorial05_textured_cube: CMakeFiles/tutorial05_textured_cube.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/kaleado/Downloads/ogl-master/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Linking CXX executable tutorial05_textured_cube"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/tutorial05_textured_cube.dir/link.txt --verbose=$(VERBOSE)
	/usr/bin/cmake -E copy /home/kaleado/Downloads/ogl-master/build/./tutorial05_textured_cube /home/kaleado/Downloads/ogl-master/tutorial05_textured_cube/

# Rule to build all files generated by this target.
CMakeFiles/tutorial05_textured_cube.dir/build: tutorial05_textured_cube

.PHONY : CMakeFiles/tutorial05_textured_cube.dir/build

CMakeFiles/tutorial05_textured_cube.dir/requires: CMakeFiles/tutorial05_textured_cube.dir/tutorial05_textured_cube/tutorial05.cpp.o.requires
CMakeFiles/tutorial05_textured_cube.dir/requires: CMakeFiles/tutorial05_textured_cube.dir/common/shader.cpp.o.requires
CMakeFiles/tutorial05_textured_cube.dir/requires: CMakeFiles/tutorial05_textured_cube.dir/common/texture.cpp.o.requires

.PHONY : CMakeFiles/tutorial05_textured_cube.dir/requires

CMakeFiles/tutorial05_textured_cube.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/tutorial05_textured_cube.dir/cmake_clean.cmake
.PHONY : CMakeFiles/tutorial05_textured_cube.dir/clean

CMakeFiles/tutorial05_textured_cube.dir/depend:
	cd /home/kaleado/Downloads/ogl-master/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/kaleado/Downloads/ogl-master /home/kaleado/Downloads/ogl-master /home/kaleado/Downloads/ogl-master/build /home/kaleado/Downloads/ogl-master/build /home/kaleado/Downloads/ogl-master/build/CMakeFiles/tutorial05_textured_cube.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/tutorial05_textured_cube.dir/depend

