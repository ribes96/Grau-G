#version 330 core

in vec4 frontColor;
in vec2 vtexCoord;
out vec4 fragColor;

void main()
{
    vec4 white = vec4(1.0,1.0,1.0,0.0);
    vec4 red = vec4(1.0,0.0,0.0,0.0);
    vec2 origin = vec2(0.5,0.5);
    float rad = 0.2;
    float l = length(vtexCoord - origin);
    if (l <= rad)
        fragColor = red;
    else
        fragColor = white;
}
