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

uniform bool world;


uniform mat4 modelMatrix;
// uniform mat4 viewMatrix;
// uniform mat4 projectionMatrix;
// uniform mat4 modelViewMatrix;
// uniform mat4 modelViewProjectionMatrix;
//
// uniform mat4 modelMatrixInverse;
uniform mat4 viewMatrixInverse;
// uniform mat4 projectionMatrixInverse;
// uniform mat4 modelViewMatrixInverse;
// uniform mat4 modelViewProjectionMatrixInverse;
//
// uniform mat3 normalMatrix;
//
// uniform vec4 lightAmbient; // similar a gl_LightSource[0].ambient
// uniform vec4 lightDiffuse; // similar a gl_LightSource[0].diffuse
// uniform vec4 lightSpecular; // similar a gl_LightSource[0].specular
// uniform vec4 lightPosition; // similar a gl_LightSource[0].position
//                             // (sempre estarà en eye space)
//
// uniform vec4 matAmbient; // similar a gl_FrontMaterial.ambient
// uniform vec4 matDiffuse; // similar a gl_FrontMaterial.diffuse
// uniform vec4 matSpecular; // similar a gl_FrontMaterial.specular
// uniform float matShininess; // similar a gl_FrontMaterial.shininess
//
// uniform vec3 boundingBoxMin; // cantonada mínima de la capsa englobant
// uniform vec3 boundingBoxMax; // cantonada màxima de la capsa englobant
//
// uniform vec2 mousePosition; // coordenades del cursor (window space)
//                             // origen a la cantonada inferior esquerra



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
        N = normalize(normalModelMatrix * normal);
        L = normalize((viewMatrixInverse * lightPosition - modelMatrix *vec4(vertex,1.0)).xyz);
        V = normalize(-(modelMatrix * vec4(vertex,1.0)).xyz);

    }
    else {
        //Hacer los cálculos en eye space
        // vec3 N = normalize(normalMatrix * normal);
        N = normalize(normalMatrix * normal);
        // N = normalize(inverse(transpose(modelViewMatrix)) * normal);
        L = normalize((lightPosition - modelViewMatrix *vec4(vertex,1.0)).xyz);
        V = normalize(-(modelViewMatrix * vec4(vertex,1.0)).xyz);
    }

    my_normal = N;
    fL = L;
    fV = V;
    gl_Position = modelViewProjectionMatrix * vec4(vertex, 1.0);
}
