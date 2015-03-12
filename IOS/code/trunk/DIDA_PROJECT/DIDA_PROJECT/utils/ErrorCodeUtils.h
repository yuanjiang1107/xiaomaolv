//
//  ErrorCodeUtils.h
//  PaipaiGou
//
//  Created by Levin on 7/19/12.
//  Copyright (c) 2012 dajie.com. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    PPGServerErrorCodeNone = 0,
    PPGServerErrorCodeOperationFail = 1,
    PPGServerErrorCodeAccessDeny = 2,
    PPGServerErrorCodeParamError = 3,
    PPGServerErrorCodeTokenOutOfDate = 4
} PPGServerErrorCode;


#define kHttpTimeOutErrorCode -1001
#define kNetworkUnavailabelErrorCode -1009
#define kNetworkUnavailabelErrorCode2 -1004

@interface ErrorCodeUtils : NSObject

+ (NSString *)getHttpError:(NSDictionary *)dict;




+ (NSString*)getLoginError:(NSInteger)code;
+ (NSString*)getRegisterError:(NSInteger)code;


@end
