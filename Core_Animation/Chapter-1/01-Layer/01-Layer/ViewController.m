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
    CALayer *blueLayer = [CALayer layer];
    blueLayer.frame = CGRectMake(50, 50, 100, 100);
    blueLayer.backgroundColor = [UIColor blueColor].CGColor;
    [self.layerView.layer addSublayer:blueLayer];
    
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


@end
