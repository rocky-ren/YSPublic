//
//  VCMenus.m
//  YS
//
//  Created by Rocky on 2018/7/7.
//  Copyright © 2018年 任皖鹏. All rights reserved.
//

#import "VCMenus.h"
#import "YSCate.h"

@interface VCMenus () <UIScrollViewDelegate>

@property (strong, nonatomic) NSMutableDictionary *dic;
@property (strong, nonatomic) UIScrollView *scrollView;
@property (assign, nonatomic) NSInteger number;
@property (strong, nonatomic) UIView *protocalMenuView;
@property (strong, nonatomic) id observer;

@end

@implementation VCMenus

- (instancetype)initWithFrame:(CGRect)frame observer:(id)observer {
    self = [super initWithFrame:frame];
    if (self) {
        self.observer = observer;
        self.dic = [NSMutableDictionary dictionary];
        self.clipsToBounds = YES;
    }
    return self;
}

- (void)reloadData {
    [self.dic removeAllObjects];
    for (UIView *view in self.scrollView.subviews) {
        [view removeFromSuperview];
    }
    
    self.number = [self.delegate numberOfVCMenus:self];
    [self addSubview:self.scrollView];
    self.scrollView.frame = self.bounds;
    self.scrollView.contentSize = CGSizeMake(self.frame.size.width*self.number, self.frame.size.height);
    
    self.protocalMenuView = [self.delegate menusViewOfVCMenus:self];
    [self addSubview:self.protocalMenuView];
    
    CGPoint p = self.scrollView.contentOffset;
    NSInteger index = (p.x + self.frame.size.width-0.1) / self.frame.size.width;
    if (index > (self.number-1)) {
        index = self.number-1;
    }
    _scrollAtIndex = index;
    [self addVCViewAtIndex:index];
}

- (void)addVCViewAtIndex:(NSInteger)index {
    UIViewController *vc = [self.delegate vCMenus:self index:index];
    [vc removeFromParentViewController];
    [self.observer addChildViewController:vc];
    UIView *vcview = vc.view;
    vcview.frame = CGRectMake(self.frame.size.width*index,
                              self.protocalMenuView.frame.size.height,
                              self.frame.size.width,
                              self.frame.size.height-self.protocalMenuView.frame.size.height);
    [self.scrollView addSubview:vcview];
    [self.dic setObject:vc forKey:@(index).stringValue];
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    [self reloadData];
}


- (UIViewController *)vcAtIndex:(NSInteger)index {
    return [self.dic objectForKeyNotNil:@(index).stringValue];
}

- (void)scrollAtIndex:(NSInteger)index animated:(BOOL)animated {
    if (_scrollAtIndex == index) {
        return;
    }
    CGPoint p = CGPointMake(index*self.frame.size.width, 0);
    if (animated) {
        [UIView animateWithDuration:0.3 animations:^{
            self.scrollView.contentOffset = p;
        }];
    } else {
        self.scrollView.contentOffset = p;
    }
    
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGPoint p = self.scrollView.contentOffset;
    NSInteger index = (p.x + self.frame.size.width-0.1) / self.frame.size.width;
    if (index > (self.number-1)) {
        index = self.number-1;
    }
    [self.delegate vCMenus:self menusView:self.protocalMenuView offset:p.x];
    
    if (self.scrollAtIndex == index) {
        return;
    }
    _scrollAtIndex = index;
    if (![self.dic objectForKeyNotNil:@(index).stringValue]) {
        [self addVCViewAtIndex:index];
    } else {
        [self.delegate vCMenus:self index:index];
    }
}

#pragma mark - getter
- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] init];
        _scrollView.pagingEnabled = YES;
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.backgroundColor = [UIColor whiteColor];
        _scrollView.clipsToBounds = YES;
        _scrollView.delegate = self;
        _scrollView.bounces = NO;
    }
    return _scrollView;
}

@end

