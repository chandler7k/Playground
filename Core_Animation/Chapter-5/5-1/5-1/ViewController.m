//
//  ViewController.m
//  5-1
//
//  Created by zouhuanlin on 2019/2/18.
//  Copyright © 2019 zouhuanlin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
CGAffineTransform CGAffineTransformMakeShear(CGFloat x, CGFloat y)
{
    CGAffineTransform transform = CGAffineTransformIdentity;
    transform.c = -x;
    transform.b = y;
    return transform;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    view1.backgroundColor = UIColor.lightGrayColor;
    [self.view addSubview:view1];
    
//    CGAffineTransform transform = CGAffineTransformMakeRotation(M_PI_4);
//    view1.layer.affineTransform = transform;
    
//    CGAffineTransform transform = CGAffineTransformIdentity;
//    transform = CGAffineTransformScale(transform, 0.5, 0.5);
//
//    transform = CGAffineTransformRotate(transform, M_PI / 180.0 * 30);
//    transform = CGAffineTransformTranslate(transform, 200, 0);
//
//    view1.layer.affineTransform = transform;
    view1.layer.affineTransform = CGAffineTransformMakeShear(1, 0);
    
}


@end
