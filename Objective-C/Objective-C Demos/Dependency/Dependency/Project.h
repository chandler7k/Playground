//
//  Project.h
//  Dependency
//
//  Created by zouhuanlin on 2019/1/25.
//  Copyright © 2019 zouhuanlin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DeveloperProtocol.h"
NS_ASSUME_NONNULL_BEGIN

@interface Project : NSObject

- (instancetype)initWithDeveloper: (NSArray <id <DeveloperProtocol>> *)developers;
- (void)startDeveloping;

@end

NS_ASSUME_NONNULL_END
