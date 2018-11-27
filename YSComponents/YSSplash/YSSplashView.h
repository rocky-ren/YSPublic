//
//  YSSplashUtil.h
//  YSPublicDemo
//
//  Created by rocky on 2018/8/1.
//  Copyright © 2018年 rocky. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ClickSkip)(void);

@interface YSSplashView : UIView

- (instancetype)initWithViews:(NSArray<UIView *> *)views;

- (instancetype)initWithImages:(NSArray<UIImage *> *)imgs;

- (void)addSkipButton:(UIButton *)btn inPage:(NSInteger)index;

- (void)showInWindow:(UIWindow *)window clickSkip:(ClickSkip)clickSkip;

@end
