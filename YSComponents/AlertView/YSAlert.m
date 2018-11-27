//
//  YSAlert.m
//  YS
//
//  Created by rocky on 2018/7/3.
//  Copyright © 2018年 任皖鹏. All rights reserved.
//

#import "YSAlert.h"

#import "UIView+Alert.h"

#import "YSCate.h"

#import "YSConstant.h"

#define kItemMenuCellH 130

@implementation YSAlert

+ (void)showSheetWithTitle:(NSAttributedString *)title
                    cancel:(NSAttributedString *)cancel
                    others:(NSArray<NSAttributedString *> *)others
              clickAtIndex:(ClickAtIndex)clickAtIndex
               clickCancel:(ClickCancel)clickCancel {
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    
    CGFloat itemH = 50;
    CGFloat w = [UIScreen mainScreen].bounds.size.width;
    CGFloat h = others.count*itemH+(others.count*(1.0/[UIScreen mainScreen].scale))+(title?(itemH+1.0/[UIScreen mainScreen].scale):0) + 10 + 44+[UIApplication sharedApplication].statusBarFrame.size.height-20;
    CGRect frame = CGRectMake(0, 0, w, h);
    
    UIBlurEffect *blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    UIVisualEffectView *effe = [[UIVisualEffectView alloc] initWithEffect:blur];
    effe.frame = frame;
    UIView *view = [[UIView alloc] initWithFrame:frame];
    [view addSubview:effe];
    view.backgroundColor = [UIColor clearColor];
    
    __block ClickAtIndex blockClickAtIndex = clickAtIndex;
    __block ClickCancel blockClickCancel = clickCancel;
    __block UIView *blockView = view;
    
    if (title) {
        UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, w, itemH)];
        lbl.backgroundColor = [UIColor whiteColor];
        lbl.textAlignment = NSTextAlignmentCenter;
        lbl.attributedText = title;
        lbl.numberOfLines = 0;
        [view addSubview:lbl];
    }
    
    UIButton *btnCancel = [self buttonFactoryWithAttr:cancel];
    CGFloat cancelFrameH = itemH+[UIApplication sharedApplication].statusBarFrame.size.height-20;
    CGRect cancelFrame = CGRectMake(0, h-cancelFrameH, w, cancelFrameH);
    btnCancel.frame = cancelFrame;
    [btnCancel handleControlEvent:UIControlEventTouchUpInside withBlock:^(UIButton *btn) {
        if (blockClickCancel) {
            blockClickCancel(blockView);
        }
    }];
    [view addSubview:btnCancel];
    
    CGFloat nowH = title?(itemH+1.0/[UIScreen mainScreen].scale):0;
    for (int i=0; i<others.count; i++) {
        NSAttributedString *attr = others[i];
        UIButton *btn = [self buttonFactoryWithAttr:attr];
        CGRect btnFrame = CGRectMake(0, nowH, w, itemH);
        btn.frame = btnFrame;
        nowH += itemH+1.0/[UIScreen mainScreen].scale;
        [view addSubview:btn];
        
        __block int blockI = i;
        [btn handleControlEvent:UIControlEventTouchUpInside withBlock:^(UIButton *btn) {
            if (blockClickAtIndex) {
                clickAtIndex(blockI, blockView);
                UIWindow *window = [UIApplication sharedApplication].keyWindow;
                [window hideSheetWithView:blockView];
            }
        }];
    }
    
    [window showSheetWithView:view dismissAuto:YES];
}

