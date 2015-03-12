//
//  UserManager.h
//  DIDA_PROJECT
//
//  Created by 袁江 on 14/12/23.
//  Copyright (c) 2014年 luojilab.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserManager : NSObject



+(NSString*)currentUserId;
+(NSString*)currentUserPassword;
+(NSString*)currentUserName;
+(NSInteger)currentUserGender;
+(NSInteger)currentUserAge;
+(NSString*)currentUserDescription;
+(NSString*)currentUserAvatar;


+(void)setCurrentUserWithId:(NSString*)userId;
+(void)setCurrentUserPassword:(NSString*)password;
+(void)setCurrentUserName:(NSString*)name;
+(void)setCurrentUserGender:(NSInteger)gender;
+(void)setCurrentUserAge:(NSInteger)age;
+(void)setCurrentUserDescription:(NSString*)description;
+(void)setCurrentUserAavatar:(NSString*)avatar;


@end
