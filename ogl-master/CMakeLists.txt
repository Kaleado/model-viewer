# CMake entry point
cmake_minimum_required (VERSION 3.0)
project (ogl-renderer)

find_program(MAGICK_CONFIG "Magick++-config")

# Required for nlohmann json.
set(JSON_BuildTests OFF CACHE INTERNAL "")

execute_process(COMMAND "${MAGICK_CONFIG}" "--cxxflags" OUTPUT_VARIABLE MAGICK_CXX_FLAGS)
execute_process(COMMAND "${MAGICK_CONFIG}" "--libs" OUTPUT_VARIABLE MAGICK_LD_FLAGS)
string(STRIP "${MAGICK_CXX_FLAGS}" MAGICK_CXX_FLAGS)
string(STRIP "${MAGICK_LD_FLAGS}" MAGICK_LD_FLAGS)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11 ${MAGICK_CXX_FLAGS} ${MAGICK_LD_FLAGS}")

find_package(OpenGL REQUIRED)
find_package(ImageMagick COMPONENTS Magick++)

if( CMAKE_BINARY_DIR STREQUAL CMAKE_SOURCE_DIR )
    message( FATAL_ERROR "Cannot set the build directory to be the same as the source directory." )
endif()
if( CMAKE_SOURCE_DIR MATCHES " " )
	message( WARNING "The source directory specified contains spaces, which can cause issues whilst compiling." )
endif()
if( CMAKE_BINARY_DIR MATCHES " " )
	message( WARNING "The build directory specified contains spaces, which can cause issues whilst compiling." )
endif()

# Compile external dependencies 
add_subdirectory (external)
add_subdirectory (nlohmann-json)

# On Visual 2005 and above, this module can set the debug working directory
cmake_policy(SET CMP0026 OLD)
list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/external/rpavlik-cmake-modules-fe2273")
include(CreateLaunchers)
include(MSVCMultipleProcessCompile) # /MP

if(INCLUDE_DISTRIB)
	add_subdirectory(distrib)
endif(INCLUDE_DISTRIB)

include_directories(
	external/AntTweakBar-1.16/include/
	external/glfw-3.1.2/include/
	external/glm-0.9.7.1/
	external/glew-1.13.0/include/
	external/assimp-3.0.1270/include/
	external/bullet-2.81-rev2613/src/
	${ImageMagick_INCLUDE_DIRS}
	.
)

set(ALL_LIBS
	${OPENGL_LIBRARY}
	glfw
	GLEW_1130
	${MAGICK_LD_FLAGS}
	${ImageMagick_LIBRARIES}
    nlohmann_json::nlohmann_json
)

add_definitions(
	-DTW_STATIC
	-DTW_NO_LIB_PRAGMA
	-DTW_NO_DIRECT3D
	-DGLEW_STATIC
	-D_CRT_SECURE_NO_WARNINGS
)

add_definitions( -DMAGICKCORE_QUANTUM_DEPTH=16 )
add_definitions( -DMAGICKCORE_HDRI_ENABLE=0 )

add_executable(ogl-renderer
		ogl-renderer/main.cpp
		ogl-renderer/TriangleMesh.cpp
		ogl-renderer/TriangleMesh.hpp
		ogl-renderer/tinyply.h
		ogl-renderer/TransformVertexShader.vertexshader
		ogl-renderer/ColorFragmentShader.fragmentshader
		ogl-renderer/Shader.cpp ogl-renderer/Shader.hpp ogl-renderer/Texture.cpp ogl-renderer/Texture.hpp ogl-renderer/Util.cpp ogl-renderer/Util.hpp ogl-renderer/Camera.cpp ogl-renderer/Camera.hpp ogl-renderer/SceneTree.cpp ogl-renderer/SceneTree.hpp ogl-renderer/Thing.cpp ogl-renderer/Thing.hpp
		)

target_link_libraries(
	ogl-renderer
	${ALL_LIBS}
)

set_target_properties(ogl-renderer PROPERTIES XCODE_ATTRIBUTE_CONFIGURATION_BUILD_DIR "${CMAKE_CURRENT_SOURCE_DIR}/ogl-renderer/")
create_target_launcher(ogl-renderer WORKING_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/ogl-renderer/")

if (NOT ${CMAKE_GENERATOR} MATCHES "Xcode" )
add_custom_command(
   TARGET ogl-renderer POST_BUILD
   COMMAND ${CMAKE_COMMAND} -E copy "${CMAKE_CURRENT_BINARY_DIR}/${CMAKE_CFG_INTDIR}/ogl-renderer${CMAKE_EXECUTABLE_SUFFIX}" "${CMAKE_CURRENT_SOURCE_DIR}/ogl-renderer/"
)

elseif (${CMAKE_GENERATOR} MATCHES "Xcode" )

endif (NOT ${CMAKE_GENERATOR} MATCHES "Xcode" )

