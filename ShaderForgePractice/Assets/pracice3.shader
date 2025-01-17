// Shader created with Shader Forge v1.30 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.30;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:4013,x:32857,y:32433,varname:node_4013,prsc:2|emission-1403-OUT;n:type:ShaderForge.SFN_TexCoord,id:8892,x:32105,y:32867,varname:node_8892,prsc:2,uv:0;n:type:ShaderForge.SFN_Lerp,id:1403,x:32527,y:32471,varname:node_1403,prsc:2|A-4493-RGB,B-7798-RGB,T-2366-OUT;n:type:ShaderForge.SFN_Color,id:4493,x:32217,y:32453,ptovrint:False,ptlb:node_4493,ptin:_node_4493,varname:node_4493,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:0,c3:0,c4:1;n:type:ShaderForge.SFN_Color,id:7798,x:32217,y:32652,ptovrint:False,ptlb:node_7798,ptin:_node_7798,varname:node_7798,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0,c2:0.710345,c3:1,c4:1;n:type:ShaderForge.SFN_Length,id:5286,x:32480,y:32809,varname:node_5286,prsc:2|IN-9459-OUT;n:type:ShaderForge.SFN_RemapRange,id:9459,x:32272,y:32867,varname:node_9459,prsc:2,frmn:0,frmx:1,tomn:-1,tomx:1|IN-8892-UVOUT;n:type:ShaderForge.SFN_ComponentMask,id:9845,x:32452,y:32990,varname:node_9845,prsc:2,cc1:0,cc2:1,cc3:-1,cc4:-1|IN-9459-OUT;n:type:ShaderForge.SFN_ArcTan2,id:2366,x:32673,y:32965,varname:node_2366,prsc:2,attp:2|A-9845-G,B-9845-R;proporder:4493-7798;pass:END;sub:END;*/

Shader "Shader Forge/pracice3" {
    Properties {
        _node_4493 ("node_4493", Color) = (1,0,0,1)
        _node_7798 ("node_7798", Color) = (0,0.710345,1,1)
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
            uniform float4 _node_4493;
            uniform float4 _node_7798;
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
                float2 node_9459 = (i.uv0*2.0+-1.0);
                float2 node_9845 = node_9459.rg;
                float3 emissive = lerp(_node_4493.rgb,_node_7798.rgb,((atan2(node_9845.g,node_9845.r)/6.28318530718)+0.5));
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
