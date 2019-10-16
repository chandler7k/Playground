import Cocoa
import MetalKit
import PlaygroundSupport
guard let device = MTLCreateSystemDefaultDevice() else{
    fatalError("GPU is not supported")
}

let frame = CGRect(x: 0, y: 0, width: 600, height: 600)
let view = MTKView(frame: frame, device: device)
view.clearColor = MTLClearColor(red: 1, green: 1, blue: 0.8, alpha: 1);

let allocator = MTKMeshBufferAllocator(device: device) // bufferalloctor管理mesh内存
// 创建Metal IO mesh
// sphereWithExtent返回球面大小
let mdlMesh = MDLMesh(sphereWithExtent: [0.2, 0.75, 0.2], segments: [100, 100], inwardNormals: false, geometryType: .triangles, allocator: allocator)
// 将mtal io mesh转化成metalkit mesh
let mtMesh = try MTKMesh(mesh: mdlMesh, device: device)


guard let commandQueue = device.makeCommandQueue() else{
    fatalError("Could not create command queue")
}
// command buffer至少包含一个render command encoder，指向shader function， pipeline state
// shader functions 在GPU运行，metal shading语言，是C++的子集
let shader = """
#include <metal_stdlib>
using namespace metal;

struct VertexIn {
  float4 position [[ attribute(0) ]];
};

vertex float4 vertex_main(const VertexIn vertex_in [[ stage_in ]]) {
  return vertex_in.position;
}

fragment float4 fragment_main() {
  return float4(0, 0.4, 0.21, 1);
}
"""
// fragment_main返回的是颜色

// set up metal library
let library = try device.makeLibrary(source: shader, options: nil)
let vertexFunction = library.makeFunction(name: "vertex_main")
let fragmentFunction = library.makeFunction(name: "fragment_main")

// 通过descriptor创建pipeline state，descriptor包含所有ps需要知道的属性
let descriptor = MTLRenderPipelineDescriptor()
descriptor.colorAttachments[0].pixelFormat = .bgra8Unorm
descriptor.vertexFunction = vertexFunction
descriptor.fragmentFunction = fragmentFunction
descriptor.vertexDescriptor = MTKMetalVertexDescriptorFromModelIO(mtMesh.vertexDescriptor)

// 创建pipeline state
let pipelineState = try device.makeRenderPipelineState(descriptor: descriptor)

guard let commandBuffer = commandQueue.makeCommandBuffer(), let descriptor = view.currentRenderPassDescriptor, let renderEncoder = commandBuffer.makeRenderCommandEncoder(descriptor: descriptor) else{
    fatalError()
}

renderEncoder.setRenderPipelineState(pipelineState)
renderEncoder.setVertexBuffer(mtMesh.vertexBuffers[0].buffer, offset: 0, index: 0)

guard let submesh = mtMesh.submeshes.first else{
    fatalError()
}
// 让GPU渲染vertextBuffer，包含三角形和所有submesh index配置的信息部剧的顶点
renderEncoder.drawIndexedPrimitives(type: .triangle, indexCount: submesh.indexCount, indexType: submesh.indexType, indexBuffer: submesh.indexBuffer.buffer, indexBufferOffset: 0)


renderEncoder.endEncoding()

guard let drawable = view.currentDrawable else{
    fatalError()
}

commandBuffer.present(drawable)
commandBuffer.commit()
PlaygroundPage.current.liveView = view

