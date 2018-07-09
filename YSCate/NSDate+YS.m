//
//  NSDate+YS.m
//  YS
//
//  Created by Rocky on 2018/4/17.
//  Copyright © 2018年 任皖鹏. All rights reserved.
//

#import "NSDate+YS.h"

@implementation NSDate (YS)

- (NSString *)ys_ToString:(NSString *)format {
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setLocale:[NSLocale currentLocale]];
    [formatter setDateFormat:format];
    NSString *currentTime = [formatter stringFromDate:self];
    
    return currentTime;
}

- (NSString *)ys_ToyyyyMMddHHmmss {
    return [self ys_ToString:@"yyyy-MM-dd HH:mm:ss"];
}

- (NSString *)ys_ToMMddHHmm {
    return [self ys_ToString:@"MM-dd HH:mm"];
}

- (NSString *)ys_ToHHmm {
    return [self ys_ToString:@"HH:mm"];
}

- (NSString *)ys_Normal {

    NSTimeInterval time = -[self timeIntervalSinceDate:[NSDate date]];
    NSTimeInterval retTime = 1.0;
    
    if (time < 60) {
        return @"刚刚";
    } else {
        if (time < 3600) {
            retTime = time / 60;
            retTime = retTime <= 0.0 ? 1.0 : retTime;
            return [NSString stringWithFormat:@"%.0f分钟前", retTime];
        } else if (time < 3600 * 24) {
            retTime = time / 3600;
            retTime = retTime <= 0.0 ? 1.0 : retTime;
            return [NSString stringWithFormat:@"%.0f小时前", retTime];
        } else if (time < 3600 * 24 * 2) {
            return @"昨天";
        } else {
            return [self ys_ToMMddHHmm];
        }
    }
}

+ (NSDate *)ys_dateByString:(NSString *)strTime format:(NSString *)format {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setLocale:[NSLocale currentLocale]];
    [formatter setDateFormat:format];
    
    return [formatter dateFromString:strTime];
}


+ (NSDate *)ys_dateByyyyyMMddHHmmssString:(NSString *)strTime {
    return [self ys_dateByString:strTime format:@"yyyy-MM-dd HH:mm:ss"];
}

+ (NSDate *)ys_dateByMMddHHmmString:(NSString *)strTime {
    return [self ys_dateByString:strTime format:@"MM-dd HH:mm"];
}

+ (NSDate *)ys_dateByHHmmString:(NSString *)strTime {
    return [self ys_dateByString:strTime format:@"HH:mm"];
}

@end
