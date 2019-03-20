//
//  Statics.m
//  FKVC
//
//  Created by zouhuanlin on 2019/3/20.
//  Copyright © 2019 zouhuanlin. All rights reserved.
//

#import "Statics.h"

@implementation Statics
- (instancetype)initWithDictionary: (NSDictionary *)object
{
    self = [super init];
    if(self){
//        self.count = [[object objectForKey:@"count"] integerValue];
//        self.sum = [[object objectForKey:@"sum"] doubleValue];
//        self.average = [[object objectForKey:@"average"] doubleValue];
        [self setValuesForKeysWithDictionary:object];
    }
    return self;
}

@end
