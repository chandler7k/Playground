//
//  ViewController.m
//  6-1
//
//  Created by zouhuanlin on 2019/2/19.
//  Copyright © 2019 zouhuanlin. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIBezierPath *path = [[UIBezierPath alloc] init];
    [path moveToPoint:CGPointMake(175, 100)];
    [path addArcWithCenter:CGPointMake(150, 100) radius:25 startAngle:0 endAngle:2*M_PI clockwise:YES];
    [path moveToPoint:CGPointMake(150, 125)];
    [path addLineToPoint:CGPointMake(150, 175)];
    [path addLineToPoint:CGPointMake(125, 225)];
    [path moveToPoint:CGPointMake(150, 175)];
    [path addLineToPoint:CGPointMake(175, 225)];
    [path moveToPoint:CGPointMake(100, 150)];
    [path addLineToPoint:CGPointMake(200, 150)];
    
    CAShapeLayer *shapelayer = [CAShapeLayer layer];
    shapelayer.strokeColor = [UIColor redColor].CGColor;
    shapelayer.fillColor = [UIColor redColor].CGColor;
    shapelayer.lineWidth = 5;
    shapelayer.lineJoin = kCALineJoinRound;
    shapelayer.lineCap = kCALineCapRound;
    shapelayer.path = path.CGPath;
    // 用BezierPath获取CGPath 可以省去释放CGPath的步骤
    
    [self.view.layer addSublayer:shapelayer];
    
    
    CGRect rect = CGRectMake(50, 50, 100, 100);
    CGSize raddi = CGSizeMake(20, 20);
    UIRectCorner corners = UIRectCornerTopRight | UIRectCornerBottomRight | UIRectCornerBottomLeft;
    UIBezierPath *path2 = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:corners cornerRadii:raddi];
    
    CAShapeLayer *shapeLayer2 = [CAShapeLayer layer];
    
    shapeLayer2.path = path2.CGPath;
    [self.view.layer addSublayer:shapeLayer2];
}


@end
