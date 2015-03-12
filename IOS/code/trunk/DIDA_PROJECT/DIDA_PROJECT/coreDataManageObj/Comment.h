//
//  Comment.h
//  DIDA_PROJECT
//
//  Created by 袁江 on 15/3/11.
//  Copyright (c) 2015年 luojilab.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Feed;

@interface Comment : NSManagedObject

@property (nonatomic, retain) NSString * fromName;
@property (nonatomic, retain) NSString * toName;
@property (nonatomic, retain) NSNumber * feedId;
@property (nonatomic, retain) NSString * content;
@property (nonatomic, retain) Feed *belongTo;

@end
