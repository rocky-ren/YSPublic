//
//  CacheManager.h
//  YS
//
//  Created by Rocky on 2018/4/16.
//  Copyright © 2018年 任皖鹏. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CacheManager : NSObject

+ (BOOL)saveData:(NSData *)data key:(NSString *)key cate:(NSString *)cate;

+ (NSData *)dataForKey:(NSString *)key cate:(NSString *)cate;

+ (void)removeForKey:(NSString *)key cate:(NSString *)cate;

+ (void)removeForCate:(NSString *)cate;

+ (void)celarAllCache;

+ (NSInteger)sizeForCate:(NSString *)cate;

+ (NSInteger)allSize;

@end
/////
