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
 无
 @param selects selects
 @param clickAtIndex 回调
 */
+ (void)showWithSelects:(NSArray *)selects
           clickAtIndex:(ClickAtIndex)clickAtIndex;

/**
 无
 @param selects selects
 @param cancelTitle cancelTitle
 @param clickAtIndex 回调
 */
+ (void)showWithSelects:(NSArray *)selects
            cancelTitle:(NSString *)cancelTitle
           clickAtIndex:(ClickAtIndex)clickAtIndex;


/**
 无
 @param title title
 @param selects selects
 @param cancelTitle cancelTitle
 @param clickAtIndex 回调
 */
+ (void)showWithTitle:(NSString *)title
              selects:(NSArray *)selects
          cancelTitle:(NSString *)cancelTitle
         clickAtIndex:(ClickAtIndex)clickAtIndex;

/**
 更改头像
 @param clickAtIndex 回调
 */
+ (void)updateAvatarSheet:(ClickAtIndex)clickAtIndex;


/**
 无
 @param title title
 @param menus @[@[@{@"imgName":@"imgName", @"title":@"title"}],@[@{@"imgName":@"imgName", @"title":@"title"}]]
 @param clickAtIndex 回调
 */
+ (void)showWithTitle:(NSString *)title
                 menu:(NSArray *)menus
         clickAtIndex:(ClickAtIndexPath)clickAtIndex;


@end
