#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;


out vec3 fL;
out vec3 fV;
out vec4 frontColor;
out vec3 my_normal;

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;
uniform mat4 modelViewMatrix;
uniform vec4 lightPosition; // similar a gl_LightSource[0].position
                            // (sempre estarà en eye space)




void main()
{

    //N: vector normal unitario
    //L: Vector unitario desde vertex hasta la fuente de luz
    //V: Vector unitario desde vertex a la cámara
    //H: V + L normalizado
    vec3 N = normalize(normalMatrix * normal);
    vec3 L = normalize((lightPosition - modelViewMatrix *vec4(vertex,1.0)).xyz);
    vec3 V = normalize(-(modelViewMatrix * vec4(vertex,1.0)).xyz);
    vec3 H = normalize(V + L);
    vec3 R = 2*dot(N,L)*N - L;

    my_normal = N;
    fL = L;
    fV = V;
    gl_Position = modelViewProjectionMatrix * vec4(vertex, 1.0);
}
