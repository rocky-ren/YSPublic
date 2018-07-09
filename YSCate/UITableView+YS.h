//
//  UITableView+YS.h
//  YS
//
//  Created by Rocky on 2018/4/16.
//  Copyright © 2018年 任皖鹏. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (YS)

+ (void)setEmptyView:(UIView *)emptyView;

+ (void)setNetErrorView:(UIView *)errorView;

- (void)showDataEmpty;

- (void)showNetError;

@end
