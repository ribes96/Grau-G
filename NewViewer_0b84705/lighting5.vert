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
//                             // (sempre estarà en eye space)
//
uniform bool world = true;
//
//
uniform mat4 modelMatrix;
uniform mat4 viewMatrixInverse;
//
uniform mat4 modelViewMatrixInverse;




void main()
{

    //N: vector normal unitario
    //L: Vector unitario desde vertex hasta la fuente de luz
    //V: Vector unitario desde vertex a la cámara
    //H: V + L normalizado
    vec3 N;
    vec3 L;
    vec3 V;

    if (world) {
        //Hacer cálculos en world space
        mat3 normalModelMatrix = inverse(transpose(mat3(modelMatrix)));
        N = normalize(normal);
        L = normalize((viewMatrixInverse * lightPosition - vec4(vertex,1.0)).xyz);
        V = normalize((modelViewMatrixInverse * vec4(vec3(0.0), 1.0) - vec4(vertex, 1.0)).xyz);
        // La cámara está en el (0,0,0), pero el último es un 1

    }
    else {
        //Hacer los cálculos en eye space
        N = normalize(normalMatrix * normal);
        L = normalize((lightPosition - modelViewMatrix * vec4(vertex,1.0)).xyz);
        V = normalize(-(modelViewMatrix * vec4(vertex,1.0)).xyz);
    }

    my_normal = N;
    fL = L;
    fV = V;
    gl_Position = modelViewProjectionMatrix * vec4(vertex, 1.0);
}
