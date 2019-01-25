//
//  Project.m
//  Dependency
//
//  Created by zouhuanlin on 2019/1/25.
//  Copyright © 2019 zouhuanlin. All rights reserved.
//

#import "Project.h"

@implementation Project
{
    NSArray <id<DeveloperProtocol>>* _developers;
}
- (instancetype)initWithDeveloper:(NSArray<id<DeveloperProtocol>> *)developers
{
    self = [super init];
    if(self){
        _developers = developers;
    }
    return self;
}

- (void)startDeveloping
{
    [_developers enumerateObjectsUsingBlock:^(id<DeveloperProtocol>  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj writeCode];
    }];
}
@end
