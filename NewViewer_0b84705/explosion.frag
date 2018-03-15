#version 330 core

in vec4 frontColor;
out vec4 fragColor;
in vec2 vtexCoord;


uniform sampler2D explosion;
uniform float time;

void main()
{
    // fragColor = frontColor;
    float slice = float(1)/30;
    int tile = int(time * 30) % 48;
    // tile = 30;
    int row = tile / 8;
    int column = tile % 8;
    float a = float(1) / 8;
    float b = float(1) / 6;
    // fragColor = frontColor * texture(explosion, vtexCoord*vec2(a,b) + vec2(0.0 + a*column,(5 - row)*b));
    // fragColor = frontColor * texture(explosion, vec2(a,b) * (vtexCoord + vec2(column,5 - row)));
    fragColor = texture(explosion, vec2(a,b) * (vtexCoord + vec2(column,5 - row)));
    fragColor *= fragColor.a;

    // fragColor = frontColor * texture(explosion, vtexCoord*vec2(1/8,1/6) + vec2(row,column)*vec2(1/8,1/6));
}
