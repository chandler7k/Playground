//
//  LoadTestObject+Test.m
//  loadtest
//
//  Created by 邹奂霖 on 2020/1/5.
//  Copyright © 2020 xinhuamm. All rights reserved.
//

#import "LoadTestObject+Test.h"

#import <AppKit/AppKit.h>


@implementation LoadTestObjectOBJ
+ (void)load{
    [LoadTestObject swiftLoad];
}
+ (void)initialize
{
    [LoadTestObject swiftinit];
}
@end
