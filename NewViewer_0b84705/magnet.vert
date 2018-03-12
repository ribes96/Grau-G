#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;


uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;
uniform mat4 viewMatrixInverse;
uniform vec4 lightPosition; // similar a gl_LightSource[0].position
//                             // (sempre estarà en eye space)
uniform float n;

void main()
{
    // float n = 4;
    //F: light position (in world space)

    vec3 nV;
    float w;
    vec4 F = viewMatrixInverse * lightPosition;
    float d = distance(vertex,vec3(F));

    w = clamp(1.0/pow(d,n), 0.0, 1.0);
    nV = (1.0 - w) * vertex + vec3(w*F);
    frontColor = vec4(normalize(normalMatrix * normal).z);
    gl_Position = modelViewProjectionMatrix * vec4(nV, 1.0);
}
