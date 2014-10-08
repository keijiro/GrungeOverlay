Shader "Overlay/Screen (grayscale)"
{
    Properties
    {
        _MainTex("Base (RGB)", 2D) = "white" {}
        _Opacity("Opacity", Float) = 1.0
    }

    CGINCLUDE

#include "UnityCG.cginc"

sampler2D _MainTex;
half _Opacity;

half4 frag(v2f_img i) : COLOR
{
    half a = tex2D(_MainTex, i.uv).r * _Opacity;
    return half4(a, a, a, 1.0f - a);
}

    ENDCG

    SubShader
    {
        Tags { "RenderType"="Overlay" "Queue"="Overlay" }
        ZTest Always Cull Off ZWrite Off
        Fog { Mode off }  
        ColorMask RGB
        Pass
        {
            Blend One SrcAlpha
            CGPROGRAM
            #pragma vertex vert_img
            #pragma fragment frag
            ENDCG
        }
    } 
}
