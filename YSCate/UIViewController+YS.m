//
//  UIViewController+YS.m
//  YS
//
//  Created by Rocky on 2018/5/9.
//  Copyright © 2018年 任皖鹏. All rights reserved.
//

#import "UIViewController+YS.h"

#import <objc/runtime.h>

#import <AVFoundation/AVFoundation.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import <Photos/Photos.h>
#import <PhotosUI/PhotosUI.h>
#import <MobileCoreServices/MobileCoreServices.h>

static const void *IsEditImg = &IsEditImg;
static const void *ImagePickerController = &ImagePickerController;

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

- (void)showUpdateAvatar:(UpdateAvatarBlock)updateAvatarBlock {

    AVAuthorizationStatus status = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    if (status == AVAuthorizationStatusRestricted || status == AVAuthorizationStatusDenied) {
        NSLog(@"无法使用摄像头，请检测摄像头是否可用或者有权限访问！");
        return;
    }
    
    if (!self.imagePickerController) {
        UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
        imagePickerController.delegate = self;
        self.imagePickerController = imagePickerController;
    }
    
    self.isEditImg = YES;
    self.imagePickerController.isEditImg = YES;
    __block UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"请选择" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    __weak typeof(self) weakSelf = self;
    UIAlertAction *actionCamera = [UIAlertAction actionWithTitle:@"相机" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        weakSelf.imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
        [weakSelf presentViewController:weakSelf.imagePickerController animated:YES completion:^{
            
        }];
    }];
    
    UIAlertAction *actionPhoto = [UIAlertAction actionWithTitle:@"相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        weakSelf.imagePickerController.sourceType = UIImagePickerControllerCameraCaptureModePhoto;
        [weakSelf presentViewController:weakSelf.imagePickerController animated:YES completion:^{
            
        }];
    }];
    
    UIAlertAction *actionCancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        [alert dismissViewControllerAnimated:YES
                                  completion:^{
                                      
                                  }];
    }];
    [alert addAction:actionCamera];
    [alert addAction:actionPhoto];
    [alert addAction:actionCancel];
    
    [self presentViewController:alert animated:YES completion:^{
        
    }];
}

#pragma mark - UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    UIImage *img;
    if (self.isEditImg) {
        img = info[UIImagePickerControllerEditedImage];
    }else {
        img = info[UIImagePickerControllerOriginalImage];
    }
}

- (void)showSeletImgs:(SeletImgsBlock)seletImgsBlock {
    
}

@end
