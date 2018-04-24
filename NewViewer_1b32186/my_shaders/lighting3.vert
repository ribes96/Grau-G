#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
// layout (location = 2) in vec3 color;
// layout (location = 3) in vec2 texCoord;


uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;
uniform mat4 modelViewMatrix;
uniform vec4 lightPosition; // similar a gl_LightSource[0].position
                            // (sempre estarà en eye space)

out vec3 fN;
out vec3 fL;
out vec3 fH;
out vec4 frontColor;

void main()
{
    //N: vector normal unitario
    //L: Vector unitario desde vertex hasta la fuente de luz
    //V: Vector unitario desde vertex a la cámara
    //H: V + L normalizado
    vec3 N = normalize(normalMatrix * normal);
    vec3 L = normalize((lightPosition - modelViewMatrix *vec4(vertex,1.0)).xyz);
    vec3 V = vec3(0,0,1);
    vec3 H = normalize(V + L);

    fL = L;
    fN = N;
    fH = H;

    gl_Position = modelViewProjectionMatrix * vec4(vertex, 1.0);
}
