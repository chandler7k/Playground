//
//  ViewController.m
//  01-Layer
//
//  Created by zouhuanlin on 2019/1/16.
//  Copyright © 2019 zouhuanlin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) UIView *layerView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:self.layerView];
    UIImage *image = [UIImage imageNamed:@"IMG_1920.PNG"];
//    [self addSpriteImage:image withContentRect:CGRectMake(0, 0, 0.5, 0.5) toLayer:self.layerView.layer];
    [self addStrechableImage:image withContentCenter:CGRectMake(0.25, 0.25, 0.5, 0.5) toLayer:self.layerView.layer];
//    self.layerView.layer.contents = (__bridge id _Nullable)(image.CGImage);
//    self.layerView.layer.contentsGravity = kCAGravityCenter;
//    self.layerView.layer.contentsScale = [UIScreen mainScreen].scale;
//    self.layerView.clipsToBounds = YES;
//    self.layerView.layer.masksToBounds = YES;
//    CALayer *blueLayer = [CALayer layer];
//    blueLayer.frame = CGRectMake(50, 50, 100, 100);
//    blueLayer.backgroundColor = [UIColor blueColor].CGColor;
//    [self.layerView.layer addSublayer:blueLayer];
    
}

#pragma mark: - Setter
- (UIView *)layerView
{
    if (!_layerView) {
        _layerView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
        _layerView.backgroundColor = [UIColor whiteColor];
        
    }
    return _layerView;
}

- (void)addSpriteImage:(UIImage *)image withContentRect:(CGRect)rect toLayer:(CALayer *)layer
{
    layer.contents = (__bridge id)image.CGImage;
    layer.contentsGravity = kCAGravityResizeAspect;
    layer.contentsRect = rect;
}

- (void)addStrechableImage: (UIImage *)image withContentCenter:(CGRect)rect toLayer:(CALayer *)layer
{
    layer.contents = (__bridge id)image.CGImage;
    layer.contentsCenter = rect;
}


@end
