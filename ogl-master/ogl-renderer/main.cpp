// Include standard headers
#include <stdio.h>
#include <stdlib.h>

// Include GLEW
#include <GL/glew.h>

// Include GLFW
#include <GLFW/glfw3.h>
GLFWwindow* window;

// Include GLM
#include <glm/glm.hpp>
#include <glm/gtc/matrix_transform.hpp>

#include "Util.hpp"

using namespace glm;

// My files
#include "TriangleMesh.hpp"
#include "Texture.hpp"
#include "SceneTree.hpp"

//REMOVE THIS
SceneTree scene;

void key_callback(GLFWwindow* window, int key, int scancode, int action, int mods)
{
    auto mat = scene.getCamera()->getTransform();
    if (key == GLFW_KEY_A && (action == GLFW_REPEAT || action == GLFW_PRESS)){
        mat = glm::translate(mat, glm::vec3(-0.01, 0, 0));
        scene.getCamera()->setTransform(mat);
    }
    if (key == GLFW_KEY_D && (action == GLFW_REPEAT || action == GLFW_PRESS)){
        mat = glm::translate(mat, glm::vec3(0.01, 0, 0));
        scene.getCamera()->setTransform(mat);
    }
    if (key == GLFW_KEY_S && (action == GLFW_REPEAT || action == GLFW_PRESS)){
        mat = glm::translate(mat, glm::vec3(0, 0, 0.01));
        scene.getCamera()->setTransform(mat);
    }
    if (key == GLFW_KEY_W && (action == GLFW_REPEAT || action == GLFW_PRESS)){
        mat = glm::translate(mat, glm::vec3(0, 0, -0.01));
        scene.getCamera()->setTransform(mat);
    }
}

//REMOVE THIS

int main() {
    printGlErrors(__FILE__, __LINE__);
    Magick::InitializeMagick(nullptr);
	// Initialise GLFW
	if(!glfwInit()) {
		fprintf( stderr, "Failed to initialize GLFW\n" );
		getchar();
		return -1;
	}

	glfwWindowHint(GLFW_SAMPLES, 4);
	glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 3);
	glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 3);
	glfwWindowHint(GLFW_OPENGL_FORWARD_COMPAT, GL_TRUE); // To make MacOS happy; should not be needed
	glfwWindowHint(GLFW_OPENGL_PROFILE, GLFW_OPENGL_CORE_PROFILE);
    printGlErrors(__FILE__, __LINE__);

	// Open a window and create its OpenGL context
	window = glfwCreateWindow( 1024, 768, "Tutorial 01", nullptr, nullptr);
	if(window == nullptr){
		fprintf( stderr, "Failed to open GLFW window. If you have an Intel GPU, they are not 3.3 compatible. Try the 2.1 version of the tutorials.\n" );
		getchar();
		glfwTerminate();
		return -1;
	}
	glfwMakeContextCurrent(window);
    printGlErrors(__FILE__, __LINE__);

    glewExperimental = static_cast<GLboolean>(true); // Needed for core profile
    // Initialize GLEW
	if (glewInit() != GLEW_OK) {
		fprintf(stderr, "Failed to initialize GLEW\n");
		getchar();
		glfwTerminate();
		return -1;
	}
	glGetError();
	printGlErrors(__FILE__, __LINE__);

	// Ensure we can capture the escape key being pressed below
	glfwSetInputMode(window, GLFW_STICKY_KEYS, GL_TRUE);

	// Dark blue background
	glClearColor(0.0f, 0.0f, 0.4f, 0.0f);
	printGlErrors(__FILE__, __LINE__);

    // Enable depth test
    glEnable(GL_DEPTH_TEST);
	printGlErrors(__FILE__, __LINE__);

	// Accept fragment if it closer to the camera than the former one
    glDepthFunc(GL_LESS);

    printGlErrors(__FILE__, __LINE__);

    //Load and compile our shaders, creating the shader program necessary for rendering.
    Shader::setFragmentShaderPath("ColorFragmentShader.fragmentshader");
    Shader::setVertexShaderPath("TransformVertexShader.vertexshader");
    Shader::compile();
    Shader::use();

    std::shared_ptr<TriangleMesh> m = std::make_shared<TriangleMesh>();
    m->setPlyPath("resources/apple.ply");
    m->load();

    Texture t;
    t.setFilename("resources/appleSkin.png");
    t.load();
    t.bind(GL_TEXTURE0);

    ThingPtr cam = std::make_shared<Thing>();
    cam->setTransform(glm::inverse(glm::lookAt(
            glm::vec3(0.4,0.4,-0.4), // Camera is at this point in World Space
            glm::vec3(0,0,0), // and looks at the origin
            glm::vec3(0,1,0)  // Head is up (set to 0,-1,0 to look upside-down)
    )));

    //SceneTree scene;
    scene.getRoot()->addChild(m);
    scene.getRoot()->addChild(cam);
    scene.setCamera(cam);

    //REMOVE THIS
    glfwSetKeyCallback(window, key_callback);

    do{
		// Clear the screen. It's not mentioned before Tutorial 02, but it can cause flickering, so it's there nonetheless.
        glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);

        t.bind(GL_TEXTURE0);

		//m.draw(glm::mat4(1.0f));
		scene.draw();

		// Swap buffers
		glfwSwapBuffers(window);
		glfwPollEvents();

	} // Check if the ESC key was pressed or the window was closed
	while( glfwGetKey(window, GLFW_KEY_ESCAPE ) != GLFW_PRESS &&
		   glfwWindowShouldClose(window) == 0 );

	// Close OpenGL window and terminate GLFW
	glfwTerminate();

	return 0;
}

