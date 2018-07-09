//
//  NSMutableAttributedString+Cate.m
//  XCSX
//
//  Created by 任皖鹏 on 16/9/16.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "NSMutableAttributedString+Cate.h"

@implementation NSMutableAttributedString (Cate)

/**
 NSFontAttributeName
 字体
 NSParagraphStyleAttributeName
 段落格式
 NSForegroundColorAttributeName
 字体颜色
 NSBackgroundColorAttributeName
 背景颜色
 NSStrikethroughStyleAttributeName
 删除线格式
 NSUnderlineStyleAttributeName
 下划线格式
 NSStrokeColorAttributeName
 删除线颜色
 NSStrokeWidthAttributeName
 删除线宽度
 NSShadowAttributeName
 阴影
 更多方法和属性说明详见苹果官方说明文档：
 https://developer.apple.com/library/ios/documentation/Cocoa/Reference/Foundation/Classes/NSMutableAttributedString_Class/Reference/Reference.html#//apple_ref/doc/uid/TP40003689
 */

- (NSMutableAttributedString *)appendStr:(NSString *)str font:(UIFont *)font textColor:(UIColor *)color lineSpacing:(CGFloat)line
{
    [self appendStr:str font:font textColor:color];
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:line];
    
    [self addAttribute:NSParagraphStyleAttributeName
                 value:paragraphStyle
                 range:NSMakeRange(self.length-str.length, str.length)];
    
    return self;
}

- (NSMutableAttributedString *)appendStr:(NSString *)str font:(UIFont *)font textColor:(UIColor *)color
{
    NSInteger temp = self.length;
    [self appendStr:str];
    
    [self addAttribute:NSFontAttributeName
                 value:font
                 range:NSMakeRange(temp, str.length)];
    
    [self addAttribute:NSForegroundColorAttributeName
                 value:color
                 range:NSMakeRange(temp, str.length)];
    

    return self;
}

- (NSMutableAttributedString *)appendStr:(NSString *)str
{
    if (!str) {
        str = @"";
    }
    [self appendAttributedString:[[NSAttributedString alloc] initWithString:str]];
    
    return self;
}

- (NSMutableAttributedString *)addBgColor:(UIColor *)color range:(NSRange)range {
    
    [self addAttribute:NSBackgroundColorAttributeName
                 value:color
                 range:range];
    
    return self;
}

- (NSMutableAttributedString *)setLineSpacing:(CGFloat)line
{
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:line];
    [self addAttribute:NSParagraphStyleAttributeName
                 value:paragraphStyle
                 range:NSMakeRange(0, self.length)];
    
    return self;
}

- (CGSize)sizeWithWidth:(CGFloat)width
{
    CGRect rect = [self boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin context:nil];
    return rect.size;
}

- (CGSize)sizeWithHeight:(CGFloat)height
{
    CGRect rect = [self boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, height) options:NSStringDrawingUsesLineFragmentOrigin context:nil];
    return rect.size;
}

@end