+ (void)showSheetMenuWithTitle:(NSAttributedString *)title
                        cancel:(NSAttributedString *)cancel
                         menus:(NSArray *)menus
              clickAtIndexPath:(ClickAtIndexPath)clickAtIndexPath
                   clickCancel:(ClickCancel)clickCancel {
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    
    CGFloat itemH = 50;
    CGFloat w = [UIScreen mainScreen].bounds.size.width;
    CGFloat h = kItemMenuCellH*menus.count + itemH + ([UIApplication sharedApplication].statusBarFrame.size.height-20)+(title?30:0);
    CGRect frame = CGRectMake(0, 0, w, h);
    
    UIBlurEffect *blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    UIVisualEffectView *effe = [[UIVisualEffectView alloc] initWithEffect:blur];
    effe.frame = frame;
    UIView *view = [[UIView alloc] initWithFrame:frame];
    [view addSubview:effe];
    view.backgroundColor = UIColorFromRGBX(0xFFFFFF, 0.6);
    
    __block ClickAtIndexPath blockClickAtIndexPath = clickAtIndexPath;
    __block ClickCancel blockClickCancel = clickCancel;
    __block UIView *blockView = view;
    
    if (title) {
        UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, w, 30)];
        lbl.backgroundColor = [UIColor clearColor];
        lbl.textAlignment = NSTextAlignmentCenter;
        lbl.attributedText = title;
        lbl.numberOfLines = 0;
        [view addSubview:lbl];
    }
    
    UIButton *btnCancel = [self buttonFactoryWithAttr:cancel];
    CGFloat cancelFrameH = itemH+[UIApplication sharedApplication].statusBarFrame.size.height-20;
    CGRect cancelFrame = CGRectMake(0, h-cancelFrameH, w, cancelFrameH);
    btnCancel.frame = cancelFrame;
    [btnCancel handleControlEvent:UIControlEventTouchUpInside withBlock:^(UIButton *btn) {
        if (blockClickCancel) {
            blockClickCancel(blockView);
        }
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        [window hideSheetWithView:blockView];
    }];
    [view addSubview:btnCancel];
    
    for (int i=0; i<menus.count; i++) {
        NSArray *chileMenus = menus[i];
        UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, (title?30:0)+kItemMenuCellH*i, w, kItemMenuCellH)];
        scrollView.showsHorizontalScrollIndicator = NO;
        scrollView.showsVerticalScrollIndicator = NO;
        if (i!=menus.count-1) {
            CALayer *layer = [[CALayer alloc] init];
            layer.backgroundColor = UIColorFromRGBX(0xBBBBBB, 1).CGColor;
            layer.frame = CGRectMake(14, (title?30:0)+kItemMenuCellH*(i+1), w-14, 1.0/[UIScreen mainScreen].scale);
            [view.layer addSublayer:layer];
        }
        scrollView.contentSize = CGSizeMake(chileMenus.count*(14+kItemMenuCellH/2.0)+14, scrollView.frame.size.height);
        for (int j=0; j<chileMenus.count; j++) {
            __block NSIndexPath *indexPath = [NSIndexPath indexPathForRow:j inSection:i];
            UIView *view = [self menuViewFactoryWithDic:chileMenus[j] click:^{
                if (blockClickAtIndexPath) {
                    blockClickAtIndexPath(indexPath, blockView);
                }
            }];
            view.frame = CGRectMake(j*(14+view.frame.size.width)+14, 0, view.frame.size.width, view.frame.size.height);
            [scrollView addSubview:view];
        }
        [view addSubview:scrollView];
    }
    
    [window showSheetWithView:view dismissAuto:YES];
}

typedef void(^Click)(void);
+ (UIView *)menuViewFactoryWithDic:(NSDictionary *)dic click:(Click)click {
    
    NSAttributedString *title = [dic objectForKey:@"title"];
    NSString *imageName = [dic objectForKey:@"imageName"];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kItemMenuCellH/2.0, kItemMenuCellH)];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setBackgroundColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    btn.layer.masksToBounds = YES;
    btn.layer.cornerRadius = 10.0f;
    btn.frame = CGRectMake(0, 14, view.frame.size.width, view.frame.size.width);
    [view addSubview:btn];
    
    UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(-6, view.frame.size.width+16+6, view.frame.size.width+12, 30)];
    lbl.numberOfLines = 2;
    lbl.textAlignment = NSTextAlignmentCenter;
    lbl.attributedText = title;
    [lbl sizeToFit];
    lbl.center = CGPointMake(view.center.x, lbl.center.y);
    [view addSubview:lbl];
    
    __block Click blockClick = click;
    [btn handleControlEvent:UIControlEventTouchUpInside withBlock:^(UIButton *btn) {
        if (blockClick) {
            blockClick();
        }
    }];
    
    return view;
}

+ (UIButton *)buttonFactoryWithAttr:(NSAttributedString *)attr {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn.titleLabel setNumberOfLines:0];
    [btn.titleLabel setTextAlignment:NSTextAlignmentCenter];
    [btn setAttributedTitle:attr forState:UIControlStateNormal];
    [btn setBackgroundColor:UIColorFromRGBX(0xFFFFFF, 1.0) forState:UIControlStateNormal];
    [btn setBackgroundColor:UIColorFromRGBX(0xFFFFFF, 0.3) forState:UIControlStateHighlighted];
    return btn;
}

@end
