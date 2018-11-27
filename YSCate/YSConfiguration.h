//
//  YSConfiguration.h
//  YSPublicDemo
//
//  Created by rocky on 2018/8/6.
//  Copyright © 2018年 rocky. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "YSConstant.h"

@interface YSConfiguration : NSObject

SINGLETON_FOR_INTERFACE(YSConfiguration)

@property (strong, nonatomic) UIView *tableViewNoData;
@property (strong, nonatomic) UIView *tableViewNetError;

@end
