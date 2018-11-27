//
//  YSAlert+Normal.m
//  YS
//
//  Created by rocky on 2018/7/3.
//  Copyright © 2018年 任皖鹏. All rights reserved.
//

#import "YSAlert+Normal.h"

#import "UIView+Alert.h"

#import "YSCate.h"

@implementation YSAlert (Normal)

+ (void)updateAvatarSheet:(ClickAtIndex)clickAtIndex {
    
    NSMutableAttributedString *title = [[NSMutableAttributedString alloc] init];
    [title appendStr:@"请选择" font:[UIFont systemFontOfSize:12] textColor:[UIColor darkGrayColor]];
    
    NSMutableAttributedString *cancel = [[NSMutableAttributedString alloc] init];
    [cancel appendStr:@"取消" font:[UIFont systemFontOfSize:18] textColor:[UIColor blackColor]];
    if ([UIApplication sharedApplication].statusBarFrame.size.height-20) {
        [cancel appendStr:@"\n" font:[UIFont systemFontOfSize:18] textColor:[UIColor blackColor]];
    }
    
    NSMutableAttributedString *photo = [[NSMutableAttributedString alloc] init];
    [photo appendStr:@"从手机相册选择" font:[UIFont systemFontOfSize:17] textColor:[UIColor blackColor]];
    
    NSMutableAttributedString *camera = [[NSMutableAttributedString alloc] init];
    [camera appendStr:@"拍照" font:[UIFont systemFontOfSize:17] textColor:[UIColor blackColor]];
    [camera appendStr:@"\n照片或视频" font:[UIFont systemFontOfSize:12] textColor:[UIColor lightGrayColor]];
    
    [self showSheetWithTitle:title cancel:cancel others:@[photo, camera] clickAtIndex:clickAtIndex clickCancel:^(UIView *view) {
        
        //UIWindow *window = [UIApplication sharedApplication].keyWindow;
        //[window hideSheetWithView:view];
        [view hideSheet];
    }];
}


+ (void)showMenu:(ClickAtIndexPath)clickAtIndexPath {
    NSMutableAttributedString *cancel = [[NSMutableAttributedString alloc] init];
    [cancel appendStr:@"取消" font:[UIFont systemFontOfSize:18] textColor:[UIColor blackColor]];
    if ([UIApplication sharedApplication].statusBarFrame.size.height-20) {
        [cancel appendStr:@"\n" font:[UIFont systemFontOfSize:18] textColor:[UIColor blackColor]];
    }
    
    NSDictionary *dic = [self itemWithImageName:@"" title:@"发送给朋友"];
    
    NSMutableAttributedString *title = [[NSMutableAttributedString alloc] init];
    [title appendStr:@"此网页由 www.baidu.com 提供" font:[UIFont systemFontOfSize:12] textColor:[UIColor darkGrayColor]];
    [YSAlert showSheetMenuWithTitle:title
                             cancel:cancel
                              menus:@[@[dic, dic, dic, dic, dic, dic, dic], @[dic, dic, dic, dic, dic, dic, dic]]
                   clickAtIndexPath:^(NSIndexPath *indexPath, UIView *view) {
                       
                       NSLog(@"%zd, %zd", indexPath.row, indexPath.section);
                       //UIWindow *window = [UIApplication sharedApplication].keyWindow;
                       //[window hideSheetWithView:view];
                       [view hideSheet];
    } clickCancel:^(UIView *view) {
        
    }];
}

+ (NSDictionary *)itemWithImageName:(NSString *)imageName title:(NSString *)title {
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] init];
    [attr appendStr:title font:[UIFont systemFontOfSize:12] textColor:[UIColor darkGrayColor]];
    return @{@"imageName":imageName, @"title":attr};
}

@end
