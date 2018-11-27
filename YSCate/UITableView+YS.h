//
//  UITableView+YS.h
//  YS
//
//  Created by Rocky on 2018/4/16.
//  Copyright © 2018年 任皖鹏. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (YS)

+ (void)ys_setEmptyView:(UIView *)emptyView;

+ (void)ys_setNetErrorView:(UIView *)errorView;

- (void)ys_showDataEmpty;

- (void)ys_showNetError;

- (void)ys_hideTipView;

@end
