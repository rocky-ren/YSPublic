//
//  UIView+Loading.h
//  YS
//
//  Created by Rocky on 2018/4/16.
//  Copyright © 2018年 任皖鹏. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Loading)

/**
 加载中
 */
- (void)ys_showLoading;
- (void)ys_showLoading:(NSString *)str;


/**
 加载结束
 */
- (void)ys_hideLoading;

@end
