//
//  ContactEntity.h
//  dida
//
//  Created by 袁江 on 14-9-23.
//  Copyright (c) 2014年 he chao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface ContactEntity : NSManagedObject

@property (nonatomic, retain) NSString * userName;
@property (nonatomic, retain) NSString * userAvatar;
@property (nonatomic, retain) NSNumber * userAge;
@property (nonatomic, retain) NSNumber * userWeight;
@property (nonatomic, retain) NSNumber * userHeight;
@property (nonatomic, retain) NSString * userLiveCity;
@property (nonatomic, retain) NSNumber * relationship;
@property (nonatomic, retain) NSNumber * userStatus;
@property (nonatomic, retain) NSString * userNameHeaderChar;

@end
