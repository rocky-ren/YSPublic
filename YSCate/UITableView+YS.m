//
//  UITableView+YS.m
//  YS
//
//  Created by Rocky on 2018/4/16.
//  Copyright © 2018年 任皖鹏. All rights reserved.
//

#import "UITableView+YS.h"
#import "YSConfiguration.h"

@implementation UITableView (YS)

+ (void)ys_setEmptyView:(UIView *)emptyView {
    [YSConfiguration sharedYSConfiguration].tableViewNoData = emptyView;
}

+ (void)ys_setNetErrorView:(UIView *)errorView {
    [YSConfiguration sharedYSConfiguration].tableViewNetError = errorView;
}

- (void)ys_showDataEmpty {
    [self ys_hideTipView];
    CGFloat dy = [UIApplication sharedApplication].statusBarFrame.size.height+44;
    CGRect frame1 = [YSConfiguration sharedYSConfiguration].tableViewNoData.frame;
    CGRect frame2 = CGRectMake((self.frame.size.width-frame1.size.width)/2.0, (self.frame.size.height-frame1.size.height)/2.0-dy, frame1.size.width, frame1.size.height);
    [YSConfiguration sharedYSConfiguration].tableViewNoData.frame = frame2;
    [self addSubview:[YSConfiguration sharedYSConfiguration].tableViewNoData];
}

- (void)ys_showNetError {
    [self ys_hideTipView];
    CGFloat dy = [UIApplication sharedApplication].statusBarFrame.size.height+44;
    CGRect frame1 = [YSConfiguration sharedYSConfiguration].tableViewNetError.frame;
    CGRect frame2 = CGRectMake((self.frame.size.width-frame1.size.width)/2.0, (self.frame.size.height-frame1.size.height)/2.0-dy, frame1.size.width, frame1.size.height);
    [YSConfiguration sharedYSConfiguration].tableViewNetError.frame = frame2;
    [self addSubview:[YSConfiguration sharedYSConfiguration].tableViewNetError];
}

- (void)ys_hideTipView {
    [[YSConfiguration sharedYSConfiguration].tableViewNoData removeFromSuperview];
    [[YSConfiguration sharedYSConfiguration].tableViewNetError removeFromSuperview];
}

@end
