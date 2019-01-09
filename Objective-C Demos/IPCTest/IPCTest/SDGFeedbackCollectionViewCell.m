//
//  SDGFeedbackCollectionViewCell.m
//  IPCTest
//
//  Created by zouhuanlin on 2019/1/4.
//  Copyright © 2019 zouhuanlin. All rights reserved.
//

#import "SDGFeedbackCollectionViewCell.h"
#import "UIView+Layout.h"
#import <TZImagePickerController/TZImagePickerController.h>
@implementation SDGFeedbackCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        _imageView = [[UIImageView alloc] init];
        _imageView.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:_imageView];
        self.clipsToBounds = YES;
        
        _deleteBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_deleteBtn setImage:[UIImage imageNamed:@"减icon"] forState: UIControlStateNormal];
        _deleteBtn.imageEdgeInsets = UIEdgeInsetsMake(-10, 0, 0, -10);
        [self addSubview:_deleteBtn];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    _imageView.frame = self.bounds;
    _deleteBtn.frame = CGRectMake(self.tz_width - 36, 0, 36, 36);
    
}

- (void)setAsset:(PHAsset *)asset
{
    _asset = asset;
}

- (void)setRow:(NSInteger)row
{
    _row = row;
    _deleteBtn.tag = row;
}




@end
