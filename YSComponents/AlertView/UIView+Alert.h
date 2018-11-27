//
//  UIWindow+Alert.h
//  YS
//
//  Created by rocky on 2018/7/3.
//  Copyright © 2018年 任皖鹏. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^UIViewAlertWillHideBlock)(void);

@interface UIView (Alert)


- (void)showHintView:(UIView *)view afterDelay:(double)afterDelay;

- (void)showAlertWithView:(UIView *)view dismissAuto:(BOOL)dismissAuto;
- (void)showAlertWithView:(UIView *)view offset:(CGFloat)offset dismissAuto:(BOOL)dismissAuto;
- (void)showAlertWithView:(UIView *)view dismissAuto:(BOOL)dismissAuto willHide:(UIViewAlertWillHideBlock)alertWillHideBlock;
- (void)showAlertWithView:(UIView *)view offset:(CGFloat)offset dismissAuto:(BOOL)dismissAuto willHide:(UIViewAlertWillHideBlock)alertWillHideBlock;

- (void)hideAlertWithView:(UIView *)view;

- (void)showSheetWithView:(UIView *)view dismissAuto:(BOOL)dismissAuto;
- (void)showSheetWithView:(UIView *)view dismissAuto:(BOOL)dismissAuto willHide:(UIViewAlertWillHideBlock)alertWillHideBlock;

- (void)hideSheetWithView:(UIView *)view;

- (void)hideAlert;

- (void)hideSheet;

@end

