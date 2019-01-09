//
//  ViewController.m
//  IPCTest
//
//  Created by zouhuanlin on 2019/1/3.
//  Copyright © 2019 zouhuanlin. All rights reserved.
//

#import "ViewController.h"
#import <TZImagePickerController/TZImagePickerController.h>
#import "SDGFeedbackCollectionViewCell.h"

@interface ViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>
{
    NSMutableArray *_selectedPhotos;
    NSMutableArray *_selectedAssets;
    BOOL _isSelectedOriginalPhoto;
    NSInteger maxValue;
    CGFloat _itemWH;
    CGFloat _margin;
}
@property (nonatomic, strong) UICollectionViewFlowLayout *layout;
@property (nonatomic, strong) UIImagePickerController *imagePickerVC;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setupUI];
}
#pragma private method

- (void)setupUI
{
    maxValue = 9;
    _selectedAssets = [NSMutableArray array];
    _selectedPhotos = [NSMutableArray array];
    [self.view addSubview:self.imageView];
    [self.view addSubview:self.collectionView];
    
    [self.imageView setUserInteractionEnabled:YES];
    [self.imageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showPIC)]];
    
    [self.view addSubview:self.collectionView];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    
    NSLog(@"setupui");
    
}

- (void)showPIC
{

    if(maxValue <= 0){
        return;
    }
    TZImagePickerController *tzimagePickerVC = [[TZImagePickerController alloc] initWithMaxImagesCount:maxValue columnNumber:4 delegate:self pushPhotoPickerVc:YES];
    [tzimagePickerVC setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOriginalPhoto) {
        self.imageView.image = photos[0];
        self->_selectedAssets = [NSMutableArray arrayWithArray:assets];
        self->_selectedPhotos = [NSMutableArray arrayWithArray:photos];
        self->_isSelectedOriginalPhoto = isSelectOriginalPhoto;
        [self.collectionView reloadData];
    }];
    [self presentViewController:tzimagePickerVC animated:YES
                     completion:nil];
    tzimagePickerVC.isSelectOriginalPhoto = NO;
    if(maxValue > 1){
        tzimagePickerVC.selectedAssets = _selectedAssets;
    }
    //config tzimagePicker
    tzimagePickerVC.allowTakePicture = YES;
    tzimagePickerVC.allowTakeVideo = NO;
    tzimagePickerVC.naviBgColor = [UIColor whiteColor];
    tzimagePickerVC.barItemTextColor = [UIColor blackColor];
    tzimagePickerVC.statusBarStyle = UIStatusBarStyleDefault;
    tzimagePickerVC.allowPickingImage = YES;
    tzimagePickerVC.allowPickingGif = NO;
    tzimagePickerVC.allowPickingVideo = NO;
    
}

