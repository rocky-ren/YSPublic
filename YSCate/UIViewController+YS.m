//
//  UIViewController+YS.m
//  YS
//
//  Created by Rocky on 2018/5/9.
//  Copyright © 2018年 任皖鹏. All rights reserved.
//

#import "UIViewController+YS.h"
#import "YSAlert+Normal.h"
#import "YSAlert.h"

#import <objc/runtime.h>

#import <AVFoundation/AVFoundation.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import <Photos/Photos.h>
#import <PhotosUI/PhotosUI.h>
#import <MobileCoreServices/MobileCoreServices.h>

#import "TZImagePickerController.h"

static const void *IsEditImg = &IsEditImg;
static const void *ImagePickerController = &ImagePickerController;
static const void *SelectImgBlockKey = &SelectImgBlockKey;
static const void *SeletVideoBlockKey = &SeletVideoBlockKey;

@interface UIViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (assign, nonatomic) BOOL isEditImg;
@property (nonatomic, strong) UIImagePickerController *imagePickerController;

@end

@implementation UIViewController (YS) 

- (void)setIsEditImg:(BOOL)isEditImg {
    objc_setAssociatedObject(self, IsEditImg, @(isEditImg), OBJC_ASSOCIATION_ASSIGN);
}

- (BOOL)isEditImg {
    return objc_getAssociatedObject(self, IsEditImg);
}

