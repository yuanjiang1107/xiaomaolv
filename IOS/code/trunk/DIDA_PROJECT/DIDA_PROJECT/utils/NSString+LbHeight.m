//
//  NSString+LbHeight.m
//  DIDA_PROJECT
//
//  Created by 袁江 on 15/3/9.
//  Copyright (c) 2015年 luojilab.com. All rights reserved.
//

#import "NSString+LbHeight.h"

@implementation NSString(LbHeight)


-(CGFloat)heightForLb:(UILabel*)label constrainedToWidth:(CGFloat)width{
        NSDictionary *dic = [NSDictionary dictionaryWithObject:label.font forKey:NSFontAttributeName];
        CGRect rect = [self boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX)
                                          options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingTruncatesLastVisibleLine
                                       attributes:dic
                                          context:nil];
    return rect.size.height;
    
}

@end
