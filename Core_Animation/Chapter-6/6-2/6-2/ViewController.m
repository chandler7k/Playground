//
//  ViewController.m
//  6-2
//
//  Created by zouhuanlin on 2019/2/19.
//  Copyright © 2019 zouhuanlin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    CATextLayer *textLayer = [CATextLayer layer];
    textLayer.frame = self.view.bounds;
    [self.view.layer addSublayer:textLayer];
    
    textLayer.foregroundColor = [UIColor blackColor].CGColor;
    textLayer.alignmentMode = kCAAlignmentJustified;
    textLayer.wrapped = YES;
    
    UIFont *font = [UIFont systemFontOfSize:15];
    
    CFStringRef fontname = (__bridge CFStringRef)font.fontName;
    // 注意桥接 NSString 转换为CFStringRef
    CGFontRef fontRef = CGFontCreateWithFontName(fontname);
    textLayer.font = fontRef;
    textLayer.fontSize = font.pointSize;
    CGFontRelease(fontRef);
    
    NSString *text = @"Lorem ipsum dolor sit amet, consectetur adipiscing \ elit. Quisque massa arcu, eleifend vel varius in, facilisis pulvinar \ leo. Nunc quis nunc at mauris pharetra condimentum ut ac neque. Nunc elementum, libero ut porttitor dictum, diam odio congue lacus, vel \ fringilla sapien diam at purus. Etiam suscipit pretium nunc sit amet \ lobortis";
    
    //set layer text
    textLayer.string = text;
    
    // 解决像素化
    textLayer.contentsScale = [UIScreen mainScreen].scale;
}


@end
