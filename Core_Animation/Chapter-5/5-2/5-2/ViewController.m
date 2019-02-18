//
//  ViewController.m
//  5-2
//
//  Created by zouhuanlin on 2019/2/18.
//  Copyright © 2019 zouhuanlin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIView *layerView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [self.view addSubview:layerView];
    layerView.backgroundColor = [UIColor lightGrayColor];
    
    
    
    CATransform3D transform = CATransform3DIdentity;
    transform.m34 = -1.0 / 500.0;
    transform = CATransform3DRotate(transform, M_PI_4, 0, 1, 0);
    layerView.layer.transform = transform;
}


@end
