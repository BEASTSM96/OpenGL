#pragma once


class Window 
{
public:
	Window();
	~Window();

	void Create();
	void LoadProc();

	GLFWwindow* GetWindow() { return win; };

	void Input(GLFWwindow* window);

private:
	GLFWwindow* win;

	void Init();

	const unsigned int WIDTH = 800;
	const unsigned int HEIGHT = 600;
};


