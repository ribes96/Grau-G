#version 330 core

in vec4 frontColor;
in vec4 gl_FragCoord;
in vec3 my_normal;
in vec3 fL;
in vec3 fV;


uniform vec4 lightAmbient; // similar a gl_LightSource[0].ambient
uniform vec4 lightDiffuse; // similar a gl_LightSource[0].diffuse
uniform vec4 lightSpecular; // similar a gl_LightSource[0].specular
uniform vec4 lightPosition; // similar a gl_LightSource[0].position
//                             // (sempre estarà en eye space)
//
uniform vec4 matAmbient; // similar a gl_FrontMaterial.ambient
uniform vec4 matDiffuse; // similar a gl_FrontMaterial.diffuse
uniform vec4 matSpecular; // similar a gl_FrontMaterial.specular
uniform float matShininess; // similar a gl_FrontMaterial.shininess

out vec4 fragColor;

void main()
{
    vec3 N = normalize(my_normal);
    vec3 L = normalize(fL);
    vec3 V = normalize(fV);
    vec3 H = normalize(V + L);
    vec3 R = 2*dot(N,L)*N - L;


    vec4 ambient = matAmbient * lightAmbient;
    vec4 diffuse = matDiffuse * lightDiffuse * max(0.0,dot(N,L));
    vec4 specular = vec4(0);
    if (dot(N,L) > 0)
        specular = matSpecular*lightSpecular*pow(max(0.0,dot(R,V)),matShininess);

    fragColor = ambient + diffuse + specular;

}
