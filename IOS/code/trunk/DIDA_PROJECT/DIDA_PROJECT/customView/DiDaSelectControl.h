//
//  DiDaSelectControl.h
//  DIDA_PROJECT
//
//  Created by 袁江 on 14/11/28.
//  Copyright (c) 2014年 luojilab.com. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void (^SelectControlDidSelected)(NSInteger index);

@interface DiDaSelectControl : UIView


-(instancetype)initWithSegmentCount:(NSInteger)count selectedBlock:(SelectControlDidSelected)block;

@property(nonatomic, assign)NSInteger selectedIndex;

@end
