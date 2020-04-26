#include <iostream>
#include <GL/glew.h>

#include "display.h"
#include "shader.h"
#include "mesh.h"

using std::cin;
using std::cout;
using std::endl;

int main()
{
    Display d(800, 600, "Hello world!");
    
    Vertex vertices[] = {Vertex(glm::vec3(-0.5, -0.5, 0)),
        Vertex(glm::vec3(0, 0.5, 0)),
        Vertex(glm::vec3(0.5, -0.5, 0)),
    };
    
    Mesh mesh(vertices, sizeof(vertices)/sizeof(vertices[0]));
    Shader shader("res/basicShader");
    
    while(!d.IsClosed())
    {
        d.Clear(0.0f, 0.15f, 0.3f, 1.0f);
        shader.Bind();
        mesh.Draw();
        d.Update();
    }
    return 0;
}
