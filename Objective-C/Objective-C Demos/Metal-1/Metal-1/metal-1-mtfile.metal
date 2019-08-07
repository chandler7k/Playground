//
//  metal-1-mtfile.metal
//  Metal-1
//
//  Created by 邹奂霖 on 2019/8/7.
//  Copyright © 2019 邹奂霖. All rights reserved.
//

#include <metal_stdlib>
using namespace metal;

typedef struct
{
    float4 position;
    float2 texCoords;
} VertexIn;


typedef struct
{
    float4 position [[position]];
    float2 texCoords;
}VertexOut;



vertex VertexOut myVertexShader(const device VertexIn* vertexArray [[buffer(0)]],
                                unsigned int vid  [[vertex_id]]){
    
    VertexOut verOut;
    verOut.position = vertexArray[vid].position;
    verOut.texCoords = vertexArray[vid].texCoords;
    return verOut;
    
}


fragment float4 myFragmentShader(
                                 VertexOut vertexIn [[stage_in]],
                                 texture2d<float,access::sample>   inputImage   [[ texture(0) ]],
                                 sampler textureSampler [[sampler(0)]]
                                 )
{
    float4 color = inputImage.sample(textureSampler, vertexIn.texCoords);
    return color;
    
}

