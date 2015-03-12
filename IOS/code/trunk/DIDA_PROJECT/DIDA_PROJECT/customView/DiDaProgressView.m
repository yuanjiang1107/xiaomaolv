//
//  DiDaProgressView.m
//  DIDA_PROJECT
//
//  Created by 袁江 on 14/11/6.
//  Copyright (c) 2014年 luojilab.com. All rights reserved.
//

#import "DiDaProgressView.h"

@implementation DiDaProgressView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
 */
-(instancetype)init{
    self = [super init];
    self.tintColor = DIDA_ORANGE_COLOR;
    return self;
}
- (void)drawRect:(CGRect)rect {
    
    
    
    CGFloat width = self.width * self.progress;
    
    CGContextRef context =  UIGraphicsGetCurrentContext();
    
    
    
    CGContextSetFillColorWithColor(context, [UIColor lightGrayColor].CGColor);
    CGContextFillRect(context, self.bounds);

    CGContextMoveToPoint(context, 0, 0);
    CGContextAddLineToPoint(context, 0, self.height);
    CGContextAddLineToPoint(context, width, self.height);
    CGContextAddLineToPoint(context, width, 0);
    CGContextAddLineToPoint(context, 0, 0);
    CGContextSetFillColorWithColor(context, self.tintColor.CGColor);
    CGContextFillPath(context);
}

-(void)setProgress:(float)progress{
    _progress = progress;
    [self setNeedsDisplay];
}
@end
