//
//  UIWindow+Alert.m
//  YS
//
//  Created by rocky on 2018/7/3.
//  Copyright © 2018年 任皖鹏. All rights reserved.
//

#import "UIView+Alert.h"
#import "YSConstant.h"
#import "YSCate.h"

@implementation UIView (Alert)

- (void)showAlertWithView:(UIView *)view dismissAuto:(BOOL)dismissAuto {
    
    __block UIView *blockView = view;
    __weak typeof(self) weakSelf = self;
    
    UIControl *bgView = [[UIControl alloc] initWithFrame:self.bounds];
    bgView.backgroundColor = UIColorFromRGBX(0x000000, 0.0);
    [bgView addSubview:view];
    view.center = bgView.center;
    
    [self addSubview:bgView];
    view.transform = CGAffineTransformMakeScale(0.8, 0.8);
    [UIView animateWithDuration:0.15 animations:^{
        bgView.backgroundColor = UIColorFromRGBX(0x000000, 0.3);
        blockView.transform = CGAffineTransformMakeScale(1.1, 1.1);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.1 animations:^{
            view.transform = CGAffineTransformMakeScale(1, 1);
        } completion:^(BOOL finished) {
            
        }];
    }];
    
    if (dismissAuto) {
        [bgView handleControlEvent:UIControlEventTouchUpInside withBlock:^(UIControl *control) {
            [weakSelf hideAlertWithView:blockView];
        }];
    }
}

- (void)hideAlertWithView:(UIView *)view {
    [UIView animateWithDuration:0.3 animations:^{
        view.alpha = 0;
        view.transform = CGAffineTransformMakeScale(0.8, 0.8);
        view.superview.backgroundColor = UIColorFromRGBX(0x000000, 0.0);
    } completion:^(BOOL finished) {
        [view.superview removeFromSuperview];
    }];
}

- (void)showSheetWithView:(UIView *)view dismissAuto:(BOOL)dismissAuto {
    
    __block UIView *blockView = view;
    __weak typeof(self) weakSelf = self;
    
    UIControl *bgView = [[UIControl alloc] initWithFrame:self.bounds];
    bgView.backgroundColor = UIColorFromRGBX(0x000000, 0.0);
    [bgView addSubview:view];
    
    CGRect frame = view.frame;
    frame = CGRectMake(0, self.frame.size.height, frame.size.width, frame.size.height);
    view.frame = frame;
    
    [self addSubview:bgView];
    [UIView animateWithDuration:0.3 animations:^{
        bgView.backgroundColor = UIColorFromRGBX(0x000000, 0.3);
        CGRect frame = view.frame;
        frame = CGRectMake(0, self.frame.size.height-frame.size.height, frame.size.width, frame.size.height);
        view.frame = frame;
    }];
    
    if (dismissAuto) {
        [bgView handleControlEvent:UIControlEventTouchUpInside withBlock:^(UIControl *control) {
            [weakSelf hideSheetWithView:blockView];
        }];
    }
}


- (void)hideSheetWithView:(UIView *)view {
    
    [UIView animateWithDuration:0.3 animations:^{
        view.superview.backgroundColor = UIColorFromRGBX(0x000000, 0.0);
        CGRect frame = view.frame;
        frame = CGRectMake(0, self.frame.size.height, frame.size.width, frame.size.height);
        view.frame = frame;
    } completion:^(BOOL finished) {
        [view.superview removeFromSuperview];
    }];
}


- (void)hideAlert {
    [UIView animateWithDuration:0.3 animations:^{
        self.alpha = 0;
        self.transform = CGAffineTransformMakeScale(0.8, 0.8);
        self.superview.backgroundColor = UIColorFromRGBX(0x000000, 0.0);
    } completion:^(BOOL finished) {
        [self.superview removeFromSuperview];
    }];
}

- (void)hideSheet {
    [UIView animateWithDuration:0.3 animations:^{
        self.superview.backgroundColor = UIColorFromRGBX(0x000000, 0.0);
        CGRect frame = self.frame;
        frame = CGRectMake(0, self.superview.frame.size.height, frame.size.width, frame.size.height);
        self.frame = frame;
    } completion:^(BOOL finished) {
        [self.superview removeFromSuperview];
    }];
}

@end
