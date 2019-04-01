//
//  ViewController.m
//  FGCD
//
//  Created by chandler7k on 2019/3/27.
//  Copyright © 2019 chandler7k. All rights reserved.
//

#import "ViewController.h"
#import "Person+BaseInfo.h"
#import <objc/runtime.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    dispatch_queue_t q = dispatch_queue_create("test", DISPATCH_QUEUE_SERIAL);
//    for(int i= 0;i < 10;i++){
//        dispatch_async(q, ^{
//            NSLog(@"%@ -- %d", [NSThread currentThread],i);
//        });
//    }
    
    dispatch_queue_t qa = dispatch_queue_create("test", DISPATCH_QUEUE_CONCURRENT);
    for(int i = 0 ; i< 5;i++){
        dispatch_async(qa, ^{
            NSLog(@"%@ -- %d",[NSThread currentThread], i);
        });
    }
    dispatch_barrier_async(qa, ^{
        NSLog(@"yaha");
    });
    for(int i = 5 ; i< 10;i++){
        dispatch_async(qa, ^{
            NSLog(@"%@ -- %d",[NSThread currentThread], i);
        });
    }
    
    dispatch_queue_t mainqueue = dispatch_get_main_queue();
    dispatch_queue_t globalQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_time_t time = dispatch_time(DISPATCH_TIME_NOW, 3ull *NSEC_PER_SEC);
    dispatch_after(time, dispatch_get_main_queue(), ^{
        NSLog(@"wait 3 sec");
    });
    
    dispatch_group_t group = dispatch_group_create();
    dispatch_group_async(group, globalQueue, ^{
        NSLog(@"blck0");
    });
    dispatch_group_async(group, globalQueue, ^{
        NSLog(@"blck1");
    });
    dispatch_group_async(group, globalQueue, ^{
        NSLog(@"blck2");
    });
    
//    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
//        NSLog(@"done");
//    });
    dispatch_time_t timewait = dispatch_time(DISPATCH_TIME_NOW, 1ull * NSEC_PER_SEC);
    
    long result = dispatch_group_wait(group, timewait);
    if(result == 0){
        NSLog(@"done");
    }else{
        NSLog(@"not Done");
    }
    
    dispatch_barrier_async(globalQueue, ^{
        NSLog(@"hello");
    });
    
    dispatch_queue_t applyqueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_apply(10, applyqueue, ^(size_t index) {
        NSLog(@"%zu", index);
    });
    NSLog(@"done");
    
    dispatch_queue_t semqueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(1);
    NSMutableArray *array = [[NSMutableArray alloc] init];
    for(int i = 0;i < 1000;i ++){
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
        [array addObject:[NSNumber numberWithInt:i]];
        
        dispatch_semaphore_signal(semaphore);
        
    }
    NSLog(@"%@",array);
    
    NSOperationQueue *operationQueue = [[NSOperationQueue alloc] init];
    operationQueue.maxConcurrentOperationCount = 3;
    
    NSBlockOperation *op1 = [NSBlockOperation blockOperationWithBlock:^{
        if(op1.isCancelled){
            NSLog(@"cancel1");
        }
        NSLog(@"1");
        if(op1.isCancelled){
            NSLog(@"cancel2");
        }
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            NSLog(@"2");
        }];
    }];
    
    
    NSInvocationOperation *invoOperation = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(invomethod) object:nil];
    [invoOperation addDependency:op1];
    
    [op1 setCompletionBlock:^{
        NSLog(@"op1 done");
    }];
    [operationQueue addOperation:op1];
    [operationQueue addOperation:invoOperation];
    
    [self useBlockOperationAddExecutionBlock];
    
    NSLog(@"==============================");
    [self logPersonInfo];
    NSLog(@"==============================");
}

- (void)invomethod
{
    NSLog(@"invomethod run");
}

/**
 * 使用子类 NSBlockOperation
 * 调用方法 AddExecutionBlock:
 */
- (void)useBlockOperationAddExecutionBlock {
    
    // 1.创建 NSBlockOperation 对象
    NSBlockOperation *op = [NSBlockOperation blockOperationWithBlock:^{
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2]; // 模拟耗时操作
            NSLog(@"1---%@", [NSThread currentThread]); // 打印当前线程
        }
    }];
    
    // 2.添加额外的操作
    [op addExecutionBlock:^{
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2]; // 模拟耗时操作
            NSLog(@"2---%@", [NSThread currentThread]); // 打印当前线程
        }
    }];
    [op addExecutionBlock:^{
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2]; // 模拟耗时操作
            NSLog(@"3---%@", [NSThread currentThread]); // 打印当前线程
        }
    }];
    [op addExecutionBlock:^{
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2]; // 模拟耗时操作
            NSLog(@"4---%@", [NSThread currentThread]); // 打印当前线程
        }
    }];
    [op addExecutionBlock:^{
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2]; // 模拟耗时操作
            NSLog(@"5---%@", [NSThread currentThread]); // 打印当前线程
        }
    }];
    [op addExecutionBlock:^{
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2]; // 模拟耗时操作
            NSLog(@"6---%@", [NSThread currentThread]); // 打印当前线程
        }
    }];
    [op addExecutionBlock:^{
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2]; // 模拟耗时操作
            NSLog(@"7---%@", [NSThread currentThread]); // 打印当前线程
        }
    }];
    [op addExecutionBlock:^{
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2]; // 模拟耗时操作
            NSLog(@"8---%@", [NSThread currentThread]); // 打印当前线程
        }
    }];
    
    // 3.调用 start 方法开始执行操作
    [op start];
}


- (void)logPersonInfo
{
    Person *p1 = [[Person alloc] init];
    p1.name = @"xiaoming";
    NSLog(@"%@",p1.name);
}
@end
