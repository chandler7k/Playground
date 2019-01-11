//
//  SDGFeedbackCollectionViewCell.h
//  IPCTest
//
//  Created by zouhuanlin on 2019/1/4.
//  Copyright © 2019 zouhuanlin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SDGFeedbackCollectionViewCell : UICollectionViewCell
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIButton *deleteBtn;
@property (nonatomic, strong) id asset;
@property (nonatomic, assign) NSInteger row;

@end

NS_ASSUME_NONNULL_END
