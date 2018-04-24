#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
// layout (location = 3) in vec2 texCoord;

out vec4 frontColor;
out vec3 my_normal;
out vec4 vpos;

uniform mat4 modelViewProjectionMatrix;
uniform mat4 modelViewMatrix;
uniform mat3 normalMatrix;

void main()
{
    vec3 N = normalize(normalMatrix * normal);
    my_normal = N;
    frontColor = vec4(color,1.0);
    gl_Position = modelViewProjectionMatrix * vec4(vertex, 1.0);
    vpos = modelViewMatrix * vec4(vertex, 1.0);
}