- (void)setImagePickerController:(UIImagePickerController *)imagePickerController {
    objc_setAssociatedObject(self, ImagePickerController, imagePickerController, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIImagePickerController *)imagePickerController {
    return objc_getAssociatedObject(self, ImagePickerController);
}

- (void)ys_showCameraVideoSeletVideoBlock:(SeletVideoBlock)seletVideoBlock {
    objc_setAssociatedObject(self, SeletVideoBlockKey, seletVideoBlock, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    AVAuthorizationStatus status = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    if (status == AVAuthorizationStatusRestricted || status == AVAuthorizationStatusDenied) {
        NSString *domain = @"com.yscoco";
        NSString *desc = NSLocalizedString(@"无法使用摄像头，请检测摄像头是否可用或者有权限访问！", @"");
        NSDictionary *userInfo = @{NSLocalizedDescriptionKey : desc};
        NSError *error = [NSError errorWithDomain:domain
                                             code:-101
                                         userInfo:userInfo];
        seletVideoBlock(nil, error);
        return;
    }
    
    if (!self.imagePickerController) {
        UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
        imagePickerController.delegate = self;
        self.imagePickerController = imagePickerController;
    }
    self.imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
    NSArray *availableMedia = [UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypeCamera];
    self.imagePickerController.mediaTypes = [NSArray arrayWithObject:availableMedia[1]];
    [self presentViewController:self.imagePickerController animated:YES completion:^{
        
    }];
}

- (void)ys_showPhotoVideoSeletVideoBlock:(SeletVideoBlock)seletVideoBlock {
    objc_setAssociatedObject(self, SeletVideoBlockKey, seletVideoBlock, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    AVAuthorizationStatus status = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    if (status == AVAuthorizationStatusRestricted || status == AVAuthorizationStatusDenied) {
        NSString *domain = @"com.yscoco";
        NSString *desc = NSLocalizedString(@"无法使用摄像头，请检测摄像头是否可用或者有权限访问！", @"");
        NSDictionary *userInfo = @{NSLocalizedDescriptionKey : desc};
        NSError *error = [NSError errorWithDomain:domain
                                             code:-101
                                         userInfo:userInfo];
        seletVideoBlock(nil, error);
        return;
    }
    
    if (!self.imagePickerController) {
        UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
        imagePickerController.delegate = self;
        self.imagePickerController = imagePickerController;
    }
    self.imagePickerController.sourceType = UIImagePickerControllerCameraCaptureModePhoto;
    NSArray *availableMedia = [UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypeCamera];
    self.imagePickerController.mediaTypes = [NSArray arrayWithObject:availableMedia[1]];
    [self presentViewController:self.imagePickerController animated:YES completion:^{
        
    }];
}


- (void)ys_showCameraEdit:(BOOL)allowedEditImg selectImgBlock:(SelectImgBlock)selectImgBlock {
    self.isEditImg = allowedEditImg;
    
    objc_setAssociatedObject(self, SelectImgBlockKey, selectImgBlock, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    AVAuthorizationStatus status = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    if (status == AVAuthorizationStatusRestricted || status == AVAuthorizationStatusDenied) {
        NSString *domain = @"com.yscoco";
        NSString *desc = NSLocalizedString(@"无法使用摄像头，请检测摄像头是否可用或者有权限访问！", @"");
        NSDictionary *userInfo = @{NSLocalizedDescriptionKey : desc};
        NSError *error = [NSError errorWithDomain:domain
                                             code:-101
                                         userInfo:userInfo];
        selectImgBlock(nil, error);
        return;
    }
    
    if (!self.imagePickerController) {
        UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
        imagePickerController.delegate = self;
        self.imagePickerController = imagePickerController;
    }
    self.imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
    self.imagePickerController.allowsEditing = self.isEditImg;
    [self presentViewController:self.imagePickerController animated:YES completion:^{
        
    }];
}

- (void)ys_showPhotoEdit:(BOOL)allowedEditImg selectImgBlock:(SelectImgBlock)selectImgBlock {
    self.isEditImg = allowedEditImg;
    
    objc_setAssociatedObject(self, SelectImgBlockKey, selectImgBlock, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    AVAuthorizationStatus status = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    if (status == AVAuthorizationStatusRestricted || status == AVAuthorizationStatusDenied) {
        NSString *domain = @"com.yscoco";
        NSString *desc = NSLocalizedString(@"无法使用摄像头，请检测摄像头是否可用或者有权限访问！", @"");
        NSDictionary *userInfo = @{NSLocalizedDescriptionKey : desc};
        NSError *error = [NSError errorWithDomain:domain
                                             code:-101
                                         userInfo:userInfo];
        selectImgBlock(nil, error);
        return;
    }
    
    if (!self.imagePickerController) {
        UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
        imagePickerController.delegate = self;
        self.imagePickerController = imagePickerController;
    }
    self.imagePickerController.sourceType = UIImagePickerControllerCameraCaptureModePhoto;
    self.imagePickerController.allowsEditing = self.isEditImg;
    [self presentViewController:self.imagePickerController animated:YES completion:^{
        
    }];
}

- (void)ys_showUpdateAvatar:(SelectImgBlock)selectImgBlock {
    __weak typeof(self) weakSelf = self;
    [YSAlert showWithSelects:@[@"从手机相册选择", @"拍照"] clickAtIndex:^(NSInteger index, UIView *view) {
        if (index == 0) { [weakSelf ys_showPhotoEdit:YES selectImgBlock:selectImgBlock]; }
        if (index == 1) { [weakSelf ys_showCameraEdit:YES selectImgBlock:selectImgBlock]; }
    }];
}

#pragma mark - UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
    NSURL *sourceURL = [info objectForKey:UIImagePickerControllerMediaURL];
    NSLog(@"%@", sourceURL);
    
    if (sourceURL) {
        SeletVideoBlock seletVideoBlock = objc_getAssociatedObject(self, SeletVideoBlockKey);
        seletVideoBlock(sourceURL, nil);
    } else {
        UIImage *img;
        if (self.isEditImg) {
            img = info[UIImagePickerControllerEditedImage];
        } else {
            img = info[UIImagePickerControllerOriginalImage];
        }
        SelectImgBlock selectImgBlock = objc_getAssociatedObject(self, SelectImgBlockKey);
        if (selectImgBlock) {
            selectImgBlock(img, nil);
        }
    }
    [self.imagePickerController dismissViewControllerAnimated:YES completion:^{
        
    }];
}

- (void)ys_showSeletImgs:(SeletImgsBlock)seletImgsBlock canSelectNum:(NSInteger)num {
    TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:num delegate:nil];
    imagePickerVc.title = @"";
    [imagePickerVc setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOriginalPhoto) {
        seletImgsBlock(photos, nil);
    }];
    [self presentViewController:imagePickerVc animated:YES completion:nil];
}


@end
