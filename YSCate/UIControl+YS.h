//
//  UIControl+YS.h
//  YS
//
//  Created by rocky on 2018/7/3.
//  Copyright © 2018年 任皖鹏. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^ControlActionBlock)(UIControl *control);

@interface UIControl (YS)

- (void)handleControlEvent:(UIControlEvents)controlEvent withBlock:(ControlActionBlock)block;

@end
