#version 330 core

in vec4 frontColor;
in vec2 vtexCoord;
out vec4 fragColor;

// uniform sampler2D colorMap;
uniform sampler2D sampler0;
uniform sampler2D sampler1;
uniform sampler2D sampler2;
uniform sampler2D sampler3;


uniform float slice = 0.1;
uniform float time;

void main()
{
    // float slice = 0.1;
    // float timer = 0.75;
    int frame = int(time / slice) % 4;

    // fragColor = frontColor;
    // fragColor = frontColor;// * texture(colorMap, vtexCoord);
    // fragColor = vec4(0.0);
    if (frame == 0) {
        fragColor = texture(sampler0, vtexCoord);
    }
    else if (frame == 1) {
        fragColor = texture(sampler1, vtexCoord);
    }
    else if (frame == 2) {
        fragColor = texture(sampler2, vtexCoord);
    }
    else {
        fragColor = texture(sampler3, vtexCoord);
    }

}
