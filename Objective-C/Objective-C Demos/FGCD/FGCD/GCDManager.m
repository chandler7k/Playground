//
//  GCDManager.m
//  FGCD
//
//  Created by chandler7k on 2019/3/27.
//  Copyright © 2019 chandler7k. All rights reserved.
//

#import "GCDManager.h"
@implementation GCDManager
+ (instancetype)sharedManager
{
    static id instance;
    
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}
@end
