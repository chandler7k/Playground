//
//  FBClass.h
//  FuckBlock
//
//  Created by zouhuanlin on 2019/3/19.
//  Copyright © 2019 zouhuanlin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
typedef int(^Myblock)(int);
@interface FBClass : NSObject
@property (nonatomic, copy) NSArray *array;
@property (nonatomic, copy) Myblock blockOne;
@end

NS_ASSUME_NONNULL_END
