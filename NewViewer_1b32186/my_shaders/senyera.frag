#version 330 core

in vec4 frontColor;
in vec2 vtexCoord;
out vec4 fragColor;

void main()
{

    vec4 yellow = vec4(1.0,1.0,0.0,0.0);
    vec4 red = vec4(1.0,0.0,0.0,0.0);

    float a = 1.0 / 9;
    //Ojo, que el int y el floor no hacen lo mismo con negativos
    float b = mod(vtexCoord.s,1);
    int block = int(b / a);
    if (block % 2 == 0)
        fragColor = yellow;
    else
        fragColor = red;
}
