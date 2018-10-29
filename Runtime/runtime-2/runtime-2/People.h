//
//  People.h
//  runtime-2
//
//  Created by ChandlerZou on 2018/10/29.
//  Copyright © 2018 zouhuanlin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface People : NSObject
{
    NSString *_occupation;
    NSString *_nationality;
}
@property (nonatomic, copy) NSString *name;
@property (nonatomic) NSUInteger age;
- (NSDictionary *)allProperties;
- (NSDictionary *)allIvars;
- (NSDictionary *)allMethods;

@end

NS_ASSUME_NONNULL_END
