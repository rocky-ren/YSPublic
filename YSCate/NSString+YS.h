//
//  NSString+YS.h
//  YS
//
//  Created by Rocky on 2018/5/8.
//  Copyright © 2018年 任皖鹏. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

@interface NSString (YS)

- (NSString *)transformToPinyin;

- (NSString *)transformToPinyinFirstLetter;

- (NSString *)ys_URLEncodedString;

- (NSString *)ys_URLDecodedString;

- (NSString *)ys_md532Bit;

- (CGFloat)ys_heightWithFont:(UIFont *)font constrainedToWidth:(CGFloat)width;

- (CGFloat)ys_widthWithFont:(UIFont *)font constrainedToHeight:(CGFloat)height;

- (CGSize)ys_sizeWithFont:(UIFont *)font constrainedToWidth:(CGFloat)width;

- (CGSize)ys_sizeWithFont:(UIFont *)font constrainedToHeight:(CGFloat)height;

@end
