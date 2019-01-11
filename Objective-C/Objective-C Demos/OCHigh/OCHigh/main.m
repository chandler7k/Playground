//
//  main.m
//  OCHigh
//
//  Created by ChandlerZou on 2018/10/7.
//  Copyright © 2018 zouhuanlin. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        dispatch_queue_t myConcurrentDispatchQueue = dispatch_queue_create("com.example.gcd.MyConcurrentDispatch", DISPATCH_QUEUE_CONCURRENT);
        dispatch_async(myConcurrentDispatchQueue, ^{
            NSLog(@"Block on my concurrentDIspatchQueue");
        });

        dispatch_queue_t mainDispatchQueue = dispatch_get_main_queue();
        dispatch_queue_t globalDispatchQueueHigh = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0);
        dispatch_set_target_queue(myConcurrentDispatchQueue, globalDispatchQueueHigh);
        
        dispatch_time_t time = dispatch_time(DISPATCH_TIME_NOW, 3 * NSEC_PER_SEC);
        dispatch_after(time, dispatch_get_main_queue(), ^{
            NSLog(@"waited at least 3 seconds");
        });

        dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
        dispatch_group_t group = dispatch_group_create();

        dispatch_group_async(group, queue, ^{
            NSLog(@"block0");
        });
        dispatch_group_async(group, queue, ^{
            NSLog(@"block1");
        });
        dispatch_group_async(group, queue, ^{
            NSLog(@"block2");
        });
        dispatch_group_notify(group, dispatch_get_main_queue(), ^{
            NSLog(@"done");
        });
        
        dispatch_queue_t queue = dispatch_queue_create("com.example.gcd.forbarrier", DISPATCH_QUEUE_CONCURRENT);
        
        dispatch_async(queue, ^{NSLog(@"0 reading");});
        dispatch_async(queue, ^{NSLog(@"1 reading");});
        dispatch_async(queue, ^{NSLog(@"2 reading");});
//        dispatch_async(queue, ^{NSLog(@"3 reading");});
        dispatch_barrier_async(queue, ^{NSLog(@"3 writing");});
        dispatch_async(queue, ^{NSLog(@"4 reading");});
        dispatch_async(queue, ^{NSLog(@"5 reading");});
        dispatch_async(queue, ^{NSLog(@"6 reading");});
        dispatch_apply(10, queue, ^(size_t index) {
            NSLog(@"%zu",index);
        });
        
        
        
        
        
        
        
//        dispatch_release(group);
        
//        dispatch_release(myConcurrentDispatchQueue);
    }
    return 0;
}
