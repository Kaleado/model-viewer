//
// Created by kaleado on 5/01/19.
//

#include "Util.hpp"

void printGlErrors(std::string file, int line) {
    auto error = glGetError();
    if(error) {
        std::cerr << file << ":" << line << ": error " << error << " " << gluErrorString(error) << std::endl;
        throw std::exception();
    }
}
