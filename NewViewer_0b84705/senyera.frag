#version 330 core

in vec4 frontColor;
in vec2 vtexCoord;
out vec4 fragColor;

void main()
{
    vec2 st = vtexCoord;
    // st = vtexCoord-vec2(0.5);
    float a = 1.0 / 9;
    //Ojo, que el int y el floor no hacen lo mismo con negativos
    float b = mod(vtexCoord.s,1);
    // float d = int(b / 9)
    int column = int(floor(vtexCoord.s * 9)) % 9;
    if (column % 2 == 0)
    // int row =  7 - int(floor(vtexCoord.t * 8)) % 8;
    // if (column % 2 == 0)
        fragColor = vec4(1.0,1.0,0.0,0.0); //Yellow
    else
        fragColor = vec4(1.0,0.0,0.0,0.0); //Red
}
