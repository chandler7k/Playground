//
//  Person+BaseInfo.m
//  FGCD
//
//  Created by chandler7k on 2019/4/1.
//  Copyright © 2019 chandler7k. All rights reserved.
//

#import "Person+BaseInfo.h"

@implementation Person (BaseInfo)
- (void)setName:(NSString *)name
{
    objc_setAssociatedObject(self, @selector(name), name, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString *)name
{
    return objc_getAssociatedObject(self, @selector(name));
}
@end
