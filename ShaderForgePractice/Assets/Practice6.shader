// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'

// Shader created with Shader Forge v1.30 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.30;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:4013,x:33712,y:32494,varname:node_4013,prsc:2|diff-5457-OUT,transm-5457-OUT,alpha-6620-OUT;n:type:ShaderForge.SFN_TexCoord,id:4470,x:32425,y:32802,varname:node_4470,prsc:2,uv:0;n:type:ShaderForge.SFN_RemapRange,id:9706,x:32591,y:32802,varname:node_9706,prsc:2,frmn:0,frmx:1,tomn:-1,tomx:1|IN-4470-UVOUT;n:type:ShaderForge.SFN_Length,id:2922,x:32751,y:32847,varname:node_2922,prsc:2|IN-9706-OUT;n:type:ShaderForge.SFN_Floor,id:3773,x:33134,y:32855,varname:node_3773,prsc:2|IN-2922-OUT;n:type:ShaderForge.SFN_Length,id:467,x:32751,y:32727,varname:node_467,prsc:2|IN-9706-OUT;n:type:ShaderForge.SFN_ValueProperty,id:727,x:32751,y:32690,ptovrint:False,ptlb:radius,ptin:_radius,varname:node_727,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0.3;n:type:ShaderForge.SFN_Add,id:1948,x:32969,y:32721,varname:node_1948,prsc:2|A-727-OUT,B-467-OUT;n:type:ShaderForge.SFN_Floor,id:1898,x:33134,y:32721,varname:node_1898,prsc:2|IN-1948-OUT;n:type:ShaderForge.SFN_Subtract,id:6620,x:33391,y:32790,varname:node_6620,prsc:2|A-1898-OUT,B-3773-OUT;n:type:ShaderForge.SFN_Color,id:3494,x:33156,y:32229,ptovrint:False,ptlb:node_3494,ptin:_node_3494,varname:node_3494,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:0,c3:0,c4:1;n:type:ShaderForge.SFN_Color,id:1014,x:33156,y:32448,ptovrint:False,ptlb:node_1014,ptin:_node_1014,varname:node_1014,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0,c2:1,c3:0,c4:1;n:type:ShaderForge.SFN_Lerp,id:5457,x:33427,y:32395,varname:node_5457,prsc:2|A-3494-RGB,B-1014-RGB,T-5485-OUT;n:type:ShaderForge.SFN_Slider,id:5485,x:32877,y:32385,ptovrint:False,ptlb:node_5485,ptin:_node_5485,varname:node_5485,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:1;proporder:727-3494-1014-5485;pass:END;sub:END;*/

Shader "Shader Forge/Practice6" {
    Properties {
        _radius ("radius", Float ) = 0.3
        _node_3494 ("node_3494", Color) = (1,0,0,1)
        _node_1014 ("node_1014", Color) = (0,1,0,1)
        _node_5485 ("node_5485", Range(0, 1)) = 1
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "IgnoreProjector"="True"
            "Queue"="Transparent"
            "RenderType"="Transparent"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            Blend SrcAlpha OneMinusSrcAlpha
            ZWrite Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase
            #pragma multi_compile_fog
            #pragma exclude_renderers gles3 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform float4 _LightColor0;
            uniform float _radius;
            uniform float4 _node_3494;
            uniform float4 _node_1014;
            uniform float _node_5485;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                UNITY_FOG_COORDS(3)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 normalDirection = i.normalDir;
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                float attenuation = 1;
                float3 attenColor = attenuation * _LightColor0.xyz;
/////// Diffuse:
                float NdotL = dot( normalDirection, lightDirection );
                float3 forwardLight = max(0.0, NdotL );
                float3 node_5457 = lerp(_node_3494.rgb,_node_1014.rgb,_node_5485);
                float3 backLight = max(0.0, -NdotL ) * node_5457;
                NdotL = max(0.0,dot( normalDirection, lightDirection ));
                float3 directDiffuse = (forwardLight+backLight) * attenColor;
                float3 indirectDiffuse = float3(0,0,0);
                indirectDiffuse += UNITY_LIGHTMODEL_AMBIENT.rgb; // Ambient Light
                float3 diffuseColor = node_5457;
                float3 diffuse = (directDiffuse + indirectDiffuse) * diffuseColor;
/// Final Color:
                float3 finalColor = diffuse;
                float2 node_9706 = (i.uv0*2.0+-1.0);
                fixed4 finalRGBA = fixed4(finalColor,(floor((_radius+length(node_9706)))-floor(length(node_9706))));
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
        Pass {
            Name "FORWARD_DELTA"
            Tags {
                "LightMode"="ForwardAdd"
            }
            Blend One One
            ZWrite Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDADD
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdadd
            #pragma multi_compile_fog
            #pragma exclude_renderers gles3 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform float4 _LightColor0;
            uniform float _radius;
            uniform float4 _node_3494;
            uniform float4 _node_1014;
            uniform float _node_5485;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                LIGHTING_COORDS(3,4)
                UNITY_FOG_COORDS(5)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 normalDirection = i.normalDir;
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
/////// Diffuse:
                float NdotL = dot( normalDirection, lightDirection );
                float3 forwardLight = max(0.0, NdotL );
                float3 node_5457 = lerp(_node_3494.rgb,_node_1014.rgb,_node_5485);
                float3 backLight = max(0.0, -NdotL ) * node_5457;
                NdotL = max(0.0,dot( normalDirection, lightDirection ));
                float3 directDiffuse = (forwardLight+backLight) * attenColor;
                float3 diffuseColor = node_5457;
                float3 diffuse = directDiffuse * diffuseColor;
/// Final Color:
                float3 finalColor = diffuse;
                float2 node_9706 = (i.uv0*2.0+-1.0);
                fixed4 finalRGBA = fixed4(finalColor * (floor((_radius+length(node_9706)))-floor(length(node_9706))),0);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
