#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
// layout (location = 3) in vec2 texCoord;

// out vec4 frontColor;
// out vec2 vtexCoord;
out vec3 ndc;


uniform mat4 modelViewProjectionMatrix;
uniform float time;

void main()
{
    // frontColor = vec4(color,1.0);
    gl_Position = modelViewProjectionMatrix * vec4(vertex, 1.0);
    ndc = ((gl_Position.xyz / gl_Position.w) + vec3(1.0))/2;
    //Si solo se hace la división, todo queda entre -1 y 1
}
