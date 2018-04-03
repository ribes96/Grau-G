#version 330 core

in vec4 frontColor;
in vec4 objCoords;
in vec3 eyeCoords;
in vec3 Nu;
out vec4 fragColor;

uniform sampler2D noise;

vec4 shading(vec3 N, vec3 Pos, vec4 diffuse) {
    vec3 lightPos = vec3(0.0,0.0,2.0);
    vec3 L = normalize( lightPos - Pos );
    vec3 V = normalize( -Pos);
    vec3 R = reflect(-L,N);
    float NdotL = max( 0.0, dot( N,L ) );
    float RdotV = max( 0.0, dot( R,V ) );
    float Ispec = pow( RdotV, 20.0 );
    return diffuse * NdotL + Ispec;
}


void main()
{

    //Definitions
    vec4 white = vec4(1.0,1.0,1.0,1.0);
    vec4 redish = vec4(0.5,0.2,0.2,1.0);

    vec4 s_plane = 0.3*vec4(0,1,-1,0);
    vec4 t_plane = 0.3*vec4(-2,-1,1,0);



    //Procedure

    float s = dot(objCoords,s_plane);
    float t = dot(objCoords, t_plane);
    float v = texture(noise, vec2(s,t)).r;
    vec4 difCol;
    if (v < 0.5)
        difCol = mix(white, redish, 2*v);
    else
        difCol = mix(redish, white, 2*(v - 0.5));
    fragColor = shading(normalize(Nu), eyeCoords, difCol);
}
