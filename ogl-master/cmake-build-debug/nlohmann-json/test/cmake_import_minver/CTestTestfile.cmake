# CMake generated Testfile for 
# Source directory: /home/kaleado/Programming/ogl-renderer/ogl-master/nlohmann-json/test/cmake_import_minver
# Build directory: /home/kaleado/Programming/ogl-renderer/ogl-master/cmake-build-debug/nlohmann-json/test/cmake_import_minver
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(cmake_import_minver_configure "/home/kaleado/Downloads/CLion-2018.2.3/clion-2018.2.3/bin/cmake/linux/bin/cmake" "-G" "Unix Makefiles" "-Dnlohmann_json_DIR=/home/kaleado/Programming/ogl-renderer/ogl-master/cmake-build-debug/nlohmann-json" "/home/kaleado/Programming/ogl-renderer/ogl-master/nlohmann-json/test/cmake_import_minver/project")
set_tests_properties(cmake_import_minver_configure PROPERTIES  FIXTURES_SETUP "cmake_import_minver")
add_test(cmake_import_minver_build "/home/kaleado/Downloads/CLion-2018.2.3/clion-2018.2.3/bin/cmake/linux/bin/cmake" "--build" ".")
set_tests_properties(cmake_import_minver_build PROPERTIES  FIXTURES_REQUIRED "cmake_import_minver")
