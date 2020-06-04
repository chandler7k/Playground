//
//  HLPopupContainerView.m
//  KPPPOP
//
//  Created by 邹奂霖 on 2020/6/4.
//  Copyright © 2020 xinhuamm. All rights reserved.
//

#import "HLPopupContainerView.h"

@implementation HLPopupContainerView

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    id view = [super hitTest:point withEvent:event];
    if (view) {
        if (self.isAbleToTouchLower && view == self) {
            return nil;
        }
        return view;
    }
    return nil;
}

@end
