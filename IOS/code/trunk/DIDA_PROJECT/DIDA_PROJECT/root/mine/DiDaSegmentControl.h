//
//  DiDaSegementControl.h
//  dida
//
//  Created by 袁江 on 14-9-23.
//  Copyright (c) 2014年 he chao. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^DiDaSegmentControlEventBlock)(NSInteger selectedIndex);

@interface DiDaSegmentControl : UIView{
}

-(instancetype)initWithImages:(NSArray*)images eventCallBack:(DiDaSegmentControlEventBlock)block;

-(instancetype)initWithTitle:(NSArray*)titles eventCallBack:(DiDaSegmentControlEventBlock)block;



-(void)setSelectedIndex:(NSInteger)index;
@end
