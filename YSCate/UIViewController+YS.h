//
//  UIViewController+YS.h
//  YS
//
//  Created by Rocky on 2018/5/9.
//  Copyright © 2018年 任皖鹏. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^SeletVideoBlock)(NSURL *url, NSError *error);
typedef void(^SeletImgsBlock)(NSArray<UIImage *> *imgs, NSError *error);
typedef void(^SelectImgBlock)(UIImage *img, NSError *error);

@interface UIViewController (YS)

- (void)ys_showUpdateAvatar:(SelectImgBlock)selectImgBlock;
- (void)ys_showSeletImgs:(SeletImgsBlock)seletImgsBlock canSelectNum:(NSInteger)num;

- (void)ys_showCameraEdit:(BOOL)allowedEditImg selectImgBlock:(SelectImgBlock)selectImgBlock;
- (void)ys_showPhotoEdit:(BOOL)allowedEditImg selectImgBlock:(SelectImgBlock)selectImgBlock;

- (void)ys_showCameraVideoSeletVideoBlock:(SeletVideoBlock)seletVideoBlock;
- (void)ys_showPhotoVideoSeletVideoBlock:(SeletVideoBlock)seletVideoBlock;

@end
