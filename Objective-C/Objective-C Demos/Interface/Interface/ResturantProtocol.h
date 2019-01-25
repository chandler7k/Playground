//
//  ResturantProtocol.h
//  Interface
//
//  Created by zouhuanlin on 2019/1/25.
//  Copyright © 2019 zouhuanlin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ResturantProtocol <NSObject>
- (void)placeOnlineOrder;
- (void)placeWalkInCustomerOrder;
- (void)placePhoneOrder;

- (void)payOnline;
- (void)payInPerson;
@end

NS_ASSUME_NONNULL_END
