//
//  ViewController.m
//  03
//
//  Created by zouhuanlin on 2019/1/18.
//  Copyright © 2019 zouhuanlin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) UIView *greenView;
@property (nonatomic, strong) UIView *redView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view addSubview:self.greenView];
    [self.view addSubview:self.redView];
    
    self.greenView.layer.zPosition = 1.0;
}

- (UIView *)greenView
{
    if (!_greenView) {
        _greenView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
        _greenView.backgroundColor = [UIColor greenColor];
    }
    return _greenView;
}

- (UIView *)redView
{
    if (!_redView) {
        _redView = [[UIView alloc] initWithFrame:CGRectMake(150, 150, 100, 100)];
        _greenView.backgroundColor = [UIColor redColor];
    }
    return _redView;
}

@end
