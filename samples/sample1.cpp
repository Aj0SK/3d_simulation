#include <iostream>
#include <GL/glew.h>

#include "display.h"
#include "shader.h"
#include "mesh.h"
#include "texture.h"
#include "transform.h"

using std::cin;
using std::cout;
using std::endl;

int main(int argc, char** argv)
{
    Display d(800, 600, "Hello world!");
    
    Vertex vertices[] = {Vertex(glm::vec3(-0.5, -0.5, 0), glm::vec2(0.0, 0.0)),
        Vertex(glm::vec3(0, 0.5, 0), glm::vec2(0.5, 1.0)),
        Vertex(glm::vec3(0.5, -0.5, 0), glm::vec2(1.0, 0.0)),
    };
    
    Mesh mesh(vertices, sizeof(vertices)/sizeof(vertices[0]));
    Shader shader("res/basicShader");
    Texture texture("res/bricks.jpg");
    Transform transform;
    
    float counter = 0.0f;
    
    while(!d.IsClosed())
    {
        d.Clear(0.0f, 0.15f, 0.3f, 1.0f);
        
        transform.GetPos().x = sinf(counter);
        transform.GetRot().z = cosf(counter);
        transform.SetScale(glm::vec3(cosf(counter), cosf(counter), cosf(counter)));
        
        shader.Bind();
        texture.Bind(0);
        shader.Update(transform);
        mesh.Draw();
        
        d.Update();
        counter += 0.01f;
    }
    return 0;
}
