//
//  JRTTMenus.h
//  YS
//
//  Created by Rocky on 2018/7/8.
//  Copyright © 2018年 任皖鹏. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JRTTMenus : UIView

@property (strong, nonatomic) NSArray *titles;

@property (assign, nonatomic) CGFloat offset;

@property (assign, nonatomic) NSInteger index;

@property (copy, nonatomic) void (^clickAtIndex)(NSInteger index);

@end
