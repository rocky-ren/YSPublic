//
//  UIControl+YS.m
//  YS
//
//  Created by rocky on 2018/7/3.
//  Copyright © 2018年 任皖鹏. All rights reserved.
//

#import "UIControl+YS.h"

#import <objc/runtime.h>

static char overviewKey;

@implementation UIControl (YS)

- (void)handleControlEvent:(UIControlEvents)controlEvent withBlock:(ControlActionBlock)block {
    objc_setAssociatedObject(self, &overviewKey, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(callActionBlock:) forControlEvents:controlEvent];
}

- (void)callActionBlock:(id)sender {
    ControlActionBlock block = (ControlActionBlock)objc_getAssociatedObject(self, &overviewKey);
    if (block) { block(self); }
}

@end
