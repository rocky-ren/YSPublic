//
//  YSRichTextView.m
//  YS
//
//  Created by rocky on 2018/7/2.
//  Copyright © 2018年 任皖鹏. All rights reserved.
//

#import "YSRichTextView.h"

#import "YSRichText.h"

@implementation YSRichTextView
{
    UIColor *_beforeColor;
    BOOL _haveEvent;
    
    UIColor *_hightlightedBgColor;
    NSRange _hightlightedRange;
    BOOL _showHightlightedRange;
    
    ClickAction _clickAction;
}

- (void)setRichText:(YSRichText *)richText {
    _richText = richText;
    
    [self setNeedsDisplay];
}

- (void)defaultConfig {
    
    self.backgroundColor = [UIColor whiteColor];
    self.userInteractionEnabled = YES;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self defaultConfig];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self defaultConfig];
    }
    return self;
}

- (instancetype)initWithRichText:(YSRichText *)richText {
    self = [super initWithFrame:CGRectMake(0, 0, richText.w, richText.h)];
    if (self) {
        [self defaultConfig];
        self.richText = richText;
    }
    return self;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    CTFrameRef textFrame = _richText.ctFrame;
    CFArrayRef lines = CTFrameGetLines(textFrame);
    CFIndex count = CFArrayGetCount(lines);
    CGPoint origins[count];
    CTFrameGetLineOrigins(textFrame, CFRangeMake(0, 0), origins);
    
    CGAffineTransform tranform = CGAffineTransformMakeTranslation(0, self.bounds.size.height);
    tranform = CGAffineTransformScale(tranform, 1.f, -1.f);
    
    _haveEvent = NO;
    for (int i=0; i<count; i++) {
        CGPoint linePoint = origins[i];
        CTLineRef line = CFArrayGetValueAtIndex(lines, i);
        CGRect flippedRect = [self getLineBounds:line point:linePoint];
        CGRect rect = CGRectApplyAffineTransform(flippedRect, tranform);
        if (CGRectContainsPoint(rect, point)) {
            CGPoint relativePoint = CGPointMake(point.x-CGRectGetMinX(rect), point.y-CGRectGetMinY(rect));
            CFIndex idx = CTLineGetStringIndexForPosition(line, relativePoint);
            for (YSRichModel *model in _richText.clickActions) {
                NSRange range = model.range;
                if (NSLocationInRange(idx, range)) {
                    _clickAction = model.clickAction;
                    _haveEvent = YES;
                    _showHightlightedRange = YES;
                    _hightlightedRange = range;
                    _hightlightedBgColor = model.bgColor;
                    [self setNeedsDisplay];
                    break;
                }
            }
        }
    }
    if (!_haveEvent && _richText.highlightedColor) {
        _beforeColor = self.backgroundColor;
        [UIView animateWithDuration:0.3 animations:^{
            self.backgroundColor = _richText.highlightedColor;
        }];
    }
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesCancelled:touches withEvent:event];
    
    if (!_haveEvent && _richText.highlightedColor) {
        [UIView animateWithDuration:0.3 animations:^{
            self.backgroundColor = _beforeColor;
        }];
    }
    if (_showHightlightedRange) {
        _showHightlightedRange = NO;
        [self setNeedsDisplay];
    }
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesEnded:touches withEvent:event];
    
    if (!_haveEvent && _richText.highlightedColor) {
        [UIView animateWithDuration:0.3 animations:^{
            self.backgroundColor = _beforeColor;
        }];
    }
    if (_showHightlightedRange) {
        _showHightlightedRange = NO;
        if (_clickAction) {
            _clickAction();
        }
        _clickAction = nil;
        [self setNeedsDisplay];
    }
}

- (CGRect)getLineBounds:(CTLineRef)line point:(CGPoint)point {
    CGFloat ascent = 0.0f;
    CGFloat descent = 0.0f;
    CGFloat leading = 0.0f;
    CGFloat width = (CGFloat)CTLineGetTypographicBounds(line, &ascent, &descent, &leading);
    CGFloat height = ascent + descent;
    return CGRectMake(point.x, point.y, width, height);
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    if (_showHightlightedRange) {
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextSetTextMatrix(context, CGAffineTransformIdentity);
        CGContextTranslateCTM(context, 0, _richText.h);
        CGContextScaleCTM(context, 1.0, -1.0);
        CTFrameDraw([_richText ctFrameWithHightlightedRange:_hightlightedRange bgColor:_hightlightedBgColor], context);
    } else {
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextSetTextMatrix(context, CGAffineTransformIdentity);
        CGContextTranslateCTM(context, 0, _richText.h);
        CGContextScaleCTM(context, 1.0, -1.0);
        CTFrameDraw(_richText.ctFrame, context);
    }
}



@end
