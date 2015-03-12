//
//  Dashed.m
//  DIDA_PROJECT
//
//  Created by 袁江 on 14/11/18.
//  Copyright (c) 2014年 luojilab.com. All rights reserved.
//

#import "Dashed.h"

@implementation Dashed

-(instancetype)init{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
 */
- (void)drawRect:(CGRect)rect {
    CGContextRef context =UIGraphicsGetCurrentContext();
    CGContextBeginPath(context);
    CGContextSetLineWidth(context, 0.5);
    CGContextSetStrokeColorWithColor(context, [UIColor lightGrayColor].CGColor);
    self.backgroundColor = [UIColor clearColor];
    CGFloat lengths[] = {3.0,3.0};
    CGContextSetLineDash(context, 0, lengths, 2);
    
    
    if (self.dashedDirection == DashedDirectionHorizontal) {
        CGContextMoveToPoint(context, 0, self.height / 2);
        CGContextAddLineToPoint(context, self.width,self.height / 2);
    }else{
        CGContextMoveToPoint(context, self.width / 2, 0);
        CGContextAddLineToPoint(context, self.width / 2,self.height);
    }
    CGContextStrokePath(context);
}


@end
