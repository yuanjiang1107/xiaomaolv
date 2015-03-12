//
//  ErrorCodeUtils.m
//  PaipaiGou
//
//  Created by Levin on 7/19/12.
//  Copyright (c) 2012 dajie.com. All rights reserved.
//

#import "ErrorCodeUtils.h"

@implementation ErrorCodeUtils


+ (NSString *)getHttpError:(NSDictionary *)dict
{
    NSInteger errorCode = [[dict objectForKey:@"code"] integerValue];
    switch (errorCode) {
        case 0:
            return nil;
            break;
        case kHttpTimeOutErrorCode:
            return NSLocalizedString(@"请求超时", nil);
            break;
        case kNetworkUnavailabelErrorCode:
        case kNetworkUnavailabelErrorCode2:
            return NSLocalizedString(@"你的网络好像有问题，请稍后再试", nil);
            break;
        default:
            return NSLocalizedString(@"网络错误", nil);
            break;
    }
}


+ (NSString*)getLoginError:(NSInteger)code
{
    NSString* str = [NSString stringWithFormat:@"登录出错，请稍候重试[代码:%ld]", (long)code];
    switch (code) {
        case 1:
            str = @"用户名或密码错误";
            break;
            
        case 2:
//            str = @"表示app新用户，并且在大街设置了身份";
            break;
            
        case 3:
//            str = @"表示新用户，但是在大街没有设置身份";
            break;
            
        case 4:
            str = @"表示第三方登录错误";
            break;
        default:
            break;
    }
    
    return str;
}




+ (NSString*)getRegisterError:(NSInteger)code
{
    NSString* str = [NSString stringWithFormat:@"注册出错，请稍候重试[代码:%d]", code];
    switch (code) {
        case 1:
            str = @"验证码不存在，请重新发送";
            break;
            
        case 2:
            str = @"验证码已过期，请重新发送";
            break;
            
        case 3:
            str = @"验证码错误，请重新输入";
            break;
           
        case 15:
            str = @"您输入的内容含敏感信息，请重新输入";
            break;
            
        case 16:
            str = @"注册邮箱已被占用，请更换其它帐号注册或者直接用此帐号登录";
            break;
            
        case 17:
            str = @"注册手机号已被占用，请更换其它帐号注册或者直接用此帐号登录";
            break;
            
        default:
            break;
    }
    
    return str;
}


@end
