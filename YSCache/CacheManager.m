//
//  CacheManager.m
//  YS
//
//  Created by Rocky on 2018/4/16.
//  Copyright © 2018年 任皖鹏. All rights reserved.
//

#import "CacheManager.h"

@implementation CacheManager

+ (BOOL)saveData:(NSData *)data key:(NSString *)key cate:(NSString *)cate {
    return YES;
}

+ (NSData *)dataForKey:(NSString *)key cate:(NSString *)cate {
    return nil;
}

+ (void)removeForKey:(NSString *)key cate:(NSString *)cate {
    
}

+ (void)removeForCate:(NSString *)cate {
    
}

+ (void)celarAllCache {
    
}

+ (NSInteger)sizeForCate:(NSString *)cate {
    return 0;
}

+ (NSInteger)allSize {
    return 0;
}

@end
