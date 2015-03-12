//
//  filterView.h
//  DIDA_PROJECT
//
//  Created by 袁江 on 14-10-21.
//  Copyright (c) 2014年 luojilab.com. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^FilterEventBlock)(NSDictionary* info);


@interface FilterView : UIView

-(instancetype)initWithBlock:(FilterEventBlock)block;

-(void)show;

-(void)remove;
@end
