//
//  NSObject+Hints.m
//  YS
//
//  Created by Rocky on 2018/4/16.
//  Copyright © 2018年 任皖鹏. All rights reserved.
//

#import "NSObject+Hint.h"

#import "MBProgressHUD/MBProgressHUD.h"

#import "SVProgressHUD/SVProgressHUD.h"

@implementation NSObject (Hint)

+ (void)ys_showErrorWithHint:(NSString *)hint {
    [self ys_showHint:hint img:nil];
}

+ (void)ys_showSuccessWithHint:(NSString *)hint {
    [self ys_showHint:hint img:nil];
}

+ (void)ys_showWithHint:(NSString *)hint {
    [self ys_showHint:hint img:nil];
}

+ (void)ys_showHint:(NSString *)hint img:(UIImage *)img {
    [SVProgressHUD setFont:[UIFont systemFontOfSize:17]];
    [SVProgressHUD setBackgroundColor:[UIColor colorWithRed:235/255.0 green:235/255.0 blue:235/255.0 alpha:1]];
    [SVProgressHUD showImage:img status:hint];
    [SVProgressHUD dismissWithDelay:1.5];
}

@end
