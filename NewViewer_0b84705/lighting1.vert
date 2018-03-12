#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
// layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;
out vec2 vtexCoord;

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;


// uniform mat4 modelMatrix;
// uniform mat4 viewMatrix;
// uniform mat4 projectionMatrix;
uniform mat4 modelViewMatrix;
// uniform mat4 modelViewProjectionMatrix;
//
// uniform mat4 modelMatrixInverse;
// uniform mat4 viewMatrixInverse;
// uniform mat4 projectionMatrixInverse;
// uniform mat4 modelViewMatrixInverse;
// uniform mat4 modelViewProjectionMatrixInverse;
//
// uniform mat3 normalMatrix;
//
uniform vec4 lightAmbient; // similar a gl_LightSource[0].ambient
uniform vec4 lightDiffuse; // similar a gl_LightSource[0].diffuse
uniform vec4 lightSpecular; // similar a gl_LightSource[0].specular
uniform vec4 lightPosition; // similar a gl_LightSource[0].position
//                             // (sempre estarà en eye space)
//
uniform vec4 matAmbient; // similar a gl_FrontMaterial.ambient
uniform vec4 matDiffuse; // similar a gl_FrontMaterial.diffuse
uniform vec4 matSpecular; // similar a gl_FrontMaterial.specular
uniform float matShininess; // similar a gl_FrontMaterial.shininess
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
    vec3 N = normalize(normalMatrix * normal);
    vec3 L = normalize((lightPosition - modelViewMatrix *vec4(vertex,1.0)).xyz);
    // vec3 V = normalize(-(modelViewMatrix * vec4(vertex,1.0)).xyz);
    vec3 V = vec3(0,0,1);
    vec3 H = normalize(V + L);

    float ldiff = max(0.0,dot(N,L));
    float lspec = 0;
    if (ldiff > 0) lspec = pow(max(0.0,dot(N,H)),matShininess);

    vec4 ambient = matAmbient * lightAmbient;
    vec4 diffuse = matDiffuse * lightDiffuse * ldiff;
    vec4 specular=matSpecular*lightSpecular * lspec;
    // frontColor = vec4(1,0,1,1.0);
    frontColor = ambient + diffuse + specular;
    vtexCoord = texCoord;
    gl_Position = modelViewProjectionMatrix * vec4(vertex, 1.0);
}
