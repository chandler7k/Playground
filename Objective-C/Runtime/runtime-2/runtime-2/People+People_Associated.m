//
//  People+People_Associated.m
//  runtime-2
//
//  Created by ChandlerZou on 2018/10/29.
//  Copyright © 2018 zouhuanlin. All rights reserved.
//

#import "People+People_Associated.h"
#import <objc/runtime.h>
#import <objc/message.h>
@implementation People (People_Associated)
- (void)setAssociateBust:(NSNumber *)associateBust
{
    objc_setAssociatedObject(self, @selector(associateBust), associateBust, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (NSNumber *)associateBust
{
    return objc_getAssociatedObject(self, @selector(associateBust));
}
- (void)setAssociateCallBack:(CodingCallBack)associateCallBack
{
    objc_setAssociatedObject(self, @selector(associateCallBack), associateCallBack, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (CodingCallBack)associateCallBack
{
    return objc_getAssociatedObject(self, @selector(associateCallBack));
}
@end
