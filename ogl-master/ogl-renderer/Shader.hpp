//
// Created by kaleado on 4/01/19.
//

#ifndef TUTORIALS_SHADER_HPP
#define TUTORIALS_SHADER_HPP

#include <glm/glm.hpp>
#include <string>
#include <GL/glew.h>

//!Represents the currently loaded GLSL shader.
class Shader {
private:
    static GLuint programID;
    static glm::mat4 modelMatrix;
    static glm::mat4 viewMatrix;
    static glm::mat4 projectionMatrix;
    static std::string vertexShaderPath;
    static std::string fragmentShaderPath;

    static std::string readFile(std::ifstream& strm);

public:

    static const GLuint POSITION;
    static const GLuint NORMAL;
    static const GLuint TEX_COORD;
    static const GLuint COLOR;

    static void setModelMatrix(const glm::mat4 &modelMatrix);

    static void setViewMatrix(const glm::mat4 &viewMatrix);

    static void setProjectionMatrix(const glm::mat4 &projectionMatrix);

    static void setVertexShaderPath(const std::string &vertexShaderPath);

    static void setFragmentShaderPath(const std::string &fragmentShaderPath);

    //!Compiles and links the fragment and vertex shaders specified, and creates a program for use.
    static void compile();

    //!Sets the compiled shader program to be used during rendering.
    static void use();

    static GLuint getProgramID();

};

#endif //TUTORIALS_SHADER_HPP
