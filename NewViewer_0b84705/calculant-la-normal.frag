#version 330 core

in vec4 frontColor;
in vec3 my_normal;
in vec4 vpos;

out vec4 fragColor;


// N = vector normal unitari en el punt
// V = vector unitari del punt cap a la càmera
// L = vector unitari del punt cap a la font de llum


// uniform vec4 lightDiffuse; // similar a gl_LightSource[0].diffuse
// uniform vec4 matDiffuse; // similar a gl_FrontMaterial.diffuse



// // vec4 light(vec3 N, vec3 V, vec3 L)
// vec4 light(vec3 N, vec3 L)
// {
//     N=normalize(N);
//     // V=normalize(V);
//     L=normalize(L);
//     // vec3 R = normalize( 2.0*dot(N,L)*N-L );
//     float NdotL = max( 0.0, dot( N,L ) );
//     // float RdotV = max( 0.0, dot( R,V ) );
//     float Idiff = NdotL;
//     // float Ispec = 0;
//     // if (NdotL>0) Ispec=pow( RdotV, matShininess );
//         return
//             // matAmbient * lightAmbient +
//             matDiffuse * lightDiffuse * Idiff;
//             // matSpecular * lightSpecular * Ispec;
// }


void main()
{
    vec3 dx = dFdx(vpos.xyz);
    vec3 dy = dFdy(vpos.xyz);
    vec3 N = normalize(cross(dx,dy));
    vec3 ggg = normalize(my_normal);
    fragColor = frontColor;
    fragColor = frontColor * N.z;
    // fragColor = frontColor * ggg.z;
    // fragColor = vec4(1,0,0,0);
}
