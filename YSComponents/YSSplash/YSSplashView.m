//
//  YSSplashUtil.m
//  YSPublicDemo
//
//  Created by rocky on 2018/8/1.
//  Copyright © 2018年 rocky. All rights reserved.
//

#import "YSSplashView.h"

@interface YSSplashView ()

@property (strong, nonatomic) UIScrollView *scrollView;
@property (strong, nonatomic) NSArray *views;

@end

@implementation YSSplashView
{
    ClickSkip _clickSkip;
}

- (instancetype)initWithViews:(NSArray<UIView *> *)views {
    self = [super initWithFrame:[UIScreen mainScreen].bounds];
    if (self) {
        [self addSubview:self.scrollView];
        
        self.scrollView.contentSize = CGSizeMake(self.frame.size.width*views.count, self.frame.size.height);
        for (int i=0; i<views.count; i++) {
            UIView *v = views[i];
            v.frame = CGRectMake(self.frame.size.width*i, 0, self.frame.size.width, self.frame.size.height);
            [self.scrollView addSubview:v];
        }
    }
    return self;
}

- (instancetype)initWithImages:(NSArray<UIImage *> *)imgs {
    NSMutableArray *imgVS = [NSMutableArray array];
    for (UIImage *img in imgs) {
        UIImageView *imgV = [[UIImageView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        imgV.image = img;
        imgV.clipsToBounds = YES;
        imgV.contentMode = UIViewContentModeScaleAspectFill;
        [imgVS addObject:imgV];
    }
    return [self initWithViews:imgVS.copy];
}

- (void)addSkipButton:(UIButton *)btn inPage:(NSInteger)index {
    CGRect btnFrame = btn.frame;
    btnFrame.origin.x += [UIScreen mainScreen].bounds.size.width*index;
    btn.frame = btnFrame;
    [btn addTarget:self action:@selector(actionClickCkip) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollView addSubview:btn];
}

- (void)showInWindow:(UIWindow *)window clickSkip:(ClickSkip)clickSkip {
    _clickSkip = clickSkip;

    NSString *isFirst = [[NSUserDefaults standardUserDefaults] objectForKey:@"YSSplashView_isFirst"];
    if (!isFirst) {
        [[NSUserDefaults standardUserDefaults] setObject:@"Y" forKey:@"YSSplashView_isFirst"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        UIViewController *vc = [[UIViewController alloc] init];
        [vc.view addSubview:self];
        window.rootViewController = vc;
    }
}

- (void)actionClickCkip {
    _clickSkip();
}

#pragma mark - getter
- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.pagingEnabled = YES;
        _scrollView.bounces = NO;
        _scrollView.backgroundColor = [UIColor whiteColor];
    }
    return _scrollView;
}

@end
