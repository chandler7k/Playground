//
//  ViewController.m
//  4-1.2
//
//  Created by zouhuanlin on 2019/1/31.
//  Copyright © 2019 zouhuanlin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *layerView1;
@property (weak, nonatomic) IBOutlet UIView *layerView2;
@property (weak, nonatomic) IBOutlet UIView *shadowView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.shadowView.backgroundColor = UIColor.clearColor;
    self.layerView1.layer.cornerRadius = 20.0;
    self.layerView2.layer.cornerRadius = 20.0;
    
    self.layerView1.layer.borderWidth = 5.0;
    self.layerView2.layer.borderWidth = 5.0;
    
    self.layerView1.layer.shadowOpacity = 0.5;
    self.layerView1.layer.shadowOffset = CGSizeMake(0, 0.5);
    self.layerView1.layer.shadowRadius = 5.0;
    
    self.shadowView.layer.shadowOpacity = 0.5;
    self.shadowView.layer.shadowOffset = CGSizeMake(0, 0.5);
    self.shadowView.layer.shadowRadius = 30;
    
    self.layerView2.layer.masksToBounds = YES;
}


@end
