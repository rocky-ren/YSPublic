//
//  VCMenus.h
//  YS
//
//  Created by Rocky on 2018/7/7.
//  Copyright © 2018年 任皖鹏. All rights reserved.
//

#import <UIKit/UIKit.h>

@class VCMenus;

@protocol VCMenusDelegate <NSObject>

@required

- (NSInteger)numberOfVCMenus:(VCMenus *)vcmenus;

- (UIViewController *)vCMenus:(VCMenus *)vcmenus index:(NSInteger)index;

- (UIView *)menusViewOfVCMenus:(VCMenus *)vcmenus;

- (void)vCMenus:(VCMenus *)vcmenus menusView:(UIView *)menusView offset:(CGFloat)offset;

@end




@interface VCMenus : UIView

@property (weak, nonatomic) id <VCMenusDelegate> delegate;

@property (assign, nonatomic, readonly) NSInteger scrollAtIndex;

- (instancetype)initWithFrame:(CGRect)frame observer:(id)observer;

- (UIViewController *)vcAtIndex:(NSInteger)index;

- (void)scrollAtIndex:(NSInteger)index animated:(BOOL)animated;

- (void)reloadData;

@end


