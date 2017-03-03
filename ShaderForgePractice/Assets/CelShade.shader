// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'

// Shader created with Shader Forge v1.30 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.30;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:4013,x:33280,y:32280,varname:node_4013,prsc:2|emission-6762-OUT,custl-2488-OUT;n:type:ShaderForge.SFN_LightAttenuation,id:5430,x:32049,y:33015,varname:node_5430,prsc:2;n:type:ShaderForge.SFN_LightColor,id:2994,x:32049,y:32852,varname:node_2994,prsc:2;n:type:ShaderForge.SFN_LightVector,id:1509,x:31191,y:32293,varname:node_1509,prsc:2;n:type:ShaderForge.SFN_NormalVector,id:6636,x:31191,y:32430,prsc:2,pt:False;n:type:ShaderForge.SFN_Tex2d,id:9432,x:31986,y:32278,ptovrint:False,ptlb:Diffuse,ptin:_Diffuse,varname:node_9432,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:b66bceaf0cc0ace4e9bdc92f14bba709,ntxv:0,isnm:False;n:type:ShaderForge.SFN_AmbientLight,id:2160,x:32151,y:32116,varname:node_2160,prsc:2;n:type:ShaderForge.SFN_Multiply,id:6762,x:32700,y:32222,varname:node_6762,prsc:2|A-2160-RGB,B-9432-RGB;n:type:ShaderForge.SFN_If,id:2488,x:32673,y:32657,varname:node_2488,prsc:2|A-743-OUT,B-5918-OUT,GT-2160-RGB,EQ-7766-OUT,LT-7766-OUT;n:type:ShaderForge.SFN_Vector1,id:5918,x:32355,y:32667,varname:node_5918,prsc:2,v1:90;n:type:ShaderForge.SFN_ArcCos,id:743,x:32167,y:32494,varname:node_743,prsc:2|IN-7549-OUT;n:type:ShaderForge.SFN_Multiply,id:7766,x:32297,y:32848,varname:node_7766,prsc:2|A-2994-RGB,B-2160-RGB,C-5430-OUT;n:type:ShaderForge.SFN_Dot,id:1633,x:31443,y:32347,varname:node_1633,prsc:2,dt:0|A-1509-OUT,B-6636-OUT;n:type:ShaderForge.SFN_Abs,id:5043,x:31402,y:32604,varname:node_5043,prsc:2|IN-1509-OUT;n:type:ShaderForge.SFN_Abs,id:4633,x:31402,y:32730,varname:node_4633,prsc:2|IN-6636-OUT;n:type:ShaderForge.SFN_Multiply,id:565,x:31644,y:32650,varname:node_565,prsc:2|A-5043-OUT,B-4633-OUT;n:type:ShaderForge.SFN_Divide,id:7549,x:31784,y:32488,varname:node_7549,prsc:2|A-1633-OUT,B-565-OUT;proporder:9432;pass:END;sub:END;*/

Shader "Shader Forge/CelShade" {
    Properties {
        _Diffuse ("Diffuse", 2D) = "white" {}
    }
    SubShader {
        Tags {
            "RenderType"="Opaque"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #include "Lighting.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog
            #pragma exclude_renderers gles3 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform sampler2D _Diffuse; uniform float4 _Diffuse_ST;
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
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
////// Emissive:
                float4 _Diffuse_var = tex2D(_Diffuse,TRANSFORM_TEX(i.uv0, _Diffuse));
                float3 emissive = (UNITY_LIGHTMODEL_AMBIENT.rgb*_Diffuse_var.rgb);
                float node_2488_if_leA = step(acos((dot(lightDirection,i.normalDir)/(abs(lightDirection)*abs(i.normalDir)))),90.0);
                float node_2488_if_leB = step(90.0,acos((dot(lightDirection,i.normalDir)/(abs(lightDirection)*abs(i.normalDir)))));
                float3 node_7766 = (_LightColor0.rgb*UNITY_LIGHTMODEL_AMBIENT.rgb*attenuation);
                float3 finalColor = emissive + lerp((node_2488_if_leA*node_7766)+(node_2488_if_leB*UNITY_LIGHTMODEL_AMBIENT.rgb),node_7766,node_2488_if_leA*node_2488_if_leB);
                fixed4 finalRGBA = fixed4(finalColor,1);
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
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDADD
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #include "Lighting.cginc"
            #pragma multi_compile_fwdadd_fullshadows
            #pragma multi_compile_fog
            #pragma exclude_renderers gles3 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform sampler2D _Diffuse; uniform float4 _Diffuse_ST;
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
                float node_2488_if_leA = step(acos((dot(lightDirection,i.normalDir)/(abs(lightDirection)*abs(i.normalDir)))),90.0);
                float node_2488_if_leB = step(90.0,acos((dot(lightDirection,i.normalDir)/(abs(lightDirection)*abs(i.normalDir)))));
                float3 node_7766 = (_LightColor0.rgb*UNITY_LIGHTMODEL_AMBIENT.rgb*attenuation);
                float3 finalColor = lerp((node_2488_if_leA*node_7766)+(node_2488_if_leB*UNITY_LIGHTMODEL_AMBIENT.rgb),node_7766,node_2488_if_leA*node_2488_if_leB);
                fixed4 finalRGBA = fixed4(finalColor * 1,0);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
