//
//  YSAlert+Normal.h
//  YS
//
//  Created by rocky on 2018/7/3.
//  Copyright © 2018年 任皖鹏. All rights reserved.
//

#import "YSAlert.h"

@interface YSAlert (Normal)

/**
 更改头像
 @param clickAtIndex 回调
 */
+ (void)updateAvatarSheet:(ClickAtIndex)clickAtIndex;


/**
 menu
 @param clickAtIndexPath 回调
 */
+ (void)showMenu:(ClickAtIndexPath)clickAtIndexPath;


@end
