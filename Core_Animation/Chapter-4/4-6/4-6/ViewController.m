//
//  ViewController.m
//  4-6
//
//  Created by zouhuanlin on 2019/2/18.
//  Copyright © 2019 zouhuanlin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
- (UIButton *)customButton
{
    CGRect frame = CGRectMake(0, 0, 150, 150);
    UIButton *button = [[UIButton alloc] initWithFrame:frame];
    button.backgroundColor = UIColor.whiteColor;
    button.layer.cornerRadius = 10;
    
    frame = CGRectMake(20, 10, 110, 30);
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.text = @"hello world";
    label.textAlignment = NSTextAlignmentCenter;
    [button addSubview:label];
    return  button;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = UIColor.lightGrayColor;
    UIButton *button1 = [self customButton];
    button1.center = CGPointMake(50, 150);
    [self.view addSubview:button1];
    
    UIButton *button2 = [self customButton];
    button2.center = CGPointMake(250, 150);
    button2.alpha = 0.5;
    [self.view addSubview:button2];
    
    button2.layer.shouldRasterize = YES;
    button2.layer.rasterizationScale = [UIScreen mainScreen].scale;
    
}


@end
