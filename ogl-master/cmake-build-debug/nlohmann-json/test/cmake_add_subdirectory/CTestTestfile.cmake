# CMake generated Testfile for 
# Source directory: /home/kaleado/Programming/ogl-renderer/ogl-master/nlohmann-json/test/cmake_add_subdirectory
# Build directory: /home/kaleado/Programming/ogl-renderer/ogl-master/cmake-build-debug/nlohmann-json/test/cmake_add_subdirectory
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(cmake_add_subdirectory_configure "/home/kaleado/Downloads/CLion-2018.2.3/clion-2018.2.3/bin/cmake/linux/bin/cmake" "-G" "Unix Makefiles" "-Dnlohmann_json_source=/home/kaleado/Programming/ogl-renderer/ogl-master/nlohmann-json" "/home/kaleado/Programming/ogl-renderer/ogl-master/nlohmann-json/test/cmake_add_subdirectory/project")
set_tests_properties(cmake_add_subdirectory_configure PROPERTIES  FIXTURES_SETUP "cmake_add_subdirectory")
add_test(cmake_add_subdirectory_build "/home/kaleado/Downloads/CLion-2018.2.3/clion-2018.2.3/bin/cmake/linux/bin/cmake" "--build" ".")
set_tests_properties(cmake_add_subdirectory_build PROPERTIES  FIXTURES_REQUIRED "cmake_add_subdirectory")
