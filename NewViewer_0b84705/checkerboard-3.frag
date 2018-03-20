#version 330 core

in vec4 frontColor;
in vec2 vtexCoord;
out vec4 fragColor;

uniform float n = 8;

void main()
{

    //Me han dicho, aparte, que la linea ocupa un 10% del total de la celda
    float percent = 10;

    float c = mod(vtexCoord.s, 1.0 / n);
    float r = mod(vtexCoord.t, 1.0 / n);
    if (c < 1/(percent*n) || r < 1/(percent*n)) fragColor = vec4(0.0);
    else fragColor = vec4(0.8);
}
