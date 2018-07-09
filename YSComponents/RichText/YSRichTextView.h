//
//  YSRichTextView.h
//  YS
//
//  Created by rocky on 2018/7/2.
//  Copyright © 2018年 任皖鹏. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "YSRichText.h"

@interface YSRichTextView : UIView

- (instancetype)initWithRichText:(YSRichText *)richText;

@property (strong, nonatomic) YSRichText *richText;

@end
