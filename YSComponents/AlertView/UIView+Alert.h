//
//  UIWindow+Alert.h
//  YS
//
//  Created by rocky on 2018/7/3.
//  Copyright © 2018年 任皖鹏. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Alert)

- (void)showAlertWithView:(UIView *)view dismissAuto:(BOOL)dismissAuto;

- (void)hideAlertWithView:(UIView *)view;

- (void)showSheetWithView:(UIView *)view dismissAuto:(BOOL)dismissAuto;

- (void)hideSheetWithView:(UIView *)view;

- (void)hideAlert;

- (void)hideSheet;

@end
