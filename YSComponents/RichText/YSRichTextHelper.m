//
//  YSRichTextHelper.m
//  YS
//
//  Created by rocky on 2018/7/2.
//  Copyright © 2018年 任皖鹏. All rights reserved.
//

#import "YSRichTextHelper.h"

@implementation YSRichTextHelper

+ (UIImageView *)iconByText:(NSString *)text {
    UIImageView *imgv = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    if ([@"[链接]" isEqualToString:text]) {
        imgv.image = [UIImage imageNamed:@""];
        return imgv;
    }
    return nil;
}

@end
