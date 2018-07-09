//
//  YSShowHint.m
//  YS
//
//  Created by Rocky on 2018/4/16.
//  Copyright © 2018年 任皖鹏. All rights reserved.
//

#import "YSShowHint.h"

#import "NSObject+Hint.h"

@implementation YSShowHint

+ (void)ys_showNetErrorWithCode:(NSInteger)code {
    [NSObject ys_showErrorWithHint:[self ys_netErrorInfo:code]];
}

+ (void)ys_showWithState:(YSHint)hint {
    
    switch (hint) {
        case YSHintServiceConnectError:
        case YSHintUnkownError:
        case YSHintMobileEmpty:
        case YSHintMobileError:
        case YSHintEmailEmpty:
        case YSHintEmailError:
        case YSHintPwdEmpty:
        case YSHintPwdError:
        case YSHintOldPwdEmpty:
        case YSHintOldPwdError:
        case YSHintPwdAgainError:
        case YSHintSmsEmpty:
        case YSHintSmsError:
        case YSHintNotLogin:
            
        case YSHintWalletCardEmpty:
        case YSHintWalletCardError:
        case YSHintWalletBankNameEmpty:
        case YSHintWalletBankNameError:
        case YSHintWalletHolderNameEmpty:
        case YSHintWalletHolderNameError:
        {
            [NSObject ys_showErrorWithHint:[self ys_stateToString:hint]];
            break;
        }
        case YSHintCollectSuccess:
        case YSHintCancelCollect:
        case YSHintCommentSuccess:
        case YSHintUpdateSuccess:
        {
            [NSObject ys_showSuccessWithHint:[self ys_stateToString:hint]];
            break;
        }
        default:
        {
            [self ys_showNetErrorWithCode:hint];
            break;
        }
    }
}

+ (NSString *)ys_stateToString:(YSHint)hint {
    switch (hint) {
        case YSHintServiceConnectError: { return @"连接服务器失败"; }
        case YSHintUnkownError: { return @"未知错误"; }
        case YSHintMobileEmpty: { return @"请输入手机号码"; }
        case YSHintMobileError: { return @"手机号码格式有误"; }
        case YSHintEmailEmpty: { return @"请输入邮箱"; }
        case YSHintEmailError: { return @"邮箱格式有误"; }
        case YSHintPwdEmpty: { return @"请输入密码"; }
        case YSHintPwdError: { return @"密码为6~20位数字或字母"; }
        case YSHintOldPwdEmpty: { return @"请输入旧密码"; }
        case YSHintOldPwdError: { return @"密码为6~20位数字或字母"; }
        case YSHintPwdAgainError: { return @"密码输入不一致"; }
        case YSHintSmsEmpty: { return @"请输入验证码"; }
        case YSHintSmsError: { return @"验证码错误"; }
        case YSHintNotLogin: { return @"还未登录"; }
            
        case YSHintWalletCardEmpty: { return @"请输入银行卡号"; }
        case YSHintWalletCardError: { return @"银行卡错误"; }
        case YSHintWalletBankNameEmpty: { return @"请输入开户行"; }
        case YSHintWalletBankNameError: { return @"开户行错误"; }
        case YSHintWalletHolderNameEmpty: { return @"请输入银行卡绑定的姓名"; }
        case YSHintWalletHolderNameError: { return @"姓名错误"; }
            
        case YSHintCollectSuccess: { return @"收藏成功"; }
        case YSHintCancelCollect: { return @"取消收藏"; }
        case YSHintCommentSuccess: { return @"评论成功"; }
        case YSHintUpdateSuccess: { return @"修改成功"; }
    }
    return [self ys_netErrorInfo:hint];
}

+ (NSString *)ys_netErrorInfo:(NSInteger)code {
    NSDictionary *dic = @{@"00000": @"成功",
                          @"9999": @"失败",
                          @"9995": @"服务器异常",
                          @"9991": @"上传文件太大",
                          @"11999": @"未知错误",
                          @"11000": @"缺少必要参数",
                          @"11001": @"账号未注册",
                          @"11002": @"未登录",
                          @"11003": @"没有权限",
                          @"11004": @"不能是自己",
                          @"11005": @"token为空",
                          @"11006": @"只能操作自己用户的信息",
                          @"11007": @"无效用户",
                          
                          @"00001": @"错误的用户名",
                          @"00002": @"错误的手机号码、邮箱",
                          @"00003": @"参数错误",
                          @"00004": @"密码错误",
                          @"00005": @"验证码错误",
                          @"00006": @"验证密钥过期，请重新登录",
                          @"00007": @"已经被禁用",
                          @"00008": @"支付出错",
                          @"00009": @"访问限制",
                          @"00010": @"无效Id",
                          @"00011": @"格式错误",
                          @"00012": @"用户不存在",
                          
                          @"20001": @"手机号码已经存在",
                          @"20002": @"用户名已经存在",
                          @"20003": @"邮箱已经存在",
                          @"20004": @"重复操作",
                          @"20005": @"手机号码不存在",
                          @"20006": @"用户没有达到操作要求"};
    
    NSArray *keys = dic.allKeys;
    for (NSString *key in keys) {
        if (key.intValue == code) {
            return [dic objectForKey:key];
        }
    }
    return @"UnKnowError";
}

@end


