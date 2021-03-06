#ifndef INPUT_SURFACE_VEGETATION_INCLUDED
#define INPUT_SURFACE_VEGETATION_INCLUDED

#include "LWRP/ShaderLibrary/Core.hlsl"
#include "CoreRP/ShaderLibrary/CommonMaterial.hlsl"
#include "LWRP/ShaderLibrary/InputSurfaceCommon.hlsl"

CBUFFER_START(UnityPerMaterial)
float4 _MainTex_ST;
half _Cutoff;
half _Gloss;
CBUFFER_END

inline void InitializeStandardLitSurfaceData(float2 uv, out SurfaceData outSurfaceData)
{
    half4 albedoAlpha = SampleAlbedoAlpha(uv, TEXTURE2D_PARAM(_MainTex, sampler_MainTex));

    outSurfaceData.alpha = Alpha(albedoAlpha.a, 1, _Cutoff);

    outSurfaceData.albedo = albedoAlpha.rgb;

    //half4 specGloss = SampleMetallicSpecGloss(uv, albedoAlpha.a);

    outSurfaceData.metallic = 0;
    outSurfaceData.specular = half3(0.0h, 0.0h, 0.0h);

    outSurfaceData.smoothness = _Gloss;
    outSurfaceData.normalTS = SampleNormal(uv, TEXTURE2D_PARAM(_BumpMap, sampler_BumpMap));
    outSurfaceData.occlusion = 1;
    outSurfaceData.emission = 0;
}

#endif // INPUT_SURFACE_VEGETATION_INCLUDED
