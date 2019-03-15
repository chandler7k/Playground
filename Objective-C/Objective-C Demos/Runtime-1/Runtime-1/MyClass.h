//
//  MyClass.h
//  Runtime-1
//
//  Created by chandler7k on 2019/3/11.
//  Copyright © 2019 chandler7k. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyClass : NSObject
@property (nonatomic, strong) NSArray *array;
@property (nonatomic, copy) NSString *string;
- (void)method1;
- (void)method2;
+ (void)classMethod1;
@end

NS_ASSUME_NONNULL_END
