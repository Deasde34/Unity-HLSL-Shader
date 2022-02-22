Shader "Example/NormalMap" {
    Properties {
      _MainTex ("Texture", 2D) = "white" {}
      _BumpMap ("Bumpmap", 2D) = "bump" {}
       _NormalStrength("Normal Strength",Range (-4.0,4.0))=1.0
    }
    SubShader {
      Tags { "RenderType" = "Opaque" }
      CGPROGRAM
      #pragma surface surf Lambert
      float _NormalStrength;
      struct Input {
        float2 uv_MainTex;
        float2 uv_BumpMap;
        
      };
      sampler2D _MainTex;
      sampler2D _BumpMap;
      void surf (Input IN, inout SurfaceOutput o) {
        o.Albedo = tex2D (_MainTex, IN.uv_MainTex).rgb;
        o.Normal = UnpackNormal (tex2D (_BumpMap, IN.uv_BumpMap));
        o.Normal.z/= _NormalStrength;
      }
      ENDCG
    } 
    Fallback "Diffuse"
  }