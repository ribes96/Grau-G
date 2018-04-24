#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;
out vec2 vtexCoord;

uniform mat4 modelViewProjectionMatrix;
uniform float time;

void main()
{
    float phi = -time * texCoord.s;
    mat3 rotMat = mat3(
        vec3(cos(phi),0,-1 * sin(phi)),
        vec3(0,1,0),
        vec3(sin(phi),0,cos(phi))
        );
    vec3 nV = rotMat * vertex;
    frontColor = vec4(0,0,1,0);  // Blue
    vtexCoord = texCoord;
    gl_Position = modelViewProjectionMatrix * vec4(nV, 1.0);
}
