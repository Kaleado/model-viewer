# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.12

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
CMAKE_COMMAND = /home/kaleado/Downloads/CLion-2018.2.3/clion-2018.2.3/bin/cmake/linux/bin/cmake

# The command to remove a file.
RM = /home/kaleado/Downloads/CLion-2018.2.3/clion-2018.2.3/bin/cmake/linux/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/kaleado/Programming/ogl-renderer/ogl-master

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/kaleado/Programming/ogl-renderer/ogl-master/cmake-build-debug

# Include any dependencies generated for this target.
include nlohmann-json/test/CMakeFiles/test-concepts.dir/depend.make

# Include the progress variables for this target.
include nlohmann-json/test/CMakeFiles/test-concepts.dir/progress.make

# Include the compile flags for this target's objects.
include nlohmann-json/test/CMakeFiles/test-concepts.dir/flags.make

nlohmann-json/test/CMakeFiles/test-concepts.dir/src/unit-concepts.cpp.o: nlohmann-json/test/CMakeFiles/test-concepts.dir/flags.make
nlohmann-json/test/CMakeFiles/test-concepts.dir/src/unit-concepts.cpp.o: ../nlohmann-json/test/src/unit-concepts.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/kaleado/Programming/ogl-renderer/ogl-master/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object nlohmann-json/test/CMakeFiles/test-concepts.dir/src/unit-concepts.cpp.o"
	cd /home/kaleado/Programming/ogl-renderer/ogl-master/cmake-build-debug/nlohmann-json/test && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/test-concepts.dir/src/unit-concepts.cpp.o -c /home/kaleado/Programming/ogl-renderer/ogl-master/nlohmann-json/test/src/unit-concepts.cpp

nlohmann-json/test/CMakeFiles/test-concepts.dir/src/unit-concepts.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/test-concepts.dir/src/unit-concepts.cpp.i"
	cd /home/kaleado/Programming/ogl-renderer/ogl-master/cmake-build-debug/nlohmann-json/test && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/kaleado/Programming/ogl-renderer/ogl-master/nlohmann-json/test/src/unit-concepts.cpp > CMakeFiles/test-concepts.dir/src/unit-concepts.cpp.i

nlohmann-json/test/CMakeFiles/test-concepts.dir/src/unit-concepts.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/test-concepts.dir/src/unit-concepts.cpp.s"
	cd /home/kaleado/Programming/ogl-renderer/ogl-master/cmake-build-debug/nlohmann-json/test && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/kaleado/Programming/ogl-renderer/ogl-master/nlohmann-json/test/src/unit-concepts.cpp -o CMakeFiles/test-concepts.dir/src/unit-concepts.cpp.s

# Object files for target test-concepts
test__concepts_OBJECTS = \
"CMakeFiles/test-concepts.dir/src/unit-concepts.cpp.o"

# External object files for target test-concepts
test__concepts_EXTERNAL_OBJECTS = \
"/home/kaleado/Programming/ogl-renderer/ogl-master/cmake-build-debug/nlohmann-json/test/CMakeFiles/catch_main.dir/src/unit.cpp.o"

nlohmann-json/test/test-concepts: nlohmann-json/test/CMakeFiles/test-concepts.dir/src/unit-concepts.cpp.o
nlohmann-json/test/test-concepts: nlohmann-json/test/CMakeFiles/catch_main.dir/src/unit.cpp.o
nlohmann-json/test/test-concepts: nlohmann-json/test/CMakeFiles/test-concepts.dir/build.make
nlohmann-json/test/test-concepts: nlohmann-json/test/CMakeFiles/test-concepts.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/kaleado/Programming/ogl-renderer/ogl-master/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable test-concepts"
	cd /home/kaleado/Programming/ogl-renderer/ogl-master/cmake-build-debug/nlohmann-json/test && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/test-concepts.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
nlohmann-json/test/CMakeFiles/test-concepts.dir/build: nlohmann-json/test/test-concepts

.PHONY : nlohmann-json/test/CMakeFiles/test-concepts.dir/build

nlohmann-json/test/CMakeFiles/test-concepts.dir/clean:
	cd /home/kaleado/Programming/ogl-renderer/ogl-master/cmake-build-debug/nlohmann-json/test && $(CMAKE_COMMAND) -P CMakeFiles/test-concepts.dir/cmake_clean.cmake
.PHONY : nlohmann-json/test/CMakeFiles/test-concepts.dir/clean

nlohmann-json/test/CMakeFiles/test-concepts.dir/depend:
	cd /home/kaleado/Programming/ogl-renderer/ogl-master/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/kaleado/Programming/ogl-renderer/ogl-master /home/kaleado/Programming/ogl-renderer/ogl-master/nlohmann-json/test /home/kaleado/Programming/ogl-renderer/ogl-master/cmake-build-debug /home/kaleado/Programming/ogl-renderer/ogl-master/cmake-build-debug/nlohmann-json/test /home/kaleado/Programming/ogl-renderer/ogl-master/cmake-build-debug/nlohmann-json/test/CMakeFiles/test-concepts.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : nlohmann-json/test/CMakeFiles/test-concepts.dir/depend
