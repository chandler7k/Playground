//
//  ViewController.m
//  Metal-1
//
//  Created by 邹奂霖 on 2019/8/7.
//  Copyright © 2019 邹奂霖. All rights reserved.
//

#import "ViewController.h"
#import <Metal/Metal.h>
#import <MetalKit/MetalKit.h>
@interface ViewController ()
@property(nonatomic, strong) id<MTLDevice> device;
@property(nonatomic, strong) MTKView *mtkView;
@property(nonatomic, strong) id<MTLRenderPipelineState> pipeLineState;
@property(nonatomic, strong) id<MTLSamplerState> sampleState;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.device = MTLCreateSystemDefaultDevice();
    if(!self.device){
        NSLog(@"device not support");
    }
    [self mtltest];
}

- (void)mtltest{
    id<MTLCommandQueue> queue = self.device.newCommandQueue;
    self.mtkView = [[MTKView alloc] initWithFrame:self.view.frame device:self.device];
    [self.view addSubview:self.mtkView];
    CAMetalLayer *metalLayer = (CAMetalLayer*)[_mtkView layer];
    id<CAMetalDrawable> drawable = [metalLayer nextDrawable];
    id<MTLCommandBuffer> commandBuffer = queue.commandBuffer;
    
    static const float vertexArrayData[] = {
        // 前 4 位 位置 x , y , z ,w
        0.577, -0.25, 0.0, 1.0,
        -0.577, -0.25, 0.0, 1.0,
        0.0,  0.5, 0.0, 1.0,
    };
    
    id<MTLBuffer> buffer = [self.device newBufferWithBytes:vertexArrayData length:sizeof(vertexArrayData) options:0];
    UIImage *image = [UIImage imageNamed:@"IMG_1681"];
    MTKTextureLoader *loader = [[MTKTextureLoader alloc] initWithDevice:self.device];
    NSError *err;
    id<MTLTexture> sourceTexture = [loader newTextureWithCGImage:image.CGImage options:nil error:&err];
    
    id<MTLLibrary> library = [self.device newDefaultLibrary];
    
    MTLRenderPipelineDescriptor *des = [MTLRenderPipelineDescriptor new];
    des.vertexFunction = [library newFunctionWithName:@"myVertexShader"];
    des.fragmentFunction = [library newFunctionWithName:@"myFragmentShader"];
    des.colorAttachments[0].pixelFormat = MTLPixelFormatBGRA8Unorm;
    NSError *pipErr;
    self.pipeLineState = [self.device newRenderPipelineStateWithDescriptor:des error:&pipErr];
    
    MTLRenderPassDescriptor *renderDes = [MTLRenderPassDescriptor new];
    renderDes.colorAttachments[0].texture = drawable.texture;
    renderDes.colorAttachments[0].loadAction = MTLLoadActionClear;
    renderDes.colorAttachments[0].storeAction = MTLStoreActionStore;
    renderDes.colorAttachments[0].clearColor = MTLClearColorMake(0.5, 0.65, 0.8, 1); //background color
    
    id<MTLRenderCommandEncoder> encoder = [commandBuffer renderCommandEncoderWithDescriptor:renderDes];
    [encoder setCullMode:MTLCullModeNone];
    [encoder setFrontFacingWinding:MTLWindingCounterClockwise];
    [encoder setRenderPipelineState:self.pipeLineState];
    [encoder setVertexBuffer:buffer offset:0 atIndex:0];
    [encoder setFragmentTexture:sourceTexture atIndex:0];
    MTLSamplerDescriptor *sampleDes = [MTLSamplerDescriptor new];
    sampleDes.minFilter = MTLSamplerMinMagFilterNearest;
    sampleDes.magFilter = MTLSamplerMinMagFilterLinear;
    self.sampleState = [_device newSamplerStateWithDescriptor:sampleDes];
    
    [encoder setFragmentSamplerState:self.sampleState atIndex:0];
    [encoder drawPrimitives:MTLPrimitiveTypeTriangle
                vertexStart:0
                vertexCount:3];
    
    [encoder endEncoding];
    
    
    //commit
    [commandBuffer presentDrawable:drawable];
    [commandBuffer commit];
    
}


@end
