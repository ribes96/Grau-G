#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;
out vec2 vtexCoord;

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;

uniform float time;
uniform float speed = 0.5;

void main()
{
    vec3 N = normalize(normalMatrix * normal);
    float phi = time * speed;
    mat3 rotMat = mat3(
        vec3(cos(phi),0,-1 * sin(phi)),
        vec3(0,1,0),
        vec3(sin(phi),0,cos(phi))
        );
    vec3 nV = rotMat * vertex;
    // frontColor = vec4(0,0,1,0);  // Blue
    frontColor = vec4(color,1.0);
    vtexCoord = texCoord;
    gl_Position = modelViewProjectionMatrix * vec4(nV, 1.0);
}


// #version 330 core
// layout (location = 0) in vec3 vertex;
// layout (location = 1) in vec3 normal;
// layout (location = 2) in vec3 color;
// layout (location = 3) in vec2 texCoord;
// out vec4 frontColor;
// out vec2 vtexCoord;
// uniform mat4 modelViewProjectionMatrix;
// uniform mat3 normalMatrix;
// void main() {
//         vec3 N = normalize(normalMatrix * normal);
//         gl_Position = modelViewProjectionMatrix * vec4(vertex.xyz, 1.0);
//         frontColor = vec4(color,1.0) * N.z;
//         vtexCoord = texCoord;
// }
