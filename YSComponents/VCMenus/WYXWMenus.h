//
//  WYXWMenus.h
//  YSPublicDemo
//
//  Created by rocky on 2018/8/4.
//  Copyright © 2018年 rocky. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WYXWMenus : UIView

@property (strong, nonatomic) NSArray *titles;

@property (assign, nonatomic) CGFloat offset;

@property (assign, nonatomic) NSInteger index;

@property (copy, nonatomic) void (^clickAtIndex)(NSInteger index);

@end