#pragma Delegata & Datasource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if(_selectedPhotos.count >= maxValue){
        return maxValue;
    }
    return _selectedPhotos.count + 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    SDGFeedbackCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    if(indexPath.item == _selectedPhotos.count){
        cell.imageView.image = [UIImage imageNamed:@"addIcon"];
        cell.deleteBtn.hidden = YES;
        
    }else{
        cell.imageView.image = _selectedPhotos[indexPath.item];
        cell.asset = _selectedAssets[indexPath.item];
        cell.deleteBtn.hidden = NO;
    }
    cell.deleteBtn.tag = indexPath.item;
    [cell.deleteBtn addTarget:self action:@selector(deleteBtn) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.item == _selectedAssets.count) {
        UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
        UIAlertAction *takePhotoAction = [UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [self takePhoto];
        }];
        [alertVC addAction:takePhotoAction];
        UIAlertAction *imagePickerAction = [UIAlertAction actionWithTitle:@"去相册选择" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [self showPIC];
        }];
        [alertVC addAction:imagePickerAction];
         UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
        [alertVC addAction:cancelAction];
       
        UIPopoverPresentationController *popover = alertVC.popoverPresentationController;
        UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
        if (popover) {
            popover.sourceView = cell;
            popover.sourceRect = cell.bounds;
            popover.permittedArrowDirections = UIPopoverArrowDirectionAny;
        }
        [self presentViewController:alertVC animated:YES completion:nil];
    }else{
        PHAsset *asset = _selectedAssets[indexPath.item];
        TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc] initWithSelectedAssets:_selectedAssets selectedPhotos:_selectedPhotos index:indexPath.item];
        imagePickerVc.maxImagesCount = maxValue;
        imagePickerVc.allowPickingGif = NO;
        imagePickerVc.allowPickingOriginalPhoto = NO;
        imagePickerVc.allowPickingMultipleVideo = NO;
        imagePickerVc.showSelectedIndex = NO;
        imagePickerVc.isSelectOriginalPhoto = _isSelectedOriginalPhoto;
        [imagePickerVc setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOriginalPhoto) {
            self->_selectedPhotos = [NSMutableArray arrayWithArray:photos];
            self->_selectedAssets = [NSMutableArray arrayWithArray:assets];
            self->_isSelectedOriginalPhoto = isSelectOriginalPhoto;
            [self->_collectionView reloadData];
            self->_collectionView.contentSize = CGSizeMake(0, ((self->_selectedPhotos.count + 2) / 3 ) * (self->_margin + self->_itemWH));
        }];
        [self presentViewController:imagePickerVc animated:YES completion:nil];
    }
}

#pragma setter
- (UIImageView *)imageView
{
    if(!_imageView){
        _imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"text"]];
        
        _imageView.frame = CGRectMake(0, 0, 200, 200);
        
    }
    return _imageView;
}
- (UICollectionView *)collectionView
{
    if(!_collectionView){
        _layout = [[UICollectionViewFlowLayout alloc] init];
        CGFloat margin = 4;
        CGFloat width = self.view.frame.size.height - 2 * margin - 4;
        CGFloat itemWH = width / 3 - margin;
        _layout.itemSize = CGSizeMake(itemWH, itemWH);
        _layout.minimumInteritemSpacing = margin;
        _layout.minimumLineSpacing = margin;
        
        _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:_layout];
        CGFloat rgb = 244 / 255.0;
        _collectionView.alwaysBounceVertical = YES;
        _collectionView.backgroundColor = [UIColor colorWithRed:rgb green:rgb blue:rgb alpha:1.0];
        _collectionView.contentInset = UIEdgeInsetsMake(4, 4, 4, 4);
        _collectionView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
        [_collectionView registerClass:[SDGFeedbackCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    }
    return _collectionView;
}

- (UIImagePickerController *)imagePickerVC
{
    if (!_imagePickerVC) {
        _imagePickerVC = [[UIImagePickerController alloc] init];
        _imagePickerVC.delegate = self;
        
        _imagePickerVC.navigationBar.tintColor = self.navigationController.navigationBar.tintColor;
        _imagePickerVC.navigationBar.barTintColor = self.navigationController.navigationBar.barTintColor;
        UIBarButtonItem *tzBarItem, *BarItem;
        if(@available(iOS 9, *)){
            tzBarItem = [UIBarButtonItem appearanceWhenContainedInInstancesOfClasses:@[[TZImagePickerController class]]];
            BarItem = [UIBarButtonItem appearanceWhenContainedInInstancesOfClasses: @[[UIImagePickerController class]]];
        }else{
            tzBarItem = [UIBarButtonItem appearanceWhenContainedIn:[TZImagePickerController class], nil];
            BarItem = [UIBarButtonItem appearanceWhenContainedIn:[UIImagePickerController class], nil];
        }
        return _imagePickerVC;
    }
    return _imagePickerVC;
}


#pragma actions
- (void)deleteButtonClicked
{
    
}

- (void)takePhoto
{
    
}
@end
