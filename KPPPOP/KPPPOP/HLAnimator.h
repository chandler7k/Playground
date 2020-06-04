//
//  HLAnimator.h
//  KPPPOP
//
//  Created by 邹奂霖 on 2020/6/4.
//  Copyright © 2020 xinhuamm. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HLEasing;
NS_ASSUME_NONNULL_BEGIN

@interface HLAnimator : UIViewPropertyAnimator
- (instancetype)initWithDuration:(NSTimeInterval)duration Easing:(HLEasing *)easing;
@end

@interface HLEasing : UICubicTimingParameters
- (instancetype)initWithC1x:(CGFloat)c1x C1y:(CGFloat)c1y C2x:(CGFloat)c2x C2y:(CGFloat)c2y;
@property(class,nonatomic,readonly) HLEasing *linear;
@property(class,nonatomic,readonly) HLEasing *easeIn;
@property(class,nonatomic,readonly) HLEasing *easeOut;
@property(class,nonatomic,readonly) HLEasing *easeInOut;
//@property(class,nonatomic,readonly) HLEasing *easeInSine;
//@property(class,nonatomic,readonly) HLEasing *easeOutSine;
//@property(class,nonatomic,readonly) HLEasing *easeInOutSine;
//@property(class,nonatomic,readonly) HLEasing *easeInQuad;
//@property(class,nonatomic,readonly) HLEasing *easeOutQuad;
//@property(class,nonatomic,readonly) HLEasing *easeInOutQuad;
//@property(class,nonatomic,readonly) HLEasing *easeInCubic;
//@property(class,nonatomic,readonly) HLEasing *easeOutCubic;
//@property(class,nonatomic,readonly) HLEasing *easeInOutCubic;
//@property(class,nonatomic,readonly) HLEasing *easeInQuart;
//@property(class,nonatomic,readonly) HLEasing *easeOutQuart;
//@property(class,nonatomic,readonly) HLEasing *easeInOutQuart;
//@property(class,nonatomic,readonly) HLEasing *easeInQuint;
//@property(class,nonatomic,readonly) HLEasing *easeOutQuint;
//@property(class,nonatomic,readonly) HLEasing *easeInOutQuint;
//@property(class,nonatomic,readonly) HLEasing *easeInExpo;
//@property(class,nonatomic,readonly) HLEasing *easeOutExpo;
//@property(class,nonatomic,readonly) HLEasing *easeInOutExpo;
//@property(class,nonatomic,readonly) HLEasing *easeInCirc;
//@property(class,nonatomic,readonly) HLEasing *easeOutCirc;
//@property(class,nonatomic,readonly) HLEasing *easeInOutCirc;
//@property(class,nonatomic,readonly) HLEasing *easeInBack;
//@property(class,nonatomic,readonly) HLEasing *easeOutBack;
//@property(class,nonatomic,readonly) HLEasing *easeInOutBack;

@end

NS_ASSUME_NONNULL_END
