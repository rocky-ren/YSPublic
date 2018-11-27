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

#import <objc/runtime.h>

static const void *UIViewAlertWillHideBlockKey = &UIViewAlertWillHideBlockKey;

@implementation UIView (Alert)

- (void)showHintView:(UIView *)view afterDelay:(double)afterDelay {
    __block UIView *blockView = view;
    UIView *bgView = [[UIView alloc] initWithFrame:self.bounds];
    bgView.backgroundColor = UIColorFromRGBX(0x000000, 0.0);
    [bgView addSubview:view];
    bgView.userInteractionEnabled = NO;
    view.center = bgView.center;
    view.alpha = 1;
    
    [self addSubview:bgView];
    view.transform = CGAffineTransformMakeScale(0.8, 0.8);
    [UIView animateWithDuration:0.15 animations:^{
        bgView.backgroundColor = UIColorFromRGBX(0x000000, 0.0);
        blockView.transform = CGAffineTransformMakeScale(1.1, 1.1);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.1 animations:^{
            view.transform = CGAffineTransformMakeScale(1, 1);
        } completion:^(BOOL finished) {
            
        }];
    }];
    [self eventAfterDelay:afterDelay andEvent:^{
        [blockView hideAlert];
    }];
}

- (void)eventAfterDelay:(double)delay andEvent:(void(^)(void))event
{
    [self performSelector:@selector(afterEvent:) withObject:event afterDelay:delay];
}

- (void)afterEvent:(void(^)(void))event
{
    event();
}

- (void)showAlertWithView:(UIView *)view dismissAuto:(BOOL)dismissAuto {
    [self showAlertWithView:view offset:0 dismissAuto:dismissAuto];
}

- (void)showAlertWithView:(UIView *)view offset:(CGFloat)offset dismissAuto:(BOOL)dismissAuto {
    __block UIView *blockView = view;
    __weak typeof(self) weakSelf = self;
    
    UIControl *bgView = [[UIControl alloc] initWithFrame:self.bounds];
    bgView.backgroundColor = UIColorFromRGBX(0x000000, 0.0);
    [bgView addSubview:view];
    CGPoint p = bgView.center;
    p.y += offset;
    view.center = p;
    view.alpha = 1;
    
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

- (void)showAlertWithView:(UIView *)view offset:(CGFloat)offset dismissAuto:(BOOL)dismissAuto willHide:(UIViewAlertWillHideBlock)alertWillHideBlock {
    [self showAlertWithView:view offset:offset dismissAuto:dismissAuto];
    objc_setAssociatedObject(self, UIViewAlertWillHideBlockKey, alertWillHideBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void)showAlertWithView:(UIView *)view dismissAuto:(BOOL)dismissAuto willHide:(UIViewAlertWillHideBlock)alertWillHideBlock {
    [self showAlertWithView:view offset:0 dismissAuto:dismissAuto];
}

- (void)hideAlertWithView:(UIView *)view {
    [view hideAlert];
}

- (void)showSheetWithView:(UIView *)view dismissAuto:(BOOL)dismissAuto {
    
    __block UIView *blockView = view;
    __weak typeof(self) weakSelf = self;
    
    UIControl *bgView = [[UIControl alloc] initWithFrame:self.bounds];
    bgView.backgroundColor = UIColorFromRGBX(0x000000, 0.0);
    [bgView addSubview:view];
    view.alpha = 1;
    
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

- (void)showSheetWithView:(UIView *)view dismissAuto:(BOOL)dismissAuto willHide:(UIViewAlertWillHideBlock)alertWillHideBlock {
    [self showSheetWithView:view dismissAuto:dismissAuto];
    objc_setAssociatedObject(self, UIViewAlertWillHideBlockKey, alertWillHideBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void)hideSheetWithView:(UIView *)view {
    [view hideSheet];
}


- (void)hideAlert {
    UIViewAlertWillHideBlock b = objc_getAssociatedObject(self.superview.superview, UIViewAlertWillHideBlockKey);
    if (b) {
        b();
    }
    
    [UIView animateWithDuration:0.3 animations:^{
        self.alpha = 0;
        self.transform = CGAffineTransformMakeScale(0.8, 0.8);
        self.superview.backgroundColor = UIColorFromRGBX(0x000000, 0.0);
    } completion:^(BOOL finished) {
        [self.superview removeFromSuperview];
    }];
}

- (void)hideSheet {
    UIViewAlertWillHideBlock b = objc_getAssociatedObject(self.superview.superview, UIViewAlertWillHideBlockKey);
    if (b) {
        b();
    }
    
    [UIView animateWithDuration:0.3 animations:^{
        self.superview.backgroundColor = UIColorFromRGBX(0x000000, 0.0);
        CGRect frame = self.frame;
        frame = CGRectMake(0, self.superview.frame.size.height, frame.size.width, frame.size.height);
        self.frame = frame;
    } completion:^(BOOL finished) {
        [self.superview removeFromSuperview];
    }];
}

- (void)setAlertWillHideBlock:(UIViewAlertWillHideBlock)alertWillHideBlock {
    objc_setAssociatedObject(self, UIViewAlertWillHideBlockKey, alertWillHideBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

@end

