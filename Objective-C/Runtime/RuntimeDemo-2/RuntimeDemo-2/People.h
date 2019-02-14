//
//  People.h
//  RuntimeDemo-2
//
//  Created by zouhuanlin on 2019/2/14.
//  Copyright © 2019 zouhuanlin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface People : NSObject
{
    NSString *_occupation;
    NSString *_notionality;
}

@property (nonatomic, copy) NSString *name;
@property (nonatomic) NSUInteger age;

- (NSDictionary *)allProperties;
- (NSDictionary *)allIvars;
- (NSDictionary *)allMethods;

@end

NS_ASSUME_NONNULL_END
