#version 330 core

#define M_PI 3.1415926535897932384626433832795

// in vec4 frontColor;
in vec2 vtexCoord;
out vec4 fragColor;

uniform sampler2D map;
uniform float time;
uniform float a = 0.5;


void main()
{
    vec4 c = texture(map, vtexCoord);
    float m = max(max(c.r, c.g),c.b);
    vec2 u = vec2(m,m);
    float phi = 2 *M_PI * time;
    mat2 rotMat = mat2(
         cos(phi), sin(phi),
        -sin(phi), cos(phi)
        );
    vec2 offset = (a/100.0) * u;
    fragColor = texture(map, vtexCoord + offset);
}
