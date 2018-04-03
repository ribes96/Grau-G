#version 330 core

in vec2 vtexCoord;
out vec4 fragColor;

uniform int textureSize = 1024;
uniform int edgeSize = 2;
uniform float threshold = 0.1;


uniform sampler2D tex;

void main()
{
    vec2 left = vtexCoord + edgeSize * vec2(-1, 0) / textureSize;
    vec2 right = vtexCoord + edgeSize * vec2(1, 0) / textureSize;
    vec2 bottom = vtexCoord + edgeSize * vec2(0, -1) / textureSize;
    vec2 top = vtexCoord + edgeSize * vec2(0, 1) / textureSize;

    vec4 leftCol = texture(tex, left);
    vec4 rightCol = texture(tex, right);
    vec4 bottomCol = texture(tex, bottom);
    vec4 topCol = texture(tex, top);

    float GX = length(rightCol - leftCol);
    float GY = length(topCol - bottomCol);

    float change = length(vec2(GX, GY));

    if (change > threshold)
        fragColor = vec4(0.0);
    else
        fragColor = texture(tex,vtexCoord);

}
