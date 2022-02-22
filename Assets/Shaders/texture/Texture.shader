 Shader "Example/double" {
    Properties {
      _MainTex ("Texture", 2D) = "white" {}
        _Albedo("Albedo", Color)= (1,1,1,1)//vec4
    }
    SubShader {
      Tags { "RenderType" = "Opaque" }
      CGPROGRAM
      fixed4 _Albedo;
      #pragma surface surf Lambert
      struct Input {
          float2 uv_MainTex;
          float4 color : COLOR;
      };
      sampler2D _MainTex;
      void surf (Input IN, inout SurfaceOutput o) {
         // o.Albedo = 1;
         // o.Albedo=_Albedo.rgb;
          o.Albedo = tex2D (_MainTex, IN.uv_MainTex).rgb* _Albedo.rgb;
         
          
      }
      ENDCG
    } 
    Fallback "Diffuse"
  } 