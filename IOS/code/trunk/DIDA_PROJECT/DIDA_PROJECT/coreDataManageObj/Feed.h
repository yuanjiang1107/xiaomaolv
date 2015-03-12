//
//  Feed.h
//  DIDA_PROJECT
//
//  Created by 袁江 on 15/3/11.
//  Copyright (c) 2015年 luojilab.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Comment;

@interface Feed : NSManagedObject

@property (nonatomic, retain) NSNumber * feedId;
@property (nonatomic, retain) NSNumber * sortId;
@property (nonatomic, retain) NSNumber * ownerId;
@property (nonatomic, retain) NSString * ownerName;
@property (nonatomic, retain) NSString * content;
@property (nonatomic, retain) NSNumber * unfold;
@property (nonatomic, retain) NSSet *commentList;
@end

@interface Feed (CoreDataGeneratedAccessors)

- (void)addCommentListObject:(Comment *)value;
- (void)removeCommentListObject:(Comment *)value;
- (void)addCommentList:(NSSet *)values;
- (void)removeCommentList:(NSSet *)values;

@end
