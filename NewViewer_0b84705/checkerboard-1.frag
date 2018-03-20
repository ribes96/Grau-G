#version 330 core

in vec4 frontColor;
in vec2 vtexCoord;
out vec4 fragColor;

void main()
{
    //Ojo, que el int y el floor no hacen lo mismo con negativos
    int column = int(floor(vtexCoord.s * 8)) % 8;
    int row =  7 - int(floor(vtexCoord.t * 8)) % 8;
    if ((column + row) % 2 == 0)
        fragColor = vec4(0.0);
    else
        fragColor = vec4(0.8);
}
