//
//  UIImage+YS.h
//  YS
//
//  Created by Rocky on 2018/4/16.
//  Copyright © 2018年 任皖鹏. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (YS)


/**
 遮罩层, RGBA=(0, 0, 0, 0.6)

 @param maskRect 遮罩层的Rect
 @param clearRect 镂空的Rect

 @return 遮罩层图片
 */
+ (UIImage *)maskImageWithMaskRect:(CGRect)maskRect clearRect:(CGRect)clearRect;

@end
