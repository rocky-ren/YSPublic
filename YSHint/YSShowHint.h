//
//  YSShowHint.h
//  YS
//
//  Created by Rocky on 2018/4/16.
//  Copyright © 2018年 任皖鹏. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, YSHint) {
    YSHintServiceConnectError = 1,
    YSHintUnkownError = 999999,
    YSHintMobileEmpty,
    YSHintMobileError,
    YSHintEmailEmpty,
    YSHintEmailError,
    YSHintPwdEmpty,
    YSHintPwdError,
    YSHintOldPwdEmpty,
    YSHintOldPwdError,
    YSHintSmsEmpty,
    YSHintSmsError,
    YSHintPwdAgainError,
    YSHintNotLogin,
    
    YSHintWalletCardEmpty,
    YSHintWalletCardError,
    YSHintWalletBankNameEmpty,
    YSHintWalletBankNameError,
    YSHintWalletHolderNameEmpty,
    YSHintWalletHolderNameError,
    
    YSHintCollectSuccess,
    YSHintCancelCollect,
    YSHintCommentSuccess,
    YSHintUpdateSuccess,
};

@interface YSShowHint : NSObject

+ (void)ys_showWithSuccessHint:(NSString *)hint;

+ (void)ys_showWithFailedHint:(NSString *)hint;

+ (void)ys_showWithState:(YSHint)hint;

+ (void)ys_showNetErrorWithCode:(NSInteger)code;

@end
