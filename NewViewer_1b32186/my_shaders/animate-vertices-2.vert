#version 330 core

// #define M_PI 3.1415926535897932384626433832795
#define M_PI 3.14159

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;
out vec2 vtexCoord;

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;

uniform float amplitude=0.1;
uniform float freq = 1;  // expressada en Hz
uniform float time;


void main()
{
    vec3 N = normalize(normalMatrix * normal);
    vec3 n_pos = vertex + amplitude*sin(2*M_PI*freq*time + 2*M_PI*texCoord.x) * normal;
    // frontColor = vec4(color,1.0) * N.z;
    frontColor = vec4(normalize(normalMatrix * normal).z);
    vtexCoord = texCoord;
    // gl_Position = modelViewProjectionMatrix * vec4(vertex, 1.0);
    gl_Position = modelViewProjectionMatrix * vec4(n_pos, 1.0);
}
