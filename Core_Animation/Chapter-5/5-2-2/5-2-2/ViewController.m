//
//  ViewController.m
//  5-2-2
//
//  Created by zouhuanlin on 2019/2/18.
//  Copyright © 2019 zouhuanlin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (weak, nonatomic) IBOutlet UIView *layerView1;
@property (weak, nonatomic) IBOutlet UIView *layerView2;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    CATransform3D perspective = CATransform3DIdentity;
    perspective.m34 = -1.0 / 500;
    self.containerView.layer.sublayerTransform = perspective;
    
    CATransform3D tranform1 = CATransform3DMakeRotation(M_PI_4, 0, 1, 0);
    self.layerView1.layer.transform = tranform1;
    
    CATransform3D tranform2 = CATransform3DMakeRotation(-M_PI_4, 0, 1, 0);
    self.layerView2.layer.transform = tranform2;
    
    
}


@end
