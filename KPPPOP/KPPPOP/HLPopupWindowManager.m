//
//  HLPopupWindowManager.m
//  KPPPOP
//
//  Created by 邹奂霖 on 2020/6/4.
//  Copyright © 2020 xinhuamm. All rights reserved.
//

#import "HLPopupWindowManager.h"
#import "HLPopupContainerWindow.h"
#import "UIWindow+HLKeyWindow.h"
@implementation HLPopupWindowManager
+ (instancetype)shared {
    static dispatch_once_t onceToken;
    static HLPopupWindowManager *instance = nil;
    dispatch_once(&onceToken,^{
        instance = [[super allocWithZone:NULL] init];
    });
    return instance;
}

+ (id)allocWithZone:(struct _NSZone *)zone{
    return [self shared];
}

- (void)changeKeyWindowWithRootViewController:(UIViewController *)rootViewController{
    if (!rootViewController) {
        self.popupContainerWindow.rootViewController = nil;
        self.popupContainerWindow = nil;
        if (@available(iOS 13.0, *)) {
            [[UIWindow HLKeyWindow] makeKeyAndVisible];
        }else{
            [[UIApplication sharedApplication].keyWindow makeKeyAndVisible];
        }
    }else{
        self.popupContainerWindow = [[HLPopupContainerWindow alloc] init];
//        if (![rootViewController isKindOfClass:[XWMBasePopUpViewController class]]) {
//            return ;
//        }
        self.popupContainerWindow.frame = [UIScreen mainScreen].bounds;
        self.popupContainerWindow.backgroundColor = UIColor.clearColor;
        self.popupContainerWindow.windowLevel = UIWindowLevelStatusBar +1;
        self.popupContainerWindow.rootViewController = rootViewController;
        [self.popupContainerWindow makeKeyAndVisible];
        
    }
    
}
@end
