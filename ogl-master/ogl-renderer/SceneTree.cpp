//
// Created by kaleado on 8/01/19.
//

#include "SceneTree.hpp"

void SceneTree::draw() {
    auto viewMatrix = camera->getTransform();
    Shader::setViewMatrix(glm::inverse(viewMatrix));
    //Draw the root object with the identity matrix as its frame.
    root->draw(glm::mat4(1));
}

const ThingPtr &SceneTree::getRoot() const {
    return root;
}

SceneTree::SceneTree() {
    root = std::make_shared<Thing>();
}

const ThingPtr &SceneTree::getCamera() const {
    return camera;
}

void SceneTree::setCamera(const ThingPtr &camera) {
    SceneTree::camera = camera;
}
