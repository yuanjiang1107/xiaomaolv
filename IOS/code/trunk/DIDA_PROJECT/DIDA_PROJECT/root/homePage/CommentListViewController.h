//
//  CommentListViewController.h
//  DIDA_PROJECT
//
//  Created by 袁江 on 15/3/10.
//  Copyright (c) 2015年 luojilab.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DiDaTableViewController.h"

@interface CommentListViewController : DiDaTableViewController

-(instancetype)initWidth:(CGFloat)width;

-(CGFloat)heightForCommentListWidthData:(id)data;

-(void)fillData:(id)data;

@end
