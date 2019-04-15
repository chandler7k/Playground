//
//  ViewController.m
//  FTimer
//
//  Created by chandler7k on 2019/4/14.
//  Copyright © 2019 chandler7k. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) UIButton *btn;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    self.btn.backgroundColor = UIColor.redColor;
    [self.btn addTarget:self action:@selector(btnaction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.btn];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(mylog) userInfo:nil repeats:YES];
    
}

- (void)mylog
{
//    NSLog(@"timer log");
}

- (void)btnaction
{
    if(self.timer.isValid){
        [self.timer invalidate];
        self.timer = nil;
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)dealloc
{
    NSLog(@"dealloc : %@", [self class]);
}


@end
