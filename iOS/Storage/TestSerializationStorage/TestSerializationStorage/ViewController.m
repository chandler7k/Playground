//
//  ViewController.m
//  TestSerializationStorage
//
//  Created by 邹奂霖 on 2020/5/28.
//  Copyright © 2020 xinhuamm. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self test];
}

- (void)test{
    NSString *homePath = NSHomeDirectory();
    NSLog(homePath);
    NSMutableArray *mutable = [@[@1,@2,@3,@4] mutableCopy];
    [mutable writeToFile:@"" atomically:YES];
}


@end
