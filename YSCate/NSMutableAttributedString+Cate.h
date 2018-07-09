//
//  NSMutableAttributedString+Cate.h
//  XCSX
//
//  Created by 任皖鹏 on 16/9/16.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSMutableAttributedString (Cate)

- (NSMutableAttributedString *)appendStr:(NSString *)str font:(UIFont *)font textColor:(UIColor *)color lineSpacing:(CGFloat)line;

- (NSMutableAttributedString *)appendStr:(NSString *)str font:(UIFont *)font textColor:(UIColor *)color;

- (NSMutableAttributedString *)appendStr:(NSString *)str;

- (NSMutableAttributedString *)addBgColor:(UIColor *)color range:(NSRange)range;

- (NSMutableAttributedString *)setLineSpacing:(CGFloat)line;

- (CGSize)sizeWithWidth:(CGFloat)width;

- (CGSize)sizeWithHeight:(CGFloat)height;

@end
