//
// Created by kaleado on 5/01/19.
//

#include "Texture.hpp"
#include "Util.hpp"

void Texture::setFilename(const std::string &filename) {
    Texture::filename = filename;
}

void Texture::bind(GLenum textureUnit) {
    glActiveTexture(textureUnit); printGlErrors(__FILE__, __LINE__);
    glBindTexture(GL_TEXTURE_2D, textureID); printGlErrors(__FILE__, __LINE__);
    GLint uniformID = glGetUniformLocation(Shader::getProgramID(), "textureSampler"); printGlErrors(__FILE__, __LINE__);
    if(uniformID == -1) throw std::invalid_argument("Texture::bind(): attempted to access an invalid uniform.");
    glUniform1i(uniformID, 0); printGlErrors(__FILE__, __LINE__);
}

void Texture::load() {
    try {
        Magick::Blob blob;
        auto *img = new Magick::Image(filename);
        std::cout << img->isValid()  << " " << img->rows() << " by " << img->columns() << "\n";
        img->write(&blob, "RGBA");
        std::cout << blob.length() << "\n";
        glGenTextures(1, &textureID);
        glBindTexture(GL_TEXTURE_2D, textureID);
        printGlErrors(__FILE__, __LINE__);
        glTexImage2D(
                GL_TEXTURE_2D,
                0,
                GL_RGBA,
                512,
                512,
                0,
                GL_RGBA,
                GL_UNSIGNED_BYTE,
                blob.data()
                );
        printGlErrors(__FILE__, __LINE__);
        glTexParameterf(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
        glTexParameterf(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
        printGlErrors(__FILE__, __LINE__);
    }
    catch (Magick::Error& error){
        std::cout << "Error loading texture '" << filename << "': " << error.what() << std::endl;
    }
}
