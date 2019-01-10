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
#import <MobileCoreServices/MobileCoreServices.h>
@interface ViewController ()<UICollectionViewDelegate, UICollectionViewDataSource,UIImagePickerControllerDelegate, TZImagePickerControllerDelegate>
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
    self.view.backgroundColor = [UIColor whiteColor];
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



- (void)pushImagePickerController
{
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
    if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera]) {
        self.imagePickerVC.sourceType = sourceType;
        NSMutableArray *mediaTypes = [NSMutableArray array];
        [mediaTypes addObject:(NSString *)kUTTypeImage];
        
       
        [self presentViewController:self.imagePickerVC animated:YES completion:nil];
    } else {
        NSLog(@"模拟器中无法打开照相机,请在真机中使用");
    }
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

#pragma Collection Delegate & Datasource
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
        cell.backgroundColor = [UIColor clearColor];
    }else{
        cell.imageView.image = _selectedPhotos[indexPath.item];
        cell.asset = _selectedAssets[indexPath.item];
        cell.deleteBtn.hidden = NO;
        cell.backgroundColor =[[UIColor alloc] initWithRed:251.0 / 255.0 green:251.0 / 255.0 blue:251.0 / 255.0 alpha:1.0];
    }
    cell.deleteBtn.tag = indexPath.item;
    [cell.deleteBtn addTarget:self action:@selector(deleteButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
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

#pragma ImagePicker Delegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey,id> *)info
{
    [picker dismissViewControllerAnimated:YES completion:nil];
    NSString *type = [info objectForKey:UIImagePickerControllerMediaType];
    
    TZImagePickerController *tzImagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:1 delegate:self];
    tzImagePickerVc.sortAscendingByModificationDate = NO;
    [tzImagePickerVc showProgressHUD];
    if ([type isEqualToString:@"public.image"]) {
        UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
        
        // save photo and get asset / 保存图片，获取到asset
        [[TZImageManager manager] savePhotoWithImage:image location:nil completion:^(PHAsset *asset, NSError *error){
            [tzImagePickerVc hideProgressHUD];
            if (error) {
                NSLog(@"图片保存失败 %@",error);
            } else {
                TZAssetModel *assetModel = [[TZImageManager manager] createModelWithAsset:asset];
                [self refreshCollectionViewWithAddedAsset:assetModel.asset image:image];
            }
        }];
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
        CGFloat width = self.view.frame.size.width - 3 * margin - 4;
        CGFloat itemWH = width / 4 - margin;
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
- (void)deleteButtonClicked:(UIButton *)sender
{
    if ([self collectionView:self.collectionView numberOfItemsInSection:0] <= _selectedPhotos.count) {
        [_selectedPhotos removeObjectAtIndex:sender.tag];
        [_selectedAssets removeObjectAtIndex:sender.tag];
        [self.collectionView reloadData];
        return;
    }
    
    [_selectedPhotos removeObjectAtIndex:sender.tag];
    [_selectedAssets removeObjectAtIndex:sender.tag];
    [_collectionView performBatchUpdates:^{
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:sender.tag inSection:0];
        [self->_collectionView deleteItemsAtIndexPaths:@[indexPath]];
    } completion:^(BOOL finished) {
        [self->_collectionView reloadData];
    }];
}

- (void)takePhoto
{
    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    if (authStatus == AVAuthorizationStatusRestricted || authStatus == AVAuthorizationStatusDenied) {
        // 无相机权限 做一个友好的提示
        UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"无法使用相机" message:@"请在iPhone的""设置-隐私-相机""中允许访问相机" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"设置", nil];
        [alert show];
    } else if (authStatus == AVAuthorizationStatusNotDetermined) {
        // fix issue 466, 防止用户首次拍照拒绝授权时相机页黑屏
        [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
            if (granted) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self takePhoto];
                });
            }
        }];
        // 拍照之前还需要检查相册权限
    } else if ([PHPhotoLibrary authorizationStatus] == 2) { // 已被拒绝，没有相册权限，将无法保存拍的照片
        UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"无法访问相册" message:@"请在iPhone的""设置-隐私-相册""中允许访问相册" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"设置", nil];
        [alert show];
    } else if ([PHPhotoLibrary authorizationStatus] == 0) { // 未请求过相册权限
        [[TZImageManager manager] requestAuthorizationWithCompletion:^{
            [self takePhoto];
        }];
    } else {
        [self pushImagePickerController];
    }
}

- (void)refreshCollectionViewWithAddedAsset:(PHAsset *)asset image: (UIImage *)image
{
    [_selectedAssets addObject:asset];
    [_selectedPhotos addObject:image];
    [_collectionView reloadData];
    
    if ([asset isKindOfClass:[PHAsset class]]) {
        PHAsset *phAsset = asset;
        NSLog(@"location:%@",phAsset.location);
    }
}

@end
