Shader "Overlay/Multiply"
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
    return lerp(half4(1, 1, 1, 1), tex2D(_MainTex, i.uv), _Opacity);
}

    ENDCG

    SubShader
    {
        Tags { "RenderType"="Overlay" "Queue"="Overlay" }
        Pass
        {
            Blend DstColor Zero
            CGPROGRAM
            #pragma vertex vert_img
            #pragma fragment frag
            ENDCG
        }
    } 
}
