//
//  DIDaDatePicker.m
//  DIDA_PROJECT
//
//  Created by 袁江 on 14/11/28.
//  Copyright (c) 2014年 luojilab.com. All rights reserved.
//

#import "DIDaDatePicker.h"

static DIDaDatePicker *pick;

@interface DIDaDatePicker()

@property(nonatomic, strong)UIDatePicker *picker;
@property(nonatomic, strong)UIButton *commiteButton;
@property(nonatomic, strong)UIButton *cancelButton;
@property(nonatomic, strong)UIView *tool;

@property(nonatomic, copy)DiDaDatePickerDidSelectedDateBlock block;
@end

@implementation DIDaDatePicker

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-initWithBlock:(DiDaDatePickerDidSelectedDateBlock)block{
    self = [super initWithFrame:[UIScreen mainScreen].bounds];
    if (self) {
        self.block = block;
        self.picker = [[UIDatePicker alloc] init];
        self.picker.datePickerMode = UIDatePickerModeDate;
        self.picker.locale = [NSLocale currentLocale];
        
        self.commiteButton = [UIButton buttonWithType:UIButtonTypeSystem];
        self.commiteButton.frame = CGRectMake(0, 0, 60, 40);
        [self.commiteButton setTitle:@"确定" forState:UIControlStateNormal];
        [self.commiteButton addTarget:self action:@selector(buttonEvent:) forControlEvents:UIControlEventTouchUpInside];

        self.cancelButton = [UIButton buttonWithType:UIButtonTypeSystem];
        self.cancelButton.frame = CGRectMake(0, 0, 60, 40);
        [self.cancelButton setTitle:@"取消" forState:UIControlStateNormal];
        [self.cancelButton addTarget:self action:@selector(buttonEvent:) forControlEvents:UIControlEventTouchUpInside];
        
        UIView *mask = [[UIView alloc] initWithFrame:self.bounds];
        mask.alpha = 0.3;
        mask.backgroundColor = [UIColor blackColor];
        [self addSubview:mask];
        
        self.tool = [[UIView alloc] init ];
        self.tool.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:self.tool];
        
        [self addSubview:self.picker];
    
        [self addSubview:self.commiteButton];
        [self addSubview:self.cancelButton];
        self.picker.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

-(void)show{
    [[UIApplication sharedApplication].keyWindow.rootViewController.view  addSubview:self];
    pick = self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.picker.bottom = self.height;
    self.commiteButton.bottom = self.picker.top;
    self.cancelButton.bottom = self.picker.top;
    self.commiteButton.right = self.width;
    self.cancelButton.left = 0;
    self.tool.frame = CGRectMake(0, self.commiteButton.top, self.width, 40);
}

-(void)buttonEvent:(UIButton*)button{
    
    if (self.block) {
        if (self.commiteButton == button) {
            self.block(YES, self.picker.date);
        }else{
            self.block(NO, nil);
        }
    }
    [self removeFromSuperview];
    pick = nil;
}

@end
