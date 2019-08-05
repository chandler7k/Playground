//
//  ViewController.m
//  ObjcSynchronize
//
//  Created by 邹奂霖 on 2019/8/2.
//  Copyright © 2019 邹奂霖. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic, strong) NSMutableArray *testArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.testArray = @[].mutableCopy;
    for(NSUInteger i = 0; i<5000;i++){
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            self.testArray = [[NSMutableArray alloc] init];
        });
    }
}

- (void)testThreadArray{
    @synchronized (self.testArray) {
        self.testArray = @[].mutableCopy;
    }
}


@end
