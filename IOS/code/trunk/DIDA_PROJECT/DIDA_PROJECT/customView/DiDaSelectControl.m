//
//  DiDaSelectControl.m
//  DIDA_PROJECT
//
//  Created by 袁江 on 14/11/28.
//  Copyright (c) 2014年 luojilab.com. All rights reserved.
//

#import "DiDaSelectControl.h"

@interface DiDaSelectControl()

//目前就三个 多了再设计
@property(nonatomic, strong)UIButton  *button0;
@property(nonatomic, strong)UIButton  *button1;
@property(nonatomic, strong)UIButton  *button2;

@property(nonatomic, assign)NSInteger count;

@property(nonatomic, strong)UIView *selectedLine;

@property(nonatomic, copy)SelectControlDidSelected block;
@end


@implementation DiDaSelectControl


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(instancetype)initWithSegmentCount:(NSInteger)count selectedBlock:(SelectControlDidSelected)block{
    self = [super init];
    if (self) {
        self.block = block;
        self.count = 2;
        self.button0 = [self buttonWithName:@"我的梦想"];
        self.button1 = [self buttonWithName:@"我的游记"];
        self.button2 = [self buttonWithName:@"我的动态"];
        self.frame = CGRectMake(0, 0, [UIDevice screenWidth], 32);
        
        self.button0.frame = CGRectMake(0, 0, self.width / self.count, 30);
        self.button2.frame = CGRectOffset(self.button0.frame, self.button0.width, 0);
        
        self.selectedLine = [[UIView alloc] init];
        self.selectedLine.backgroundColor = DIDA_ORANGE_COLOR;
        self.selectedLine.frame = CGRectMake(0, self.button0.height, self.button0.titleLabel.width, 2);
        self.selectedLine.centerX = self.button0.centerX;
        
        [self addSubview:self.button0];
        [self addSubview:self.button2];
        [self addSubview:self.selectedLine];
    }
    return self;
}

-(UIButton*)buttonWithName:(NSString*)title{
    UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonEvent:) forControlEvents:UIControlEventTouchUpInside];
    [button setTitleColor:DIDA_TEXT_COLOR forState:UIControlStateSelected];
    [button setTitleColor:RGBCOLOR(149, 149, 149) forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:15.0f];
    return button;
}

-(void)setSelectedIndex:(NSInteger)selectedIndex{
    _selectedIndex = selectedIndex;
    if (selectedIndex == 0) {
        self.button0.selected = YES;
        self.button2.selected = NO;
    }else {
        self.button0.selected = NO;
        self.button2.selected = YES;
    }
    
    UIButton *selectedButton;
    if (self.selectedIndex == 0) {
        selectedButton = self.button0;
    }else{
        selectedButton = self.button2;
    }
    [UIView animateWithDuration:0.1
                          delay:0.01
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         self.selectedLine.centerX = selectedButton.centerX;
                         self.selectedLine.size = CGSizeMake(selectedButton.titleLabel.width, 2);
                     } completion:^(BOOL finished) {
                         
                     }];
}

-(void)buttonEvent:(UIButton*)button{
    
    
    if (button == self.button0) {
        self.selectedIndex = 0;
        self.block(0);
    }else{
        self.selectedIndex = 1;
        self.block(1);
    }
}

@end
