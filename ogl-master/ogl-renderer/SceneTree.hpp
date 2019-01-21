//
// Created by kaleado on 8/01/19.
//

#ifndef TUTORIALS_SCENETREE_HPP
#define TUTORIALS_SCENETREE_HPP

#include "Shader.hpp"
#include "Texture.hpp"
#include "Thing.hpp"

class SceneTree {
private:
    ThingPtr camera;
    ThingPtr root;

public:

    const ThingPtr &getCamera() const;

    void setCamera(const ThingPtr &camera);

    const ThingPtr &getRoot() const;

    void draw();

    SceneTree();

};


#endif //TUTORIALS_SCENETREE_HPP
