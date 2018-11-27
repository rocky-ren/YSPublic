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

+ (void)showWithSelects:(NSArray *)selects
          clickAtIndex:(ClickAtIndex)clickAtIndex {
    
    [self showWithSelects:selects
             cancelTitle:NSLocalizedString(@"取消", nil)
            clickAtIndex:clickAtIndex];
}

+ (void)showWithSelects:(NSArray *)selects
           cancelTitle:(NSString *)cancelTitle
          clickAtIndex:(ClickAtIndex)clickAtIndex {
    
    [self showWithTitle:nil
                selects:selects
            cancelTitle:cancelTitle
           clickAtIndex:clickAtIndex];
}

+ (void)showWithTitle:(NSString *)title
              selects:(NSArray *)selects
          cancelTitle:(NSString *)cancelTitle
         clickAtIndex:(ClickAtIndex)clickAtIndex {
    
    NSMutableAttributedString *attTitle = nil;
    if (title) {
        attTitle = [[NSMutableAttributedString alloc] init];
        [attTitle appendStr:title
                       font:[UIFont systemFontOfSize:12]
                  textColor:[UIColor darkGrayColor]];
    }
    
    NSMutableAttributedString *cancel = [[NSMutableAttributedString alloc] init];
    
    [cancel appendStr:cancelTitle
                 font:[UIFont systemFontOfSize:18]
            textColor:[UIColor blackColor]];
    
    if ([UIApplication sharedApplication].statusBarFrame.size.height-20) {
        
        [cancel appendStr:@"\n"
                     font:[UIFont systemFontOfSize:18]
                textColor:[UIColor blackColor]];
    }
    
    NSMutableArray *mTitles = [NSMutableArray array];
    for (NSString *select in selects) {
        NSMutableAttributedString *attTitle = [[NSMutableAttributedString alloc] init];
        
        [attTitle appendStr:select
                       font:[UIFont systemFontOfSize:17]
                  textColor:[UIColor blackColor]];
        
        [mTitles addObject:attTitle];
    }
    
    [self showSheetWithTitle:attTitle
                      cancel:cancel
                      others:mTitles.copy
                clickAtIndex:clickAtIndex
                 clickCancel:^(UIView *view) {
                     [view hideSheet];
                 }];
}

+ (void)updateAvatarSheet:(ClickAtIndex)clickAtIndex {
    
    NSMutableAttributedString *title = [[NSMutableAttributedString alloc] init];
    [title appendStr:@"请选择"
                font:[UIFont systemFontOfSize:12]
           textColor:[UIColor darkGrayColor]];
    
    NSMutableAttributedString *cancel = [[NSMutableAttributedString alloc] init];
    [cancel appendStr:@"取消"
                 font:[UIFont systemFontOfSize:18]
            textColor:[UIColor blackColor]];
    
    if ([UIApplication sharedApplication].statusBarFrame.size.height-20) {
        [cancel appendStr:@"\n"
                     font:[UIFont systemFontOfSize:18]
                textColor:[UIColor blackColor]];
    }
    
    NSMutableAttributedString *photo = [[NSMutableAttributedString alloc] init];
    [photo appendStr:@"从手机相册选择"
                font:[UIFont systemFontOfSize:17]
           textColor:[UIColor blackColor]];
    
    NSMutableAttributedString *camera = [[NSMutableAttributedString alloc] init];
    [camera appendStr:@"拍照"
                 font:[UIFont systemFontOfSize:17]
            textColor:[UIColor blackColor]];
    [camera appendStr:@"\n照片或视频"
                 font:[UIFont systemFontOfSize:12]
            textColor:[UIColor lightGrayColor]];
    
    [self showSheetWithTitle:title
                      cancel:cancel
                      others:@[photo, camera]
                clickAtIndex:clickAtIndex
                 clickCancel:^(UIView *view) {
                     [view hideSheet];
                 }];
}

+ (void)showWithTitle:(NSString *)title
                 menu:(NSArray *)menus
         clickAtIndex:(ClickAtIndexPath)clickAtIndex {
    
    NSMutableArray *arr = [NSMutableArray array];
    for (NSArray *menu in menus) {
        NSMutableArray *cArr = [NSMutableArray array];
        for (NSDictionary *dic in menu) {
            NSDictionary *ddic = [self itemWithImageName:[dic objectForKey:@"imgName"] title:[dic objectForKey:@"title"]];
            [cArr addObject:ddic];
        }
        [arr addObject:cArr];
    }
    
    NSMutableAttributedString *cancel = [[NSMutableAttributedString alloc] init];
    [cancel appendStr:NSLocalizedString(@"取消", nil)
                 font:[UIFont systemFontOfSize:18]
            textColor:[UIColor blackColor]];
    if ([UIApplication sharedApplication].statusBarFrame.size.height-20) {
        [cancel appendStr:@"\n" font:[UIFont systemFontOfSize:18] textColor:[UIColor blackColor]];
    }
    
    NSMutableAttributedString *attTitle = [[NSMutableAttributedString alloc] init];
    [attTitle appendStr:title font:[UIFont systemFontOfSize:12] textColor:[UIColor darkGrayColor]];
    
    [YSAlert showSheetMenuWithTitle:attTitle
                             cancel:cancel
                              menus:arr
                   clickAtIndexPath:clickAtIndex
                        clickCancel:^(UIView *view) {
              
                   }];
}

+ (NSDictionary *)itemWithImageName:(NSString *)imageName title:(NSString *)title {
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] init];
    [attr appendStr:title font:[UIFont systemFontOfSize:12] textColor:[UIColor darkGrayColor]];
    return @{@"imageName":imageName, @"title":attr};
}

@end

