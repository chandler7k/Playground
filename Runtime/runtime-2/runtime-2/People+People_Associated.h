//
//  People+People_Associated.h
//  runtime-2
//
//  Created by ChandlerZou on 2018/10/29.
//  Copyright © 2018 zouhuanlin. All rights reserved.
//

#import "People.h"

NS_ASSUME_NONNULL_BEGIN
typedef void (^CodingCallBack)();
@interface People (People_Associated)
@property (nonatomic, strong) NSNumber *associateBust;
@property (nonatomic, copy) CodingCallBack associateCallBack;
@end

NS_ASSUME_NONNULL_END
