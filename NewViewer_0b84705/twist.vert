#version 330 core

layout (location = 0) in vec3 vertex;
// layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
// layout (location = 3) in vec2 texCoord;

out vec4 frontColor;

uniform mat4 modelViewProjectionMatrix;
uniform float time;

void main()
{
    // vec3 N = normalize(normalMatrix * normal);
    float phi = 0.4 * vertex.y * sin(time);
    phi *= -1;
    mat3 rotMat = mat3(
        cos(phi), 0.0,  -sin(phi),
        0.0     , 1.0,  0.0,
        sin(phi), 0.0,  cos(phi)
        );
    vec3 nV = rotMat * vertex;
    frontColor = vec4(color,1.0);
    gl_Position = modelViewProjectionMatrix * vec4(nV, 1.0);
}
