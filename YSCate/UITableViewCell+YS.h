//
//  UITableViewCell+YS.h
//  YS
//
//  Created by Rocky on 2018/4/16.
//  Copyright © 2018年 任皖鹏. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableViewCell (YS)

- (void)addLongTap:(void(^)(UITableViewCell *cell))call;

@end
