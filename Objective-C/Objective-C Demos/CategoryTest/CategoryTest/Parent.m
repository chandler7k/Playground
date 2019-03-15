//
//  Parent.m
//  CategoryTest
//
//  Created by chandler7k on 2019/3/13.
//  Copyright © 2019 chandler7k. All rights reserved.
//

#import "Parent.h"

@implementation Parent
//+(void)load
//{
//    NSLog(@"%@, %s", [self class], __FUNCTION__);
//}
+(void)initialize
{
    NSLog(@"%@, %s", [self class], __FUNCTION__);
}
- (void)run
{
    NSLog(@"parent run %@", [self class]);
}

@end
