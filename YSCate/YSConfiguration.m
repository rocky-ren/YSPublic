//
//  YSConfiguration.m
//  YSPublicDemo
//
//  Created by rocky on 2018/8/6.
//  Copyright © 2018年 rocky. All rights reserved.
//

#import "YSConfiguration.h"

@implementation YSConfiguration

SINGLETON_FOR_IMPLEMENTATION(YSConfiguration)

- (instancetype)init {
    self = [super init];
    if (self) {
        
        UILabel *lblNetError = [[UILabel alloc] initWithFrame:CGRectZero];
        lblNetError.text = @"网络异常";
        lblNetError.font = [UIFont systemFontOfSize:26];
        lblNetError.textColor = [UIColor blackColor];
        [lblNetError sizeToFit];
        
        UILabel *lblNoData = [[UILabel alloc] initWithFrame:CGRectZero];
        lblNoData.text = @"暂无数据";
        lblNoData.font = [UIFont systemFontOfSize:26];
        lblNoData.textColor = [UIColor blackColor];
        [lblNoData sizeToFit];
        
        self.tableViewNetError = lblNetError;
        self.tableViewNoData = lblNoData;
    }
    return self;
}


@end
