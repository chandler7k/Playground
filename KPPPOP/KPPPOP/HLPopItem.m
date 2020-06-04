//
//  HLPopItem.m
//  KPPPOP
//
//  Created by 邹奂霖 on 2020/6/4.
//  Copyright © 2020 xinhuamm. All rights reserved.
//

#import "HLPopItem.h"

@implementation HLPopItem
- (instancetype)initWithView:(UIView *)view
                      Height:(CGFloat)height
                    MaxWidth:(CGFloat)maxWidth
               LandscapeSize:(CGSize)landscapeSize
                 PopupOption:(HLPopOption *)popupOption{
    self = [super init];
    if (self) {
        _view = view;
        _height = height;
        _maxWidth = maxWidth;
        _landscapeSize = landscapeSize;
        _popupOption = popupOption;
    }
    return self;
}
@end


@implementation HLPopOption
- (instancetype)initWithShape:(HLShape *)shape
                     ViewType:(HLViewType)viewType
                    Direction:(HLPopUpViewDirection)direction
                       Margin:(CGFloat)margin
                      HasBlur:(BOOL)hasBlur
                     Duration:(NSTimeInterval)duration
                       Easing:(HLEasing *)easing
                CanTapDismiss:(BOOL)canTapDismiss{
    self = [super init];
    if (self) {
        _shape = shape;
        _viewType = viewType;
        _direction = direction;
        _margin = margin;
        _hasBlur = hasBlur;
        _duration = duration;
        _easing = easing;
        _canTapDismiss = canTapDismiss;
    }
    return self;
}

@end

@implementation HLShape

@end
