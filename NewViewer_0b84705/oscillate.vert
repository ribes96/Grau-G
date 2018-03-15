#version 330 core


#define PI 3.141592

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;
out vec2 vtexCoord;

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;
uniform bool eyespace = false;


uniform vec3 boundingBoxMin; // cantonada mínima de la capsa englobant
uniform vec3 boundingBoxMax; // cantonada màxima de la capsa englobant



uniform float time;

void main()
{
    float d;
    float r = length(boundingBoxMax - boundingBoxMin) / 2;
    float y;
    if (eyespace) {
        y = (modelViewProjectionMatrix * vec4(vertex, 1.0)).y;
    }
    else {
        // y in model space
        y = vertex.y;
    }
    d = (r / 10)*y;
    vec3 N = normalize(normalMatrix * normal);
    vec3 nV = vertex + d * N * sin(2*PI*time);
    frontColor = vec4(color,1.0);
    vtexCoord = texCoord;
    // gl_Position = modelViewProjectionMatrix * vec4(vertex, 1.0);
    gl_Position = modelViewProjectionMatrix * vec4(nV, 1.0);
}
