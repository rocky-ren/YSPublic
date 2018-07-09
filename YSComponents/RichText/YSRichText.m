//
//  YSRichText.m
//  YS
//
//  Created by rocky on 2018/7/2.
//  Copyright © 2018年 任皖鹏. All rights reserved.
//

#import "YSRichText.h"

#import "NSMutableAttributedString+Cate.h"

@implementation YSRichModel

- (instancetype)initWithRange:(NSRange)range bgColor:(UIColor *)bgColor clickAction:(ClickAction)clickAction {
    self = [super init];
    if (self) {
        _range = range;
        _bgColor = bgColor;
        _clickAction = clickAction;
    }
    return self;
}

@end

@implementation YSRichText {
    
    CGFloat _h;
    CTFrameRef _ctFrame;
    CTFrameRef _ctFrameHbg;
    CGFloat _lineSpace;
    
    CGFloat _w;
    NSMutableAttributedString *_attr;
    UIColor *_highlightedColor;
    NSMutableArray *_clickActions;
}

- (instancetype)initWithLineSpace:(CGFloat)lineSpace highlightedColor:(UIColor *)highlightedColor w:(CGFloat)w {
    self = [super init];
    if (self) {
        _w = w;
        _lineSpace = lineSpace;
        _highlightedColor = highlightedColor;
        _clickActions = [NSMutableArray array];
        _attr = [[NSMutableAttributedString alloc] init];
    }
    return self;
}

- (instancetype)appendStr:(NSString *)str textColor:(UIColor *)textColor textFont:(UIFont *)textFont {
    [_attr appendStr:str font:textFont textColor:textColor];
    _h = 0;
    
    return self;
}

- (instancetype)appendStr:(NSString *)str textColor:(UIColor *)textColor textFont:(UIFont *)textFont bgColor:(UIColor *)bgColor clickAction:(ClickAction)clickAction {
    YSRichModel *model = [[YSRichModel alloc] initWithRange:NSMakeRange(_attr.length, str.length) bgColor:bgColor clickAction:clickAction];
    [_clickActions addObject:model];
    [_attr appendStr:str font:textFont textColor:textColor];
    _h = 0;
    
    return self;
}

- (void)clac {
    [_attr setLineSpacing:_lineSpace];
    
    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString((CFAttributedStringRef)_attr);
    CGSize restrictSize = CGSizeMake(_w, CGFLOAT_MAX);
    CGSize coreTextSize = CTFramesetterSuggestFrameSizeWithConstraints(framesetter, CFRangeMake(0, 0), nil, restrictSize, nil);
    
    _h = coreTextSize.height;
    _ctFrame = [self createFrameWithFramesetter:framesetter height:_h];
    
    CFRelease(framesetter);
}

- (CTFrameRef)createFrameWithFramesetter:(CTFramesetterRef)framesetter height:(CGFloat)height {
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, NULL, CGRectMake(0, 0, _w, height));
    CTFrameRef frame = CTFramesetterCreateFrame(framesetter, CFRangeMake(0, 0), path, NULL);
    CFRelease(path);
    
    return frame;
}

- (CGFloat)w {
    return _w;
}

- (CGFloat)h {
    if (_h == 0) {
        [self clac];
    }
    return _h;
}

- (CTFrameRef)ctFrame {
    if (_h == 0) {
        [self clac];
    }
    return _ctFrame;
}

- (CTFrameRef)ctFrameWithHightlightedRange:(NSRange)range bgColor:(UIColor *)bgColor {

    // CFRelease(_ctFrameHbg);
    NSMutableAttributedString *matt = _attr.mutableCopy;
    [matt addBgColor:bgColor range:range];
    
    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString((CFAttributedStringRef)matt);
    CGSize restrictSize = CGSizeMake(_w, CGFLOAT_MAX);
    CGSize coreTextSize = CTFramesetterSuggestFrameSizeWithConstraints(framesetter, CFRangeMake(0, 0), nil, restrictSize, nil);
    _h = coreTextSize.height;
    CTFrameRef _ctFrameHbg = [self createFrameWithFramesetter:framesetter height:_h];
    CFRelease(framesetter);
    
    return _ctFrameHbg;
}

- (NSMutableArray *)clickActions {
    return _clickActions;
}

- (UIColor *)highlightedColor {
    return _highlightedColor;
}

@end
