#version 330 core

in vec4 frontColor;
in vec2 vtexCoord;
out vec4 fragColor;

uniform float n = 8;

void main()
{
    //Ojo, que el int y el floor no hacen lo mismo con negativos
    int column = int(mod(floor(vtexCoord.s * n),n));
    int row =  7 - int(mod(floor(vtexCoord.t * n),n));
    if ((column + row) % 2 == 0)
        fragColor = vec4(0.0);
    else
        fragColor = vec4(0.8);
}
