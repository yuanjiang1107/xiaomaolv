//
//  DiDaButton.m
//  DIDA_PROJECT
//
//  Created by 袁江 on 14/12/1.
//  Copyright (c) 2014年 luojilab.com. All rights reserved.
//

#import "DiDaButton.h"

@implementation UIButton(DiDaButton)

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

+(UIButton*)button{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.layer.shadowOpacity = 0.5;
    button.layer.shadowOffset = CGSizeMake(0, 2);
    button.backgroundColor = [UIColor whiteColor];
    [button setTitleColor:DIDA_ORANGE_COLOR forState:UIControlStateNormal];
    return button;
}
+(UIButton*)buttonForAutoLayerout{
    UIButton *button = [UIButton button];
    button.translatesAutoresizingMaskIntoConstraints = NO;
    return button;
}

@end
