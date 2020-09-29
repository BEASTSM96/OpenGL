#include <glad/glad.h>
#include <GLFW/glfw3.h>
#include "windowtesting.h"

#include <iostream>


Window::Window()
{
    Init();
}

void Window::Init()
{
    glfwInit();
    glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 3);
    glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 3);
    glfwWindowHint(GLFW_OPENGL_PROFILE, GLFW_OPENGL_CORE_PROFILE);
}

void Window::Create()
{
    win = glfwCreateWindow(WIDTH, HEIGHT, "OpenGLWindow", 0, 0);
    if (win == 0)
    {
        std::cout << "Failed to create window" << std::endl;
        glfwTerminate();
    }
    glfwMakeContextCurrent(win);
}

void Window::LoadProc()
{
    if (!gladLoadGLLoader((GLADloadproc)glfwGetProcAddress))
    {
        std::cout << "Failed to initialize GLAD" << std::endl;
    }
}


Window::~Window()
{
    glfwTerminate();
}

void Window::Input(GLFWwindow* window)
{
    if (glfwGetKey(window, GLFW_KEY_ESCAPE) == GLFW_PRESS)
        glfwSetWindowShouldClose(window, true);
}
