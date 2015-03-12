//
//  UserManager.m
//  DIDA_PROJECT
//
//  Created by 袁江 on 14/12/23.
//  Copyright (c) 2014年 luojilab.com. All rights reserved.
//

#import "UserManager.h"


#define DiDa_current_user_id            @"DiDa_current_user_id"
#define DiDa_current_user_name          @"DiDa_current_user_name"
#define DiDa_current_user_password      @"DiDa_current_user_password"
#define DiDa_current_user_gender        @"DiDa_current_user_gender"
#define DiDa_current_user_age           @"DiDa_current_user_age"
#define DiDa_current_user_desciption    @"DiDa_current_user_descritpion"
#define DiDa_current_user_avatar        @"DiDa_current_user_avatar"


@implementation UserManager


+(NSString*)currentUserId{
    return [[NSUserDefaults standardUserDefaults] stringForKey:DiDa_current_user_id];
}

+(void)setCurrentUserWithId:(NSString*)userId{
    [[NSUserDefaults standardUserDefaults] setObject:userId forKey:DiDa_current_user_id];
}

+(NSString*)currentUserPassword{
    return [[NSUserDefaults standardUserDefaults] stringForKey:DiDa_current_user_password];
}

+(void)setCurrentUserPassword:(NSString*)password{
    [[NSUserDefaults standardUserDefaults] setObject:password forKey:DiDa_current_user_password];
}

+(NSString*)currentUserName{
    return [[NSUserDefaults standardUserDefaults] stringForKey:DiDa_current_user_name];
    
}

+(void)setCurrentUserName:(NSString*)name{
    [[NSUserDefaults standardUserDefaults] setObject:name forKey:DiDa_current_user_name];
}

+(NSInteger)currentUserGender{
    return [[NSUserDefaults standardUserDefaults] integerForKey:DiDa_current_user_gender];
}

+(void)setCurrentUserGender:(NSInteger)gender{
    [[NSUserDefaults standardUserDefaults] setInteger:gender forKey:DiDa_current_user_gender];
}

+(NSInteger)currentUserAge{
    return [[NSUserDefaults standardUserDefaults] integerForKey:DiDa_current_user_age];
}

+(void)setCurrentUserAge:(NSInteger)age{
    [[NSUserDefaults standardUserDefaults] setInteger:age forKey:DiDa_current_user_age];
}

+(NSString*)currentUserDescription{
    return [[NSUserDefaults standardUserDefaults] stringForKey:DiDa_current_user_desciption];
}

+(void)setCurrentUserDescription:(NSString*)description{
    [[NSUserDefaults standardUserDefaults] setObject:description forKey:DiDa_current_user_desciption];
}

+(NSString*)currentUserAvatar{
    return [[NSUserDefaults standardUserDefaults] stringForKey:DiDa_current_user_avatar];
}

+(void)setCurrentUserAavatar:(NSString*)avatar{
    [[NSUserDefaults standardUserDefaults] setObject:avatar forKey:DiDa_current_user_avatar];
}

@end
