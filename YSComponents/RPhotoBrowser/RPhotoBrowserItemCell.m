//
//  RPhotoBrowserItemCell.m
//  YSPublicDemo
//
//  Created by rocky on 2018/7/11.
//  Copyright © 2018年 rocky. All rights reserved.
//

#import "RPhotoBrowserItemCell.h"

@interface RPhotoBrowserItemCell () <UIScrollViewDelegate>

@property (strong, nonatomic) UIScrollView *scrollView;
@property (strong, nonatomic) UIImageView *imgV;

@end

@implementation RPhotoBrowserItemCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.contentView.backgroundColor = [UIColor clearColor];
        
        [self.contentView addSubview:self.scrollView];
    }
    return self;
}

- (nullable UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    
    return self.imgV;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {

}

- (void)scrollViewDidZoom:(UIScrollView *)scrollView {
    CGFloat scale = scrollView.zoomScale;
    
    CGFloat imgw1 = self.imgV.image.size.width;
    CGFloat imgh1 = self.imgV.image.size.height;
    
    CGFloat w1 = self.frame.size.width;
    CGFloat h1 = self.frame.size.height;
    
    if (imgw1 / imgh1 > w1 / h1) {
        CGFloat imgw2 = w1;
        CGFloat imgh2 = imgh1/imgw1*imgw2;
        CGFloat imgh3 = imgh2 * scale;
        CGFloat h2 = h1*scale;
        
        if (h1 < imgh3) {
            CGFloat dh = h2 - imgh3;
            scrollView.contentInset = UIEdgeInsetsMake(-dh/2.0, 0, -dh/2.0, 0);
        } else {
            CGFloat dh = h2 - h1;
            scrollView.contentInset = UIEdgeInsetsMake(-dh/2.0, 0, -dh/2.0, 0);
        }
    } else {
        CGFloat imgh2 = h1;
        CGFloat imgw2 = imgw1/imgh1*imgh2;
        CGFloat imgw3 = imgw2 * scale;
        CGFloat w2 = w1*scale;
        
        if (w1 < imgw3) {
            CGFloat dw = w2 - imgw3;
            scrollView.contentInset = UIEdgeInsetsMake(0, -dw/2.0, 0, -dw/2.0);
        } else {
            CGFloat dw = w2 - w1;
            scrollView.contentInset = UIEdgeInsetsMake(0, -dw/2.0, 0, -dw/2.0);
        }
    }
}

- (void)setModel:(RPhotoBrowserModel *)model {
    _model = model;
    self.scrollView.zoomScale = 1;
}

#pragma mark - getter
- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.delegate = self;
        _scrollView.maximumZoomScale = 2.0;
        _scrollView.minimumZoomScale = 1;
        _scrollView.contentSize = self.imgV.image.size;
        _scrollView.zoomScale = 1;
        [_scrollView addSubview:self.imgV];
    }
    return _scrollView;
}

- (UIImageView *)imgV {
    if (!_imgV) {
        _imgV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"default"]];
        _imgV.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height+1);
        _imgV.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _imgV;
}

@end
