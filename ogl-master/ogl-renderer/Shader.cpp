//
// Created by kaleado on 4/01/19.
//

#include <stdexcept>
#include <fstream>
#include <sstream>
#include <vector>
#include <iostream>
#include "Shader.hpp"

//Static member definitions.
GLuint Shader::programID = 0;
glm::mat4 Shader::modelMatrix = glm::mat4(1.0f);
glm::mat4 Shader::viewMatrix = glm::mat4(1.0f);
glm::mat4 Shader::projectionMatrix = glm::mat4(1.0f);
std::string Shader::vertexShaderPath = "";
std::string Shader::fragmentShaderPath = "";

const GLuint Shader::POSITION = 0;
const GLuint Shader::NORMAL = 1;
const GLuint Shader::TEX_COORD = 2;
const GLuint Shader::COLOR = 3;

void Shader::setModelMatrix(const glm::mat4 &modelMatrix) {
    Shader::modelMatrix = modelMatrix;
    auto matrixID = static_cast<GLuint>(glGetUniformLocation(programID, "modelMatrix"));
    if(matrixID == -1) throw std::invalid_argument("Shader::setModelMatrix(): attempted to access an invalid uniform.");
    glUniformMatrix4fv(matrixID, 1, GL_FALSE, &modelMatrix[0][0]);
}

void Shader::setViewMatrix(const glm::mat4 &viewMatrix) {
    Shader::viewMatrix = viewMatrix;
    auto matrixID = static_cast<GLuint>(glGetUniformLocation(programID, "viewMatrix"));
    if(matrixID == -1) throw std::invalid_argument("Shader::setViewMatrix(): attempted to access an invalid uniform.");
    glUniformMatrix4fv(matrixID, 1, GL_FALSE, &viewMatrix[0][0]);
}

void Shader::setProjectionMatrix(const glm::mat4 &projectionMatrix) {
    Shader::projectionMatrix = projectionMatrix;
    auto matrixID = static_cast<GLuint>(glGetUniformLocation(programID, "projectionMatrix"));
    if(matrixID == -1) throw std::invalid_argument("Shader::setProjectionMatrix(): attempted to access an invalid uniform.");
    glUniformMatrix4fv(matrixID, 1, GL_FALSE, &projectionMatrix[0][0]);
}

void Shader::setVertexShaderPath(const std::string &vertexShaderPath) {
    Shader::vertexShaderPath = vertexShaderPath;
}

void Shader::setFragmentShaderPath(const std::string &fragmentShaderPath) {
    Shader::fragmentShaderPath = fragmentShaderPath;
}

void Shader::compile() {
    //Load and compile our shaders, creating the shader program necessary for rendering.
    //programID = LoadShaders(vertexShaderPath.c_str(), fragmentShaderPath.c_str());
    GLuint vertexShaderID = glCreateShader(GL_VERTEX_SHADER);
    GLuint fragmentShaderID = glCreateShader(GL_FRAGMENT_SHADER);

    std::string vertexShaderCode;
    std::ifstream vertexShaderStream(vertexShaderPath, std::ios::in);
    vertexShaderCode = readFile(vertexShaderStream);
    std::cout << vertexShaderCode;

    std::string fragmentShaderCode;
    std::ifstream fragmentShaderStream(fragmentShaderPath, std::ios::in);
    fragmentShaderCode = readFile(fragmentShaderStream);

    GLint result;
    int infoLogLength;

    //Compile and check vertex shader.
    char const* vertexSourcePointer = vertexShaderCode.c_str();
    glShaderSource(vertexShaderID, 1, &vertexSourcePointer, nullptr);
    glCompileShader(vertexShaderID);
    glGetShaderiv(vertexShaderID, GL_COMPILE_STATUS, &result);
    glGetShaderiv(vertexShaderID, GL_INFO_LOG_LENGTH, &infoLogLength);
    if(infoLogLength > 0) {
        std::vector<char> vertexShaderErrorMessage(infoLogLength+1);
        glGetShaderInfoLog(vertexShaderID, infoLogLength, nullptr, &vertexShaderErrorMessage[0]);
        printf("%s\n", &vertexShaderErrorMessage[0]);
    }

    //Compile and check fragment shader.
    char const* fragmentSourcePointer = fragmentShaderCode.c_str();
    glShaderSource(fragmentShaderID, 1, &fragmentSourcePointer, nullptr);
    glCompileShader(fragmentShaderID);
    glGetShaderiv(fragmentShaderID, GL_COMPILE_STATUS, &result);
    glGetShaderiv(fragmentShaderID, GL_INFO_LOG_LENGTH, &infoLogLength);
    if(infoLogLength > 0) {
        std::vector<char> fragmentShaderErrorMessage(infoLogLength+1);
        glGetShaderInfoLog(fragmentShaderID, infoLogLength, nullptr, &fragmentShaderErrorMessage[0]);
        printf("%s\n", &fragmentShaderErrorMessage[0]);
    }

    programID = glCreateProgram();
    glAttachShader(programID, vertexShaderID);
    glAttachShader(programID, fragmentShaderID);

    glBindAttribLocation(programID, POSITION, "position");
    glBindAttribLocation(programID, NORMAL, "normal");
    glBindAttribLocation(programID, TEX_COORD, "texCoord");
    glBindAttribLocation(programID, COLOR, "color");

    glLinkProgram(programID);

    // Check the program
    glGetProgramiv(programID, GL_LINK_STATUS, &result);
    glGetProgramiv(programID, GL_INFO_LOG_LENGTH, &infoLogLength);
    if(infoLogLength > 0) {
        std::vector<char> programErrorMessage(infoLogLength+1);
        glGetProgramInfoLog(programID, infoLogLength, nullptr, &programErrorMessage[0]);
        printf("%s\n", &programErrorMessage[0]);
    }

    glEnableVertexAttribArray(POSITION);
    if(glGetAttribLocation(programID, "normal") != -1) {
        glEnableVertexAttribArray(NORMAL);
    }
    if (glGetAttribLocation(programID, "texCoord") != -1) {
        glEnableVertexAttribArray(TEX_COORD);
    }
    if (glGetAttribLocation(programID, "color") != -1) {
        glEnableVertexAttribArray(COLOR);
    }

    glDetachShader(programID, vertexShaderID);
    glDetachShader(programID, fragmentShaderID);

    glDeleteShader(vertexShaderID);
    glDeleteShader(fragmentShaderID);

}

void Shader::use() {
    if(programID == 0){
        throw std::invalid_argument("Shader::use(): shader program ID is 0. Did you run Shader::compile()?");
    }
    glUseProgram(programID);
}

GLuint Shader::getProgramID() {
    return programID;
}

std::string Shader::readFile(std::ifstream& strm) {
    std::string res;
    if(strm.is_open()) {
        std::stringstream sstr;
        sstr << strm.rdbuf();
        res = sstr.str();
        strm.close();
    }
    else {
        throw std::invalid_argument("Shader::readfile(): invalid stream.");
    }
    return res;
}

