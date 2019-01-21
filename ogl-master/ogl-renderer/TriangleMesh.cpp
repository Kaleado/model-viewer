//
// Created by kaleado on 3/01/19.
//

#include <fstream>
#include <iostream>
#include <glm/gtc/matrix_transform.hpp>
#include "TriangleMesh.hpp"
#include "Util.hpp"

#define TINYPLY_IMPLEMENTATION
#include "tinyply.h"

#define TINYOBJLOADER_IMPLEMENTATION
#include "tiny_obj_loader.h"

void TriangleMesh::draw(glm::mat4 model) {
    // Projection matrix : 45 deg Field of View, 4:3 ratio, display range : 0.1 unit <-> 100 units
    glm::mat4 projection = glm::perspective(glm::radians(45.0f), 4.0f / 3.0f, 0.1f, 100.0f);
    Shader::setProjectionMatrix(projection);

//    // Camera matrix
//    glm::mat4 view       = glm::lookAt(
//            glm::vec3(0.4,0.4,-0.4), // Camera is at this point in World Space
//            glm::vec3(0,0,0), // and looks at the origin
//            glm::vec3(0,1,0)  // Head is up (set to 0,-1,0 to look upside-down)
//    );
//    Shader::setViewMatrix(view);

    Shader::setModelMatrix(model);

    // Use our shader
    Shader::use();

    glBindVertexArray(vertexArrayID);

    // Index buffer
    // Draw the triangles !
    glDrawElements(
            GL_TRIANGLES,      // mode
            static_cast<GLsizei>(this->faces.size() * 3),    // count
            GL_UNSIGNED_INT,   // type
            (void*)0           // element array buffer offset
    );

    Thing::draw(model);

}

void TriangleMesh::load() {
    std::ifstream ss(plyPath);
    tinyply::PlyFile file;
    file.parse_header(ss);
    for(auto c : file.get_elements()){ std::cout << c.name << "(" << c.size << " bytes) " << std::endl; }
    std::shared_ptr<tinyply::PlyData> vertices, normals, faces, texcoords;
    try { vertices = file.request_properties_from_element("vertex", { "x", "y", "z" }); }
    catch (const std::exception & e) { std::cerr << "tinyply exception: " << e.what() << std::endl; }

    try { normals = file.request_properties_from_element("vertex", { "nx", "ny", "nz" }); }
    catch (const std::exception & e) { std::cerr << "tinyply exception: " << e.what() << std::endl; }

    try { texcoords = file.request_properties_from_element("vertex", { "u", "v" }); }
    catch (const std::exception & e) { std::cerr << "tinyply exception: " << e.what() << std::endl; }

    // Providing a list size hint (the last argument) is a 2x performance improvement. If you have
    // arbitrary ply files, it is best to leave this 0.
    try { faces = file.request_properties_from_element("face", { "vertex_indices" }, 3); }
    catch (const std::exception & e) { std::cerr << "tinyply exception: " << e.what() << std::endl; }

    file.read(ss);

    if (vertices) std::cout << "\tRead " << vertices->count << " total vertices "<< std::endl;
    if (normals) std::cout << "\tRead " << normals->count << " total vertex normals " << std::endl;
    if (texcoords) std::cout << "\tRead " << texcoords->count << " total vertex texcoords " << std::endl;
    if (faces) std::cout << "\tRead " << faces->count << " total faces (triangles) " << std::endl;

    // type casting to your own native types - Option A
    {
        //Copying vertices.
        const size_t numVerticesBytes = vertices->buffer.size_bytes();
        this->vertices = std::vector<glm::vec3>(vertices->count);
        std::memcpy(this->vertices.data(), vertices->buffer.get(), numVerticesBytes);

        //Copying face indices.
        this->faces = std::vector<GLuint[3]>(faces->count);
        const size_t numFacesBytes = faces->buffer.size_bytes();
        std::memcpy(this->faces.data(), faces->buffer.get(), numFacesBytes);
    }

    //for(auto v : this->vertices) { std::cout << v.x << " " << v.y << " " << v.z << std::endl; }
    //for(auto f : this->faces) { std::cout << f[0] << " " << f[1] << " " << f[2] << std::endl; }

    //Now we load our buffers on the GPU and set up our VAO.
    //Create our VAO.
    glGenVertexArrays(1, &vertexArrayID);
    glBindVertexArray(vertexArrayID);

    glGenBuffers(1, &vertexbuffer);
    glBindBuffer(GL_ARRAY_BUFFER, vertexbuffer);
    glBufferData(
            GL_ARRAY_BUFFER,
            this->vertices.size() * sizeof(glm::vec3),
            &this->vertices[0],
            GL_STATIC_DRAW
            );
    printGlErrors(__FILE__, __LINE__);

    // 1rst attribute buffer : vertices
    glEnableVertexAttribArray(Shader::POSITION);
    glBindBuffer(GL_ARRAY_BUFFER, vertexbuffer);
    glVertexAttribPointer(
            Shader::POSITION,                  // attribute. No particular reason for 0, but must match the layout in the shader.
            3,                  // size
            GL_FLOAT,           // type
            GL_FALSE,           // normalized?
            0,                  // stride
            (void*)0            // array buffer offset
    );
    printGlErrors(__FILE__, __LINE__);

    // Generate random texCoords.
    std::vector<glm::vec2> fake;
    for(int i = 0; i < this->vertices.size(); ++i){
        fake.emplace_back((i % 2) * 0.01f, ((i + 1) % 2) * 0.01f);
    }
    std::cout << std::boolalpha << "******" << fake.size() << "*******" << std::endl;
    glGenBuffers(1, &texCoordBuffer);
    glEnableVertexAttribArray(Shader::TEX_COORD);
    glBindBuffer(GL_ARRAY_BUFFER, texCoordBuffer);
    glVertexAttribPointer(
            Shader::TEX_COORD,
            2,                  // size
            GL_FLOAT,           // type
            GL_FALSE,           // normalized?
            0,                  // stride
            (void*)0            // array buffer offset
    );
    glBufferData(
            GL_ARRAY_BUFFER,
            fake.size() * sizeof(glm::vec2),
            &fake[0],
            GL_STATIC_DRAW
            );
    printGlErrors(__FILE__, __LINE__);

    // Generate a buffer for the indices
    glGenBuffers(1, &elementbuffer);
    glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, elementbuffer);
    glBufferData(
            GL_ELEMENT_ARRAY_BUFFER,
            this->faces.size() * sizeof(unsigned int) * 3,
            &this->faces[0],
            GL_STATIC_DRAW
            );
    printGlErrors(__FILE__, __LINE__);
}

TriangleMesh::~TriangleMesh() {
    GLuint buffers[] = {vertexbuffer, colorbuffer, elementbuffer};
    GLuint vaos[]    = {vertexArrayID};
    glDeleteBuffers(3, buffers);
    glDeleteVertexArrays(1, vaos);
}

const string &TriangleMesh::getPlyPath() const {
    return plyPath;
}

void TriangleMesh::setPlyPath(const string &plyPath) {
    TriangleMesh::plyPath = plyPath;
}
