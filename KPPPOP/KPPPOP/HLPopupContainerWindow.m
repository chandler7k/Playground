//
//  HLPopupContainerWindow.m
//  KPPPOP
//
//  Created by 邹奂霖 on 2020/6/4.
//  Copyright © 2020 xinhuamm. All rights reserved.
//

#import "HLPopupContainerWindow.h"

@implementation HLPopupContainerWindow
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    id view = [super hitTest:point withEvent:event];
    if (view && view != self) {
        return view;
    }
    return nil;
}
@end
