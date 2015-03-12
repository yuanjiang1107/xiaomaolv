//
//  FeedCell.h
//  DIDA_PROJECT
//
//  Created by 袁江 on 15/3/9.
//  Copyright (c) 2015年 luojilab.com. All rights reserved.
//

#import <UIKit/UIKit.h>


#define Feed_Content_Width ([UIDevice screenWidth] - 75)
#define Feed_Content_Default_Height 85



@protocol FeedCommentDelegate <NSObject>

-(void)showCommentInpute:(UITableViewCell*)cell withData:(id)data toUserId:(NSInteger)toUserId toUserName:(NSString*)userName;

@end


@interface FeedCell : DiDaTableViewCell



@property(nonatomic, weak)id<FeedCommentDelegate> ancestorsTableviewController;


@property(nonatomic, assign)NSInteger numberOfComment;
-(void)fillCommentList:(NSSet*)set;

@property(nonatomic, assign)BOOL unfold;

+(UILabel*)FeedContentLb;


@end
