  Shader "ulsa/basic Color" 
  {
      Properties
      {
        _Albedo("Albedo", Color) = (1, 1, 1, 1) //vec4
      }
      SubShader 
      {
        Tags("RenderType" = "Opaque")
      }

    CGPROGRAM
      #pragma surfarce surf Lambert

      fixed4 _Albedo;

      struct Input{
        float4 color : COLOR;
      };

      void surf(Input IN, inout SurfaceOutput o)
      {
        o.albedo = _Albedo.rgb
      }
    ENDCG
  }
  