//
//  UITableViewCell+YS.m
//  YS
//
//  Created by Rocky on 2018/4/16.
//  Copyright © 2018年 任皖鹏. All rights reserved.
//

#import "UITableViewCell+YS.h"
#import <objc/runtime.h>

static const void *longPressBlock = &longPressBlock;

@implementation UITableViewCell (YS)


- (void(^)(UITableViewCell *cell))callBlock{
    return objc_getAssociatedObject(self, longPressBlock);
}

- (void)addLongTap:(void(^)(UITableViewCell *cell))call
{
    objc_setAssociatedObject(self, longPressBlock, call, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    UILongPressGestureRecognizer *longPressGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPress)];
    longPressGesture.minimumPressDuration = 1.0f;
    [self addGestureRecognizer:longPressGesture];
}

- (void)longPress
{
    [self callBlock](self);
}

@end
