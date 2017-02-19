// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'

// Shader created with Shader Forge v1.30 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.30;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:0,dpts:2,wrdp:False,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:True,fgod:False,fgor:False,fgmd:0,fgcr:0,fgcg:0,fgcb:0,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:True,fnfb:True;n:type:ShaderForge.SFN_Final,id:4795,x:35404,y:32582,varname:node_4795,prsc:2|custl-9082-OUT,alpha-2637-OUT;n:type:ShaderForge.SFN_FragmentPosition,id:2533,x:32844,y:32889,varname:node_2533,prsc:2;n:type:ShaderForge.SFN_Append,id:4468,x:33037,y:32889,varname:node_4468,prsc:2|A-2533-XYZ,B-2533-W;n:type:ShaderForge.SFN_Matrix4x4Property,id:3900,x:32992,y:32637,ptovrint:False,ptlb:_Camera2World,ptin:_Camera2World,varname:node_3900,prsc:2,glob:True,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,m00:1,m01:0,m02:0,m03:0,m10:0,m11:1,m12:0,m13:0,m20:0,m21:0,m22:1,m23:0,m30:0,m31:0,m32:0,m33:1;n:type:ShaderForge.SFN_MultiplyMatrix,id:6050,x:33242,y:32724,varname:node_6050,prsc:2|A-3900-OUT,B-4468-OUT;n:type:ShaderForge.SFN_LightPosition,id:1590,x:33221,y:32581,varname:node_1590,prsc:2;n:type:ShaderForge.SFN_Distance,id:5094,x:33448,y:32581,varname:node_5094,prsc:2|A-1590-XYZ,B-6050-OUT;n:type:ShaderForge.SFN_Power,id:1588,x:33807,y:32624,varname:node_1588,prsc:2|VAL-3458-OUT,EXP-9083-OUT;n:type:ShaderForge.SFN_ValueProperty,id:9083,x:33448,y:32756,ptovrint:False,ptlb:LightFalloff,ptin:_LightFalloff,varname:node_9083,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:3;n:type:ShaderForge.SFN_ValueProperty,id:6599,x:33675,y:32488,ptovrint:False,ptlb:LightRange,ptin:_LightRange,varname:node_6599,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Subtract,id:7807,x:33972,y:32591,varname:node_7807,prsc:2|A-6599-OUT,B-1588-OUT;n:type:ShaderForge.SFN_Max,id:7291,x:34183,y:32611,varname:node_7291,prsc:2|A-7807-OUT,B-1043-OUT;n:type:ShaderForge.SFN_Vector1,id:1043,x:33942,y:32745,varname:node_1043,prsc:2,v1:0;n:type:ShaderForge.SFN_Vector1,id:6691,x:34033,y:32799,varname:node_6691,prsc:2,v1:1;n:type:ShaderForge.SFN_RemapRangeAdvanced,id:5442,x:34387,y:32611,varname:node_5442,prsc:2|IN-7291-OUT,IMIN-1043-OUT,IMAX-6599-OUT,OMIN-1043-OUT,OMAX-6691-OUT;n:type:ShaderForge.SFN_LightColor,id:2671,x:34387,y:32459,varname:node_2671,prsc:2;n:type:ShaderForge.SFN_Tex2d,id:3475,x:34367,y:32768,ptovrint:False,ptlb:MainTexture,ptin:_MainTexture,varname:node_3475,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:28c7aad1372ff114b90d330f8a2dd938,ntxv:0,isnm:False;n:type:ShaderForge.SFN_VertexColor,id:3035,x:34382,y:32976,varname:node_3035,prsc:2;n:type:ShaderForge.SFN_Multiply,id:2505,x:34655,y:32610,varname:node_2505,prsc:2|A-2671-RGB,B-5442-OUT,C-3475-RGB,D-3035-RGB;n:type:ShaderForge.SFN_Multiply,id:2637,x:34663,y:32979,varname:node_2637,prsc:2|A-3475-A,B-3035-A;n:type:ShaderForge.SFN_Min,id:9082,x:34865,y:32628,varname:node_9082,prsc:2|A-2505-OUT,B-5343-OUT;n:type:ShaderForge.SFN_ValueProperty,id:5343,x:34732,y:32804,ptovrint:False,ptlb:LightClamp,ptin:_LightClamp,varname:node_5343,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0.3;n:type:ShaderForge.SFN_OneMinus,id:3458,x:33616,y:32581,varname:node_3458,prsc:2|IN-5094-OUT;proporder:3475-9083-6599-5343;pass:END;sub:END;*/

Shader "Shader Forge/PaticleShaderPractice" {
    Properties {
        _MainTexture ("MainTexture", 2D) = "white" {}
        _LightFalloff ("LightFalloff", Float ) = 3
        _LightRange ("LightRange", Float ) = 1
        _LightClamp ("LightClamp", Float ) = 0.3
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
            Blend One One
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
            uniform float4x4 _Camera2World;
            uniform float _LightFalloff;
            uniform float _LightRange;
            uniform sampler2D _MainTexture; uniform float4 _MainTexture_ST;
            uniform float _LightClamp;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float4 vertexColor : COLOR;
                UNITY_FOG_COORDS(2)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.vertexColor = v.vertexColor;
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                float node_1043 = 0.0;
                float4 _MainTexture_var = tex2D(_MainTexture,TRANSFORM_TEX(i.uv0, _MainTexture));
                float3 finalColor = min((_LightColor0.rgb*(node_1043 + ( (max((_LightRange-pow((1.0 - distance(_WorldSpaceLightPos0.rgb,mul(_Camera2World,float4(i.posWorld.rgb,i.posWorld.a)))),_LightFalloff)),node_1043) - node_1043) * (1.0 - node_1043) ) / (_LightRange - node_1043))*_MainTexture_var.rgb*i.vertexColor.rgb),_LightClamp);
                fixed4 finalRGBA = fixed4(finalColor,(_MainTexture_var.a*i.vertexColor.a));
                UNITY_APPLY_FOG_COLOR(i.fogCoord, finalRGBA, fixed4(0,0,0,1));
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
            uniform float4x4 _Camera2World;
            uniform float _LightFalloff;
            uniform float _LightRange;
            uniform sampler2D _MainTexture; uniform float4 _MainTexture_ST;
            uniform float _LightClamp;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float4 vertexColor : COLOR;
                LIGHTING_COORDS(2,3)
                UNITY_FOG_COORDS(4)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.vertexColor = v.vertexColor;
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                float node_1043 = 0.0;
                float4 _MainTexture_var = tex2D(_MainTexture,TRANSFORM_TEX(i.uv0, _MainTexture));
                float3 finalColor = min((_LightColor0.rgb*(node_1043 + ( (max((_LightRange-pow((1.0 - distance(_WorldSpaceLightPos0.rgb,mul(_Camera2World,float4(i.posWorld.rgb,i.posWorld.a)))),_LightFalloff)),node_1043) - node_1043) * (1.0 - node_1043) ) / (_LightRange - node_1043))*_MainTexture_var.rgb*i.vertexColor.rgb),_LightClamp);
                fixed4 finalRGBA = fixed4(finalColor * (_MainTexture_var.a*i.vertexColor.a),0);
                UNITY_APPLY_FOG_COLOR(i.fogCoord, finalRGBA, fixed4(0,0,0,1));
                return finalRGBA;
            }
            ENDCG
        }
    }
    CustomEditor "ShaderForgeMaterialInspector"
}
