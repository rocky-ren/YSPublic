//
//  JRTTMenus.m
//  YS
//
//  Created by Rocky on 2018/7/8.
//  Copyright © 2018年 任皖鹏. All rights reserved.
//

#import "JRTTMenus.h"
#import "YSConstant.h"
#import "YSCate.h"

#define min 0.9

#define R 0
#define G 0
#define B 0

#define R_ 206
#define G_ 53
#define B_ 53

//#define R 200
//#define G 200
//#define B 200
//
//#define R_ 0
//#define G_ 0
//#define B_ 0

@implementation JRTTMenus {
    UIScrollView *_scrollView;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.showsHorizontalScrollIndicator = NO;
        
        [self addSubview:_scrollView];
    }
    return self;
}

- (void)setTitles:(NSArray *)titles {
    _titles = titles;
    
    CGFloat x = 0;
    for (NSInteger i=0; i<titles.count; i++) {
        NSString *title = titles[i];
        UIButton *btn = [self btnFactoryWithTitle:title index:i];
        btn.frame = CGRectMake(x, btn.frame.origin.y, btn.frame.size.width, btn.frame.size.height);
        [_scrollView addSubview:btn];
        x = x+btn.frame.size.width;
    }
    _scrollView.contentSize = CGSizeMake(x, self.frame.size.height);
}

- (UIButton *)btnFactoryWithTitle:(NSString *)title index:(NSInteger)index {
    UIFont *font = [UIFont systemFontOfSize:18];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.tag = index+10;
    [btn.titleLabel setFont:font];
    
    if (index != 0 ) {
        btn.transform = CGAffineTransformMakeScale(min, min);
        [btn setTitle:title forState:UIControlStateNormal];
        [btn setTitleColor:COLOR(R, G, B, 1) forState:UIControlStateNormal];
    } else {
        [btn setTitle:title forState:UIControlStateNormal];
        [btn setTitleColor:COLOR(R_, G_, B_, 1) forState:UIControlStateNormal];
    }
    
    CGFloat w = [title ys_widthWithFont:font constrainedToHeight:self.frame.size.height];
    
    btn.frame = CGRectMake(0, 0, w+10, self.frame.size.height);
    
    __weak typeof(self) weakSelf = self;
    [btn handleControlEvent:UIControlEventTouchUpInside withBlock:^(UIButton *btn) {
        if (weakSelf.clickAtIndex) {
            weakSelf.clickAtIndex(btn.tag-10);
        }
    }];
    return btn;
}

- (UIButton *)btnAtIndex:(NSInteger)index {
    UIButton *btn = [_scrollView viewWithTag:index+10];
    return btn;
}

- (void)setOffset:(CGFloat)offset {
    
    if (offset < 0) {
        return;
    }
    if (offset > kScWidth*self.titles.count) {
        return;
    }
    int a = offset;
    int index = a / kScWidth;
    self.index = (a+kScWidth/2.0) / kScWidth;
    CGFloat max = 1-min;
    
    CGFloat left = max * ((offset-(index*kScWidth))/kScWidth);
    CGFloat right = max - left;
    
    for (UIView *view in _scrollView.subviews) {
        if ([view isKindOfClass:[UIButton class]]) {
            if (view.tag == 10+index) {
                CGFloat scale = 1-left;
                CGFloat percent = right*(1.0/(1-min));
                view.transform = CGAffineTransformMakeScale(scale, scale);
                CGFloat r = (R_-R)*percent + R;
                CGFloat g = (G_-G)*percent + G;
                CGFloat b = (B_-B)*percent + B;
                [(UIButton *)view setTitleColor:COLOR(r, g, b, 1) forState:UIControlStateNormal];
            } else if (view.tag == 11+index) {
                CGFloat scale = 1-right;
                CGFloat percent = left*10;
                view.transform = CGAffineTransformMakeScale(scale, scale);
                CGFloat r = (R_-R)*percent + R;
                CGFloat g = (G_-G)*percent + G;
                CGFloat b = (B_-B)*percent + B;
                [(UIButton *)view setTitleColor:COLOR(r, g, b, 1) forState:UIControlStateNormal];
            } else {
                view.transform = CGAffineTransformMakeScale(min, min);
                [(UIButton *)view setTitleColor:COLOR(R, G, B, 1) forState:UIControlStateNormal];
            }
        }
    }
}

- (void)setIndex:(NSInteger)index {
    if (_index == index) {
        return;
    }
    _index = index;
    
    UIButton *btn = [self btnAtIndex:index];
    CGFloat x1 = btn.frame.origin.x;
    CGFloat x2 = x1-(kScWidth-btn.frame.size.width)/2.0;
    if (x2 < 0) {
        x2 = 0;
    }
    if (x2 > _scrollView.contentSize.width-kScWidth) {
        x2 = _scrollView.contentSize.width-kScWidth;
    }
    CGPoint p = CGPointMake(x2, 0);
    [UIView animateWithDuration:0.5 animations:^{
        _scrollView.contentOffset = p;
    }];
}

@end



