//
//  HLPopupWindowManager.h
//  KPPPOP
//
//  Created by 邹奂霖 on 2020/6/4.
//  Copyright © 2020 xinhuamm. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class HLPopupContainerWindow;
NS_ASSUME_NONNULL_BEGIN

@interface HLPopupWindowManager : NSObject
@property (nonatomic, strong, nullable) HLPopupContainerWindow *popupContainerWindow;
@end

NS_ASSUME_NONNULL_END
