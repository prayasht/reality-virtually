#include <metal_stdlib>
using namespace metal;
#include <SceneKit/scn_metal>
#include <simd/simd.h>

typedef struct
{
    float3 position[[attribute (SCNVertexSemanticPosition)]];
} LumenVertexInput;

typedef struct
{
    float4 position[[position]];
    float distance

} LumenVertexOutput;

typedef struct
{
    //    float4x4 modelTransform;
    //    float4x4 inverseModelTransform;
    float4x4 modelViewTransform;
    //    float4x4 inverseModelViewTransform;
    float4x4 normalTransform; // Inverse transpose of modelViewTransform
    float4x4 modelViewProjectionTransform;
    //    float4x4 inverseModelViewProjectionTransform;
    //    float2x3 boundingBox;
    //    float2x3 worldBoundingBox;
} PerNodeSCNUniforms;

typedef struct
{

} CustomUniforms;

vertex LumenVertexOutput LumenVertexShader (LumenVertexInput in[[stage_in]],
                                        constant SCNSceneBuffer& scn_frame[[buffer (0)]],
                                        constant PerNodeSCNUniforms& scn_node[[buffer (1)]],
                                        constant CustomUniforms& uniforms[[buffer (2)]])
{

}

fragment half4 LumenFragmentShader(LumenVertexOutput in [[stage_in]])
{
    return in.color;
}


