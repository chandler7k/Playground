//
//  main.m
//  FuckBlock
//
//  Created by zouhuanlin on 2019/3/19.
//  Copyright © 2019 zouhuanlin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FBClass.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
//        NSLog(@"Hello, World!");
        void(^MyBlockOne)(void) = ^(void){
            NSLog(@"fuck block");
        };
        MyBlockOne();
        FBClass *fb = [[FBClass alloc] init];
        NSArray *arr = @[@1,@3];
        NSMutableArray *mutableArr = [NSMutableArray arrayWithArray:arr];
        
        fb.array = mutableArr;
        fb.blockOne = ^(int a){
            return a + 10;
        };
        NSLog(@"%d", fb.blockOne(10));
        
        
        [mutableArr removeAllObjects];
        NSLog(@"%@", fb.array);
        void(^myblock1)(void) = ^(void){
            NSLog(@"block1");
        };
        myblock1();
        
        
        
        int(^myblock1ret2pra)(int ,int) = ^(int a, int b){
            return a+b;
        };
        NSLog(@"%d", myblock1ret2pra(1,2));
        
        int(^myblockOnlyReturn)(void) = ^(void){
            return 46;
        };
        
        myblockOnlyReturn();
        
        __block
        int a = 10;
        void(^mycapBlock)(void) = ^(void){
            NSLog(@" cap %d", a);
        };
        
        a = 12;
        mycapBlock();
        
        
        
    }
    return 0;
}
