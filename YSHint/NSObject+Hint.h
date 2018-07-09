//
//  NSObject+Hints.h
//  YS
//
//  Created by Rocky on 2018/4/16.
//  Copyright © 2018年 任皖鹏. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

@interface NSObject (Hint)

/**
 显示操纵成功

 @param hint 提示文字
 */
+ (void)ys_showErrorWithHint:(NSString *)hint;


/**
 显示操纵失败

 @param hint 提示文字
 */
+ (void)ys_showSuccessWithHint:(NSString *)hint;


/**
 普通的提示

 @param hint 提示文字
 */
+ (void)ys_showWithHint:(NSString *)hint;


/**
 带图片的提示

 @param hint 提示文字
 @param img 图片
 */
+ (void)ys_showHint:(NSString *)hint img:(UIImage *)img;

@end
