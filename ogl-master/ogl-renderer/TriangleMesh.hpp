//
// Created by kaleado on 3/01/19.
//

#ifndef TUTORIALS_MODEL_HPP
#define TUTORIALS_MODEL_HPP

// Libraries
// Include GLEW
#include <GL/glew.h>

// Include GLFW
#include <GLFW/glfw3.h>

// Include GLM
#include <glm/glm.hpp>
#include <glm/gtc/matrix_transform.hpp>
#include <vector>
#include <string>

//Include my files
#include "Shader.hpp"
#include "Thing.hpp"

class TriangleMesh : public Thing {
private:
    std::string plyPath;

    std::vector<glm::vec3> vertices;
    std::vector<GLuint[3]> faces;
    std::vector<glm::vec2> texcoords;
    std::vector<glm::vec3> normals;

    GLuint vertexArrayID;
    GLuint vertexbuffer;
    GLuint colorbuffer;
    GLuint elementbuffer;
    GLuint texCoordBuffer;
    GLuint programID;

public:

    const std::string &getPlyPath() const;

    void setPlyPath(const std::string &plyPath);

    void draw(glm::mat4 transform) override;

    void load();

    TriangleMesh() = default;

    virtual ~TriangleMesh();

};


#endif //TUTORIALS_MODEL_HPP
