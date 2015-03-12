//
//  HeaderForMine.m
//  dida
//
//  Created by 袁江 on 14-9-22.
//  Copyright (c) 2014年 he chao. All rights reserved.
//

#import "HeaderForMine.h"

@implementation HeaderForMine
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor greenColor];
        self.frame = CGRectMake(0, 0, [UIDevice screenWidth], 100);
        UIButton *button = [UIButton  buttonWithType:UIButtonTypeInfoLight];
        button.frame = CGRectMake(0, 0, [UIDevice screenWidth], 100);
        [self addSubview:button];
    }
    return self;
}
@end
