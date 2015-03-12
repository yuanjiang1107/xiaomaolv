//
//  ChatMessage.h
//  DIDA_PROJECT
//
//  Created by 袁江 on 14/11/25.
//  Copyright (c) 2014年 luojilab.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface ChatMessage : NSManagedObject

@property (nonatomic, retain) NSString * content;
@property (nonatomic, retain) NSNumber * from;
@property (nonatomic, retain) NSNumber * fromAvatar;
@property (nonatomic, retain) NSNumber * isRead;
@property (nonatomic, retain) NSNumber * to;
@property (nonatomic, retain) NSNumber * creatTime;

@end
