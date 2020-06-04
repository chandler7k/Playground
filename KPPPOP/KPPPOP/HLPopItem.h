//
//  HLPopItem.h
//  KPPPOP
//
//  Created by 邹奂霖 on 2020/6/4.
//  Copyright © 2020 xinhuamm. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class HLPopOption;
@class HLShape;
@class HLEasing;
typedef NS_ENUM(NSInteger,HLShapeType) {
    HLShapeTypeNormal = 1,
    HLShapeTypeRounded = 2,
    HLShapeTypeRoundedCornerTop = 3,
    HLShapeTypeRoundedCornerBottom = 4,
};

typedef NS_ENUM(NSInteger,HLViewType) {
    HLViewTypeToast = 1,
    HLViewTypeCard = 2,
};

typedef NS_ENUM(NSInteger,HLPopUpViewDirection) {
    HLPopUpViewDirectionTop = 1,
    HLPopUpViewDirectionBottom = 2,
};
NS_ASSUME_NONNULL_BEGIN

@interface HLPopItem : NSObject
@property (nonatomic, strong) UIView *view;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGFloat maxWidth;
@property (nonatomic, assign) CGSize landscapeSize;
@property (nonatomic, strong) HLPopOption *popupOption;
- (instancetype)initWithView:(UIView *)view
                      Height:(CGFloat)height
                    MaxWidth:(CGFloat)maxWidth
               LandscapeSize:(CGSize)landscapeSize
                 PopupOption:(HLPopOption *)popupOption;
@end

@interface HLPopOption : NSObject
@property (nonatomic, strong) HLShape *shape;
@property (nonatomic, assign) HLViewType viewType;
@property (nonatomic, assign) HLPopUpViewDirection direction;
@property (nonatomic, assign) CGFloat margin;
@property (nonatomic, assign) BOOL hasBlur;
@property (nonatomic, assign) NSTimeInterval duration;
@property (nonatomic, strong) HLEasing *easing;
@property (nonatomic, assign) BOOL canTapDismiss;
- (instancetype)initWithShape:(HLShape *)shape
                     ViewType:(HLViewType)viewType
                    Direction:(HLPopUpViewDirection)direction
                       Margin:(CGFloat)margin
                      HasBlur:(BOOL)hasBlur
                     Duration:(NSTimeInterval)duration
                       Easing:(HLEasing *)easing
                CanTapDismiss:(BOOL)canTapDismiss;
@end

@interface HLShape: NSObject
@property (nonatomic, assign) HLShapeType type;
@property (nonatomic, assign) CGFloat cornerSize;
@end

NS_ASSUME_NONNULL_END
