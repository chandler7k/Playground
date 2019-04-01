//
//  Person+BaseInfo.h
//  FGCD
//
//  Created by chandler7k on 2019/4/1.
//  Copyright © 2019 chandler7k. All rights reserved.
//

#import "Person.h"
#import <objc/runtime.h>
NS_ASSUME_NONNULL_BEGIN

@interface Person (BaseInfo)
@property (nonatomic, strong) NSString *name;
@end

NS_ASSUME_NONNULL_END
