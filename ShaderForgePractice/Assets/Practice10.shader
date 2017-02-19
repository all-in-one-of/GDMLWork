// Shader created with Shader Forge v1.30 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.30;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:4013,x:33346,y:32764,varname:node_4013,prsc:2|emission-7567-OUT;n:type:ShaderForge.SFN_Sin,id:8882,x:32600,y:32940,varname:node_8882,prsc:2|IN-2245-OUT;n:type:ShaderForge.SFN_Color,id:4731,x:32759,y:32630,ptovrint:False,ptlb:StartColour,ptin:_StartColour,varname:node_4731,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0,c2:0,c3:0,c4:1;n:type:ShaderForge.SFN_Color,id:5089,x:32759,y:32795,ptovrint:False,ptlb:EndColour,ptin:_EndColour,varname:node_5089,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:0,c3:0,c4:1;n:type:ShaderForge.SFN_Lerp,id:9831,x:32989,y:32795,varname:node_9831,prsc:2|A-4731-RGB,B-5089-RGB,T-2368-OUT;n:type:ShaderForge.SFN_Time,id:5557,x:32176,y:32940,varname:node_5557,prsc:2;n:type:ShaderForge.SFN_Tau,id:6219,x:32176,y:33068,varname:node_6219,prsc:2;n:type:ShaderForge.SFN_Multiply,id:2245,x:32419,y:32940,varname:node_2245,prsc:2|A-5557-T,B-6219-OUT;n:type:ShaderForge.SFN_RemapRange,id:2368,x:32759,y:32940,varname:node_2368,prsc:2,frmn:-1,frmx:1,tomn:0,tomx:1|IN-8882-OUT;n:type:ShaderForge.SFN_TexCoord,id:2746,x:32998,y:33006,varname:node_2746,prsc:2,uv:0;n:type:ShaderForge.SFN_Multiply,id:7567,x:33169,y:32868,varname:node_7567,prsc:2|A-9831-OUT,B-2746-UVOUT;proporder:4731-5089;pass:END;sub:END;*/

Shader "Shader Forge/Practice10" {
    Properties {
        _StartColour ("StartColour", Color) = (0,0,0,1)
        _EndColour ("EndColour", Color) = (1,0,0,1)
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
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog
            #pragma exclude_renderers gles3 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform float4 _TimeEditor;
            uniform float4 _StartColour;
            uniform float4 _EndColour;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                UNITY_FOG_COORDS(1)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
////// Lighting:
////// Emissive:
                float4 node_5557 = _Time + _TimeEditor;
                float3 emissive = (lerp(_StartColour.rgb,_EndColour.rgb,(sin((node_5557.g*6.28318530718))*0.5+0.5))*float3(i.uv0,0.0));
                float3 finalColor = emissive;
                fixed4 finalRGBA = fixed4(finalColor,1);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
