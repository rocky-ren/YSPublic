//
//  YSRichText.h
//  YS
//
//  Created by rocky on 2018/7/2.
//  Copyright © 2018年 任皖鹏. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreText/CoreText.h>

typedef void(^ClickAction)(void);

@interface YSRichModel : NSObject

@property (assign, nonatomic) NSRange range;
@property (strong, nonatomic) UIColor *bgColor;
@property (copy, nonatomic) ClickAction clickAction;

- (instancetype)initWithRange:(NSRange)range bgColor:(UIColor *)bgColor clickAction:(ClickAction)clickAction;

@end

@interface YSRichText : NSObject

- (instancetype)initWithLineSpace:(CGFloat)lineSpace highlightedColor:(UIColor *)highlightedColor w:(CGFloat)w;

- (instancetype)appendStr:(NSString *)str textColor:(UIColor *)textColor textFont:(UIFont *)textFont;

- (instancetype)appendStr:(NSString *)str textColor:(UIColor *)textColor textFont:(UIFont *)textFont bgColor:(UIColor *)bgColor clickAction:(ClickAction)clickAction;

- (CGFloat)h;
- (CGFloat)w;
- (CTFrameRef)ctFrame;
- (CTFrameRef)ctFrameWithHightlightedRange:(NSRange)range bgColor:(UIColor *)bgColor;
- (NSMutableArray *)clickActions;
- (UIColor *)highlightedColor;

@end
