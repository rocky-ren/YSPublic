//
//  YSConstant.h
//  YS
//
//  Created by Rocky on 2018/5/5.
//  Copyright © 2018年 任皖鹏. All rights reserved.
//

#ifndef YSConstant_h
#define YSConstant_h

//单例化一个类
#define SINGLETON_FOR_IMPLEMENTATION(classname) \
\
static classname *shared##classname = nil; \
\
+ (classname *)shared##classname \
{ \
@synchronized(self) \
{ \
if (shared##classname == nil) \
{ \
shared##classname = [[self alloc] init]; \
} \
} \
\
return shared##classname; \
} \
\
+ (id)allocWithZone:(NSZone *)zone \
{ \
@synchronized(self) \
{ \
if (shared##classname == nil) \
{ \
shared##classname = [super allocWithZone:zone]; \
return shared##classname; \
} \
} \
return nil; \
} \
\
- (id)copyWithZone:(NSZone *)zone \
{ \
return self; \
}

#define SINGLETON_FOR_INTERFACE(classname) \
\
+ (classname *)shared##classname; \



#define kScWidth [UIScreen mainScreen].bounds.size.width
#define kScHeight [UIScreen mainScreen].bounds.size.height

#define COLOR(R, G, B, A) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]
#define UIColorFromRGBX(rgbValue, alp) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16)) / 255.0 \
green:((float)((rgbValue & 0xFF00) >> 8)) / 255.0 \
blue:((float)(rgbValue & 0xFF)) / 255.0 \
alpha:alp]


#endif /* YSConstant_h */
