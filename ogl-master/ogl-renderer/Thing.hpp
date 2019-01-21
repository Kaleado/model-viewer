//
// Created by kaleado on 8/01/19.
//

#ifndef TUTORIALS_THING_HPP
#define TUTORIALS_THING_HPP

#include <vector>
#include <memory>
#include <glm/detail/type_mat.hpp>
#include <glm/detail/type_mat4x4.hpp>

class Thing;

using ThingPtr = std::shared_ptr<Thing>;

class Thing {
private:
    std::string id;
    glm::mat4 transform = glm::mat4(1.0f);
    ThingPtr parent;
    std::vector<ThingPtr> children;

public:
    const glm::mat4 &getTransform() const;

    void setTransform(const glm::mat4 &transform);

    const std::string &getId() const;

    void setId(const std::string &id);

    void addChild(ThingPtr t);

    void removeChild(ThingPtr t);

    void setParent(ThingPtr t);

    virtual void draw(glm::mat4 frame);

};


#endif //TUTORIALS_THING_HPP
