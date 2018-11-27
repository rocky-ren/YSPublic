//
//  RSimplenessInputView.m
//  YSPublicDemo
//
//  Created by rocky on 2018/8/6.
//  Copyright © 2018年 rocky. All rights reserved.
//

#import "RSimplenessInputView.h"
#import "UITextView+YS.h"
#import "NSString+YS.h"
#import "UIView+Alert.h"

@interface RSimplenessInputView ()

@property (strong, nonatomic) UIView *viewTVBG;
@property (strong, nonatomic) UITextView *tv;
@property (strong, nonatomic) UIButton *btn;

@property (assign, nonatomic) CGFloat keyFrameHeight;

@end

@implementation RSimplenessInputView

- (instancetype)initWithPlaceHolder:(NSString *)placeHolder sendBtnTitle:(NSString *)btnTitle {
    self = [super initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.height, 0, [UIScreen mainScreen].bounds.size.width, 60)];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        
        self.viewTVBG.frame = CGRectMake(10, 10, self.frame.size.width-70, 40);
        self.tv.frame = CGRectMake(20, 12, self.frame.size.width-90, 36);
        self.btn.frame = CGRectMake(self.frame.size.width-70, 0, 70, 60);
        
        [self.tv addPlaceHolder:placeHolder];
        [self.btn setTitle:btnTitle forState:UIControlStateNormal];
        
        [self addSubview:self.viewTVBG];
        [self addSubview:self.tv];
        [self addSubview:self.btn];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillChangeFrameNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textViewDidChangeNoti:) name:UITextViewTextDidChangeNotification object:nil];
    }
    return self;
}

- (void)show {
    [[UIApplication sharedApplication].keyWindow showSheetWithView:self dismissAuto:YES willHide:^{
        [self.tv resignFirstResponder];
    }];
    [self.tv becomeFirstResponder];
}

#pragma mark - noti
- (void)keyboardWillShow:(NSNotification *)noti {
    id obj = noti.userInfo;
    CGRect keyFrame = [[obj objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGFloat keyHeight = keyFrame.size.height;
    CGFloat duration = [[obj objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];
    
    self.keyFrameHeight = keyHeight;
    
    [UIView animateWithDuration:duration animations:^{
        CGRect frame = self.frame;
        frame.origin.y = [UIScreen mainScreen].bounds.size.height-keyHeight-frame.size.height;
        self.frame = frame;
    }];
}

- (void)keyboardWillHide:(NSNotification *)noti {
    id obj = noti.object;
    CGFloat duration = [[obj objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];
    
    self.keyFrameHeight = 0;
    
    [UIView animateWithDuration:duration animations:^{
        CGRect frame = self.frame;
        frame.origin.y = [UIScreen mainScreen].bounds.size.height;
        self.frame = frame;
    }];
}

- (void)textViewDidChangeNoti:(NSNotification *)noti {
    NSLog(@"%@", self.tv.text);
    CGSize size = [self.tv.text ys_sizeWithFont:self.tv.font constrainedToWidth:self.tv.frame.size.width-10];
    size.height += 16;
    
    if (size.height > 100) {
        size.height = 100;
    }
    if (size.height <= 36 && self.tv.frame.size.height == 36) {
        return;
    }
    
    if (size.height == self.tv.frame.size.height) {
        return;
    }
    
    CGFloat dx = size.height - 36;
    self.frame = CGRectMake(self.frame.origin.x, [UIScreen mainScreen].bounds.size.height-(60+dx)-self.keyFrameHeight, self.frame.size.width, 60+dx);
    self.tv.frame = CGRectMake(self.tv.frame.origin.x, self.tv.frame.origin.y, self.tv.frame.size.width, 36+dx);
    self.viewTVBG.frame = CGRectMake(self.viewTVBG.frame.origin.x, self.viewTVBG.frame.origin.y, self.viewTVBG.frame.size.width, 40+dx);
    
}

#pragma mark - setter
- (void)setText:(NSString *)text {
    _text = text;
    self.tv.text = text;
}

- (void)setPlaceHolder:(NSString *)placeHolder {
    _placeHolder = placeHolder;
    [self.tv addPlaceHolder:placeHolder];
}

#pragma mark - getter

- (UIView *)viewTVBG {
    if (!_viewTVBG) {
        _viewTVBG = [[UIView alloc] init];
        _viewTVBG.layer.masksToBounds = YES;
        _viewTVBG.layer.borderWidth = 1.0f;
        _viewTVBG.layer.cornerRadius = 20.0f;
        _viewTVBG.layer.borderColor = [UIColor lightGrayColor].CGColor;
    }
    return _viewTVBG;
}

- (UITextView *)tv {
    if (!_tv) {
        _tv = [[UITextView alloc] init];
        _tv.backgroundColor = [UIColor clearColor];
        _tv.textColor = [UIColor blackColor];
        _tv.font = [UIFont systemFontOfSize:16];
    }
    return _tv;
}

- (UIButton *)btn {
    if (!_btn) {
        _btn = [UIButton buttonWithType:UIButtonTypeSystem];
        [_btn.titleLabel setFont:[UIFont systemFontOfSize:16]];
        [_btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    return _btn;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


@end
