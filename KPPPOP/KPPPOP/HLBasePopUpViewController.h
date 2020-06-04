//
//  HLBasePopUpViewController.h
//  KPPPOP
//
//  Created by 邹奂霖 on 2020/6/4.
//  Copyright © 2020 xinhuamm. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HLPopItem.h"
@class HLEasing;
NS_ASSUME_NONNULL_BEGIN

@interface HLBasePopUpViewController : UIViewController
- (void)configurePopupItem:(HLPopItem *)popItem;
- (void)makePopupViewWithItem:(HLPopItem *)popItem;
- (void)replacePopupViewWithItem:(HLPopItem *)popItem;
- (void)showPopupViewWithDuration:(NSTimeInterval)duration Curve:(HLEasing *)easing DelayFactor:(CGFloat)delayFactor;
- (void)transformPopupViewWithDuration:(NSTimeInterval)duration Curve:(HLEasing *)easing DelayFactor:(CGFloat)delayFactor;
- (void)dismissPopupViewWithDuration:(NSTimeInterval)duration
                               Curve:(HLEasing *)easing
                         DelayFactor:(CGFloat)delayFactor
                           Direction:(HLPopUpViewDirection)direction
                          Completion:(void(^)(UIViewAnimatingPosition *position))completionBlock;

@end

NS_ASSUME_NONNULL_END
