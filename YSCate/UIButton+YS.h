//
//  UIButton+YS.h
//  YS
//
//  Created by Rocky on 2018/4/16.
//  Copyright © 2018年 任皖鹏. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^BottomActionBlock)(UIButton *btn);

@interface UIButton (YS)

@property (readonly) NSMutableDictionary *event;

- (void)handleControlEvent:(UIControlEvents)controlEvent withBlock:(BottomActionBlock)block;

- (void)setBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state;

- (void)startTimeWithDuration:(NSInteger)duration;

@end
