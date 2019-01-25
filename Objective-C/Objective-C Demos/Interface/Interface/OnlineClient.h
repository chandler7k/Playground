//
//  OnlineClient.h
//  Interface
//
//  Created by zouhuanlin on 2019/1/25.
//  Copyright © 2019 zouhuanlin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ResturantProtocol.h"
#import "RestaurantPaymentProtocol.h"
#import "RestaurantPlaceOrderProtocol.h"
NS_ASSUME_NONNULL_BEGIN

@interface OnlineClient : NSObject<RestaurantPaymentProtocol, RestaurantPlaceOrderProtocol>

@end

NS_ASSUME_NONNULL_END
