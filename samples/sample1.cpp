#include <iostream>
#include <GL/glew.h>

#include "display.h"

using std::cin;
using std::cout;
using std::endl;

int main()
{
    Display d(500, 700, "Test Window");
    while(!d.IsClosed())
    {
        d.Clear(0.0f, 0.15f, 0.3f, 1.0f);
        d.Update();
    }
    return 0;
}
