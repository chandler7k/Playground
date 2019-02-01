//
//  ViewController.m
//  4-4
//
//  Created by zouhuanlin on 2019/1/31.
//  Copyright © 2019 zouhuanlin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    CALayer *masklayer = [CALayer layer];
    masklayer.frame = self.imageView.bounds;
    UIImage *maskImage = [UIImage imageNamed:@"Cone.png"];
    masklayer.contents = (__bridge id _Nullable)(maskImage.CGImage);
    
    
    self.imageView.layer.mask = masklayer;
}


@end
