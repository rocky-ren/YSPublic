//
//  NSDate+YS.h
//  YS
//
//  Created by Rocky on 2018/4/17.
//  Copyright © 2018年 任皖鹏. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (YS)

- (NSString *)ys_ToString:(NSString *)format;

- (NSString *)ys_ToyyyyMMddHHmmss;

- (NSString *)ys_ToMMddHHmm;

- (NSString *)ys_ToHHmm;

- (NSString *)ys_Normal;

+ (NSDate *)ys_dateByString:(NSString *)strTime format:(NSString *)format;

+ (NSDate *)ys_dateByyyyyMMddHHmmssString:(NSString *)strTime;

+ (NSDate *)ys_dateByMMddHHmmString:(NSString *)strTime;

+ (NSDate *)ys_dateByHHmmString:(NSString *)strTime;

@end
