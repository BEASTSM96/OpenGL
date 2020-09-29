workspace "OpenGL-Playground"
	architecture "x64"

	configurations
	{
		"Debug"
	}
	
	flags
	{
		"MultiProcessorCompile"
	}

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"


include "ext/vendor/GLFW"
include "ext/vendor/Glad"

project "OpenGL"
	location "OpenGL"
	kind "ConsoleApp"
	language "C++"
	cppdialect "C++17"
	staticruntime "on"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp"
	}

	defines
	{
		"_CRT_SECURE_NO_WARNINGS"
	}

	includedirs
	{
		"%{prj.name}/src",
		"ext/vendor/GLFW/include",
		"ext/vendor/Glad/include"
		--"ext/vendor/assimp/include"

	}

	links 
	{ 
		"GLFW",
		"Glad"
	}

	filter "system:windows"
		systemversion "latest"

		defines
		{
			"_PLATFORM_WINDOWS",
			"GLFW_INCLUDE_NONE"
		}

	filter "configurations:Debug"
		defines "_DEBUG"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		defines "_RELEASE"
		runtime "Release"
		optimize "on"

	filter "configurations:Dist"
		defines "_DIST"
		runtime "Release"
		optimize "on"
---------------------------------------------------------------------------------------------------------------------------

project "ALLBUILD"
	location "ext/allbuild"
	kind "None"


	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	defines
	{
		"_CRT_SECURE_NO_WARNINGS",
	}

	links 
	{ 
		"OpenGL",
		"Glad",
		"GLFW"
	}