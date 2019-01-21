//
// Created by kaleado on 5/01/19.
//

#ifndef TUTORIALS_TEXTURE_HPP
#define TUTORIALS_TEXTURE_HPP

#include <string>
#include <Magick++.h>
#include <GL/glew.h>
#include <iostream>
#include "Shader.hpp"

class Texture {
private:
    std::string filename;
    GLuint textureID;

public:

    void setFilename(const std::string &filename);

    void bind(GLenum textureUnit);

    void load();

    Texture() = default;

};


#endif //TUTORIALS_TEXTURE_HPP
