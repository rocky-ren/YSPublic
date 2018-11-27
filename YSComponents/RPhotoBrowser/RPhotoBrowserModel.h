//
//  RPhotoBrowserModel.h
//  YSPublicDemo
//
//  Created by rocky on 2018/7/11.
//  Copyright © 2018年 rocky. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface RPhotoBrowserModel : NSObject

@property (copy, nonatomic) NSString *originalUrl;
@property (copy, nonatomic) NSString *thumbUrl;

@property (strong, nonatomic) UIView *v;

@end
