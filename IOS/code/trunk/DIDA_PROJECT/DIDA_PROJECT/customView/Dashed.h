//
//  Dashed.h
//  DIDA_PROJECT
//
//  Created by 袁江 on 14/11/18.
//  Copyright (c) 2014年 luojilab.com. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    DashedDirectionHorizontal,
    DashedDirectionVertical
    
}DashedDirection;

@interface Dashed : UIView
@property (nonatomic, assign) DashedDirection dashedDirection;
@end
