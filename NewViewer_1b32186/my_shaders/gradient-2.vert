#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;
out vec2 vtexCoord;

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;
uniform vec3 boundingBoxMin; // cantonada mínima de la capsa englobant
uniform vec3 boundingBoxMax; // cantonada màxima de la capsa englobant


void main()
{

    vec4 nV = modelViewProjectionMatrix * vec4(vertex, 1.0);
    vec3 cols[6] = vec3[6](
        vec3(1,0,0),    // red
        vec3(1,1,0),    // yellow
        vec3(0,1,0),    // green
        vec3(0,1,1),    // cian
        vec3(0,0,1),     // blue
        vec3(0,0,1)     // blue
                        // repito el último para que no falle el i + 1
    );

    // float inc = 4*(vertex.y - boundingBoxMin.y) / (boundingBoxMax.y - boundingBoxMin.y);
    float pos = ((nV.y / nV.w) + 1) / 2;    // La división lo deja entre -1 y 1
                                            // Lo queremos entre 0 y 1
    float inc = 4*pos;
    int i = int(inc);
    float fr = fract(inc);
    vec3 c = mix(cols[i],cols[i + 1],fr);
    frontColor = vec4(c,1.0);
    // gl_Position = modelViewProjectionMatrix * vec4(vertex, 1.0);
    gl_Position = nV;
}
