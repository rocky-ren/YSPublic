//
//  RSimplenessInputView.h
//  YSPublicDemo
//
//  Created by rocky on 2018/8/6.
//  Copyright © 2018年 rocky. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ClickSure)(NSString *str);

@interface RSimplenessInputView : UIView

- (instancetype)initWithPlaceHolder:(NSString *)placeHolder sendBtnTitle:(NSString *)btnTitle;

@property (copy, nonatomic) NSString *text;
@property (copy, nonatomic) NSString *placeHolder;

@property (copy, nonatomic) ClickSure clickSure;

- (void)show;

@end
