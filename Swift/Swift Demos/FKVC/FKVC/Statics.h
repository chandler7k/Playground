//
//  Statics.h
//  FKVC
//
//  Created by zouhuanlin on 2019/3/20.
//  Copyright © 2019 zouhuanlin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Statics : NSObject
@property (nonatomic) int count;
@property (nonatomic) double sum;
@property (nonatomic) double average;
- (instancetype)initWithDictionary: (NSDictionary *)object;
@end

NS_ASSUME_NONNULL_END
