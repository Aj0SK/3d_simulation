#include <iostream>
#include <GL/glew.h>

#include "display.h"
#include "shader.h"

using std::cin;
using std::cout;
using std::endl;

int main()
{
    Display d(500, 700, "Test Window");
    Shader shader("res/basicShader");
    
    while(!d.IsClosed())
    {
        d.Clear(0.0f, 0.15f, 0.3f, 1.0f);
        shader.Bind();
        d.Update();
    }
    return 0;
}
