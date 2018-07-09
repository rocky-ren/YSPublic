//
//  YSAlert.h
//  YS
//
//  Created by rocky on 2018/7/3.
//  Copyright © 2018年 任皖鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void(^ClickCancel)(UIView *view);
typedef void(^ClickAtIndex)(NSInteger index, UIView *view);
typedef void(^ClickAtIndexPath)(NSIndexPath *indexPath, UIView *view);


@interface YSAlert : NSObject

+ (void)showSheetWithTitle:(NSAttributedString *)title
                    cancel:(NSAttributedString *)cancel
                    others:(NSArray<NSAttributedString *> *)others
              clickAtIndex:(ClickAtIndex)clickAtIndex
               clickCancel:(ClickCancel)clickCancel;

+ (void)showSheetMenuWithTitle:(NSAttributedString *)title
                        cancel:(NSAttributedString *)cancel
                         menus:(NSArray *)menus
              clickAtIndexPath:(ClickAtIndexPath)clickAtIndexPath
                   clickCancel:(ClickCancel)clickCancel;


@end
