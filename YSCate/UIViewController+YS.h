//
//  UIViewController+YS.h
//  YS
//
//  Created by Rocky on 2018/5/9.
//  Copyright © 2018年 任皖鹏. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^UpdateAvatarBlock)(UIImage *img);
typedef void(^SeletImgsBlock)(NSArray<UIImage *> *imgs);

@interface UIViewController (YS) <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (assign, nonatomic) BOOL isEditImg;
@property (nonatomic, strong) UIImagePickerController *imagePickerController;

- (void)showUpdateAvatar:(UpdateAvatarBlock)updateAvatarBlock;

- (void)showSeletImgs:(SeletImgsBlock)seletImgsBlock;

@end
