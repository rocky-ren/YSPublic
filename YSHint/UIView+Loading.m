//
//  UIView+Loading.m
//  YS
//
//  Created by Rocky on 2018/4/16.
//  Copyright © 2018年 任皖鹏. All rights reserved.
//

#import "UIView+Loading.h"
#import <objc/runtime.h>

#import "MBProgressHUD/MBProgressHUD.h"

static const void *HttpRequestHUDKey = &HttpRequestHUDKey;

@implementation UIView (Loading)

- (MBProgressHUD *)HUD {
    return objc_getAssociatedObject(self, HttpRequestHUDKey);
}

- (void)setHUD:(MBProgressHUD *)HUD {
    objc_setAssociatedObject(self, HttpRequestHUDKey, HUD, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


- (void)ys_showLoading {
    [self ys_showLoading:nil];
}


- (void)ys_showLoading:(NSString *)str {
    MBProgressHUD *HUD = [self HUD];
    if (!HUD) {
        HUD = [[MBProgressHUD alloc] initWithView:self];
        HUD.mode = MBProgressHUDModeIndeterminate;
        [self setHUD:HUD];
    }
    if (str) {
        HUD.label.text = str;
    } else {
        HUD.label.text = @"";
    }
    [self addSubview:[self HUD]];
    [[self HUD] showAnimated:YES];
}

- (void)ys_hideLoading {
    [[self HUD] hideAnimated:YES];
}

@end
