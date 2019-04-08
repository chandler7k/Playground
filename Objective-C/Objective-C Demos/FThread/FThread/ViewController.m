//
//  ViewController.m
//  FThread
//
//  Created by chandler7k on 2019/4/8.
//  Copyright © 2019 chandler7k. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self  fthred];
    [self threadChange];
}

- (void)fthred
{
    NSThread *runloopthread = [[NSThread alloc] initWithTarget:self selector:@selector(entryThreadPoint) object:nil];
    [runloopthread start];
    [self performSelector:@selector(handlemutiData) onThread:runloopthread withObject:nil waitUntilDone:YES];
    
}

- (void)entryThreadPoint
{
    @autoreleasepool {
        [NSThread currentThread].name = @"自定义线程名字";
        NSRunLoop *runloop = [NSRunLoop currentRunLoop];
        [runloop addPort:[NSPort port] forMode:NSDefaultRunLoopMode];
        [runloop run];
    }
    
}

- (void)handlemutiData
{
    NSLog(@"我是泡在runloop的线程");
}

- (void)threadChange
{
    dispatch_queue_t custome_queue = dispatch_queue_create("concurrentQueue", DISPATCH_QUEUE_CONCURRENT);
    for(int i = 0;i<10;i++){
        dispatch_async(custome_queue, ^{
            NSLog(@"并行队列%d",i);
            dispatch_async(dispatch_get_main_queue(), ^{
                NSLog(@"我在主线程上");
            });
        });
    }
}


@end
