//
//  ViewController.m
//  5-2-3
//
//  Created by zouhuanlin on 2019/2/18.
//  Copyright © 2019 zouhuanlin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *outerView;
@property (weak, nonatomic) IBOutlet UIView *innerView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    CATransform3D outer = CATransform3DMakeRotation(M_PI_4, 0, 0, 1);
//    self.outerView.layer.transform = outer;
//    CATransform3D inner = CATransform3DMakeRotation(-M_PI_4, 0, 0, 1);
//    self.innerView.layer.transform = inner;
    CATransform3D outer = CATransform3DIdentity;
    outer.m34 = -1.0 / 500.0;
    outer = CATransform3DRotate(outer, M_PI_4, 0, 1, 0);
    self.outerView.layer.transform = outer;
    
    CATransform3D inner = CATransform3DIdentity;
    inner.m34 = -1.0 / 500;
    inner = CATransform3DRotate(inner, -M_PI_4, 0, 1, 0);
    self.innerView.layer.transform = inner;
}


@end
