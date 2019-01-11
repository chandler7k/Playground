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
        self.backgroundColor = [UIColor clearColor];
        _imageView = [[UIImageView alloc] init];
        _imageView.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:_imageView];
        self.clipsToBounds = YES;
        
        _deleteBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_deleteBtn setImage:[UIImage imageNamed:@"减icon"] forState: UIControlStateNormal];
        _deleteBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
        [self addSubview:_deleteBtn];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    _imageView.frame = CGRectMake(10, 10, self.tz_width - 20, self.tz_height - 20);
    _deleteBtn.frame = CGRectMake(self.tz_width - 20, 0, 20, 20);
    
    
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
