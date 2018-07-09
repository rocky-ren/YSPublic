//
//  UITextView+YS.m
//  YS
//
//  Created by Rocky on 2018/4/16.
//  Copyright © 2018年 任皖鹏. All rights reserved.
//

#import "UITextView+YS.h"

#import <objc/runtime.h>

static const char *phTextView = "placeHolderTextView";

@interface UITextView () <UITextViewDelegate>

@property (nonatomic, strong) UITextView *placeHolderTextView;

@end

@implementation UITextView (YS)

- (UITextView *)placeHolderTextView {
    return objc_getAssociatedObject(self, phTextView);
}

- (void)setPlaceHolderTextView:(UITextView *)placeHolderTextView {
    objc_setAssociatedObject(self, phTextView, placeHolderTextView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)addPlaceHolder:(NSString *)placeHolder {
    if (![self placeHolderTextView]) {
        self.delegate = self;
        UITextView *textView = [[UITextView alloc] initWithFrame:self.bounds];
        textView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        textView.font = self.font;
        textView.backgroundColor = [UIColor clearColor];
        textView.textColor = [UIColor colorWithRed:200/255.0 green:200/255.0 blue:200/255.0 alpha:1];
        textView.userInteractionEnabled = NO;
        textView.text = placeHolder;
        [self addSubview:textView];
        [self setPlaceHolderTextView:textView];
        
        if (![@"" isEqualToString:self.text]) {
            self.placeHolderTextView.hidden = YES;
        }
    }
}

# pragma mark - UITextViewDelegate
- (void)textViewDidChange:(UITextView *)textView
{
    if ([textView.text isEqualToString:@""]) {
        self.placeHolderTextView.hidden = NO;
    } else {
        self.placeHolderTextView.hidden = YES;
    }
}


@end
