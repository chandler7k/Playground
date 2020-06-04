//
//  HLAnimator.m
//  KPPPOP
//
//  Created by 邹奂霖 on 2020/6/4.
//  Copyright © 2020 xinhuamm. All rights reserved.
//

#import "HLAnimator.h"

@implementation HLAnimator
- (instancetype)initWithDuration:(NSTimeInterval)duration Easing:(HLEasing *)easing{
    return [super initWithDuration:duration timingParameters:easing];
}
@end

@implementation HLEasing

- (instancetype)initWithC1x:(CGFloat)c1x C1y:(CGFloat)c1y C2x:(CGFloat)c2x C2y:(CGFloat)c2y{
    return [super initWithControlPoint1:CGPointMake(c1x, c1y) controlPoint2:CGPointMake(c2x, c2y)];
}

+ (HLEasing *)linear{
    return [[HLEasing alloc] initWithAnimationCurve:UIViewAnimationCurveLinear];
}

+ (HLEasing *)easeIn{
    return [[HLEasing alloc] initWithAnimationCurve:UIViewAnimationCurveEaseIn];
}

+ (HLEasing *)easeOut{
    return [[HLEasing alloc] initWithAnimationCurve:UIViewAnimationCurveEaseOut];
}

+ (HLEasing *)easeInOut{
    return [[HLEasing alloc] initWithAnimationCurve:UIViewAnimationCurveEaseInOut];
}

+ (HLEasing *)easeInSine{
    return [[HLEasing alloc] initWithC1x:0.47 C1y:0 C2x:0.745 C2y:0.715];
}
@end
