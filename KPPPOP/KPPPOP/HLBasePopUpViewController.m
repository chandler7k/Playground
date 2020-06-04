//
//  HLBasePopUpViewController.m
//  KPPPOP
//
//  Created by 邹奂霖 on 2020/6/4.
//  Copyright © 2020 xinhuamm. All rights reserved.
//

#import "HLBasePopUpViewController.h"
#import "HLPopItem.h"
#import "HLPopupContainerView.h"
@interface HLBasePopUpViewController ()
@property (nonatomic, strong) HLPopItem *item;
@property(nonatomic, assign) BOOL isShowPopupView;
@property(nonatomic, assign) BOOL isOrientationDidChange;
@property (nonatomic, strong) HLPopupContainerView *blurSpaceView;
@property (nonatomic, assign) UIEdgeInsets safeAreaInsets;
@property(nonatomic, assign) BOOL canTapDismiss;
@end

@implementation HLBasePopUpViewController

- (void)loadView {
    [super loadView];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator{
    
}

- (void)configureBlurSpaceView{
    
}

- (void)configurePopupContainerView{
    
}

- (UIEdgeInsets)safeAreaInsets{
    if (@available(iOS 11.0, *)) {
        return self.view.safeAreaInsets;
    } else {
        return UIEdgeInsetsZero;
    }
}

- (BOOL)canTapDismiss{
    if (self.item.popupOption) {
        return self.item.popupOption.canTapDismiss;
    }
    return false;
}
#pragma mark - Public Methods
- (void)configurePopupItem:(HLPopItem *)popItem{
    
}

- (void)makePopupViewWithItem:(HLPopItem *)popItem{
    
}

- (void)replacePopupViewWithItem:(HLPopItem *)popItem{
    
}

- (void)showPopupViewWithDuration:(NSTimeInterval)duration Curve:(HLEasing *)easing DelayFactor:(CGFloat)delayFactor{
    
}

- (void)transformPopupViewWithDuration:(NSTimeInterval)duration Curve:(HLEasing *)easing DelayFactor:(CGFloat)delayFactor{
    
}

- (void)dismissPopupViewWithDuration:(NSTimeInterval)duration Curve:(HLEasing *)easing DelayFactor:(CGFloat)delayFactor Direction:(HLPopUpViewDirection)direction Completion:(void (^)(UIViewAnimatingPosition *position))completionBlock{
    
}

#pragma mark - Private Methods

@end
