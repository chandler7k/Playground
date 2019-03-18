//
//  Child.m
//  CategoryTest
//
//  Created by chandler7k on 2019/3/13.
//  Copyright © 2019 chandler7k. All rights reserved.
//

#import "Child.h"

@implementation Child
//+(void)load
//{
//    NSLog(@"%@, %s", [self class], __FUNCTION__);
//}
+(void)initialize
{
    NSLog(@"%@, %s", [self class], __FUNCTION__);
}

//- (instancetype)init
//{
//    self = [super init];
//    if (self) {
//        NSLog(@"super ")
//    }
//    return self;
//}

- (void)run
{
    [super run];
    NSLog(@"child run");
}
@end
