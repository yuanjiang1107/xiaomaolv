//
//  NSString+LbHeight.h
//  DIDA_PROJECT
//
//  Created by 袁江 on 15/3/9.
//  Copyright (c) 2015年 luojilab.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (LbHeight)

-(CGFloat)heightForLb:(UILabel*)label constrainedToWidth:(CGFloat)width;

@end
