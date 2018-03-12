#version 330 core

in vec4 frontColor;
out vec4 fragColor;

in vec3 my_normal;

void main()
{
    fragColor = frontColor * normalize(my_normal).z;
}
