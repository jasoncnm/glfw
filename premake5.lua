project "GLFW"
    kind "StaticLib"
    language "C"

    targetdir ("%{wks.location}/bin/" .. outputdir .. "/%{prj.name}")
    objdir ("%{wks.location}/bin-int/" .. outputdir .. "/%{prj.name}")

    files 
    { 
        "include/GLFW/glfw3.h",
        "include/GLFW/glfw3native.h",
        "src/**.c"
    }


    filter "system:windows"
        
        buildoptions { "-std=c11", "-lgdi32" }
        systemversion "latest"
        staticruntime "On"

        defines { "_GLFW_WIN32",  "_CRT_SECURE_NO_WARNING" }

    filter { "system:windows", "configurations:Release" }
        buildoptions "/MT"