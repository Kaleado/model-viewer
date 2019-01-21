//
// Created by kaleado on 8/01/19.
//

#include <glm/gtc/matrix_transform.hpp>
#include <glm/gtc/quaternion.hpp>
#include <glm/gtx/matrix_decompose.hpp>
#include <algorithm>

#include "Thing.hpp"

void Thing::addChild(ThingPtr t) {
    children.push_back(t);
}

void Thing::removeChild(ThingPtr t) {
    auto itr = std::find(children.begin(), children.end(), t);
    if(itr == children.end()){
        throw std::invalid_argument("Thing::removeChild(): candidate for removal does not exist.");
    }
    children.erase(itr);
}

void Thing::setParent(ThingPtr t) {
    glm::vec3 scale;
    glm::quat rotation;
    glm::vec3 translation;
    glm::vec3 skew;
    glm::vec4 persp;
    glm::decompose(t->getTransform(), scale, rotation, translation, skew, persp);
    transform = glm::scale(glm::rotate(glm::translate(transform, -translation),
                -glm::angle(rotation), glm::axis(rotation)), glm::vec3(1/scale.x, 1/scale.y, 1/scale.z));
    parent = t;
}

const glm::mat4 &Thing::getTransform() const {
    return transform;
}

void Thing::draw(glm::mat4 p) {
    for(const auto &c : children){
        c->draw(transform);
    }
}

const std::string &Thing::getId() const {
    return id;
}

void Thing::setId(const std::string &id) {
    Thing::id = id;
}

void Thing::setTransform(const glm::mat4 &transform) {
    Thing::transform = transform;
}

