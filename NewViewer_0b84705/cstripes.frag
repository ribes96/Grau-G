#version 330 core

in vec4 frontColor;
in vec2 vtexCoord;
out vec4 fragColor;

uniform int nstripes = 5;
uniform vec2 origin;

void main()
{

    vec4 yellow = vec4(1.0,1.0,0.0,0.0);
    vec4 red = vec4(1.0,0.0,0.0,0.0);

    float tam_stripe = 1.0/nstripes;
    float l = length(vtexCoord - origin);
    int stp = int(l/tam_stripe);

    if (stp % 2 == 0)
        fragColor = red;
    else
        fragColor = yellow;
}
