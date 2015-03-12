//
//  DiDaSegementControl.m
//  dida
//
//  Created by 袁江 on 14-9-23.
//  Copyright (c) 2014年 he chao. All rights reserved.
//

#import "DiDaSegmentControl.h"

@interface DiDaSegmentControl()

@property UISegmentedControl *segment;

@property(nonatomic, strong)NSArray *images;

@property(nonatomic, strong)NSArray *buttons;

@property(nonatomic, strong)NSArray *titles;

@property(nonatomic, copy)DiDaSegmentControlEventBlock block;

@property(nonatomic, strong)UIButton *selectedButton;

@end

@implementation DiDaSegmentControl

@synthesize segment = segment;


-(instancetype)initWithImages:(NSArray *)images eventCallBack:(DiDaSegmentControlEventBlock)block{
    self = [super init];
    if (self) {
        
        
    }
    
    return self;
}


-(UIButton*)createButtonItemWithTitle:(NSString*)title{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.layer.borderWidth = 0.5;
    button.layer.borderColor = [UIColor whiteColor].CGColor;
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:DIDA_ORANGE_COLOR forState:UIControlStateHighlighted];
    [button setTitleColor:DIDA_ORANGE_COLOR forState:UIControlStateSelected];
    button.backgroundColor = DIDA_BACKGROUND_COLOR;
    button.titleLabel.font = [UIFont systemFontOfSize:16.0f];
    [button setBackgroundImage:[UIImage imageNamed:@"whiteBg.png"] forState:UIControlStateSelected];
    [button addTarget:self action:@selector(buttonEvent:) forControlEvents:UIControlEventTouchUpInside];
    [button setTitleColor:DIDA_TEXT_COLOR forState:UIControlStateNormal];
    return button;
}

-(instancetype)initWithTitle:(NSArray *)titles currentIndex:(NSInteger)currentIndex eventCallBack:(DiDaSegmentControlEventBlock)block{
    self = [super init];
    if (self) {
        self.block = block;

//        self.segment = [[UISegmentedControl alloc]initWithItems:titles];
//        [self.segment addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventValueChanged];
//        [self setSelectedIndex:titles.count / 2];
//        self.segment.tintColor = RGBCOLOR(255, 255, 255);
//        NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:RGBCOLOR(253, 126, 68),NSForegroundColorAttributeName,
//                             [UIFont systemFontOfSize:16.0], NSFontAttributeName, nil];
//        [self.segment setTitleTextAttributes:dic forState:UIControlStateSelected];
//        NSDictionary *dicNormal = [NSDictionary dictionaryWithObjectsAndKeys:RGBCOLOR(102, 102, 102),NSForegroundColorAttributeName,
//                                   [UIFont systemFontOfSize:16.0], NSFontAttributeName, nil];
//        [self.segment setTitleTextAttributes:dicNormal forState:UIControlStateNormal];
//        [self addSubview:self.segment];
        NSInteger index = 0;
        self.titles = titles;
        NSMutableArray *mArray = [[NSMutableArray alloc] initWithCapacity:5];
        for (NSString *title in titles) {
            UIButton *button = [self createButtonItemWithTitle:title];
            [self addSubview:button];
            [mArray addObject:button];
            if (index == currentIndex) {
                button.selected = YES;
                self.selectedButton = button;
            }
            button.tag = index;
            index ++;
        }
        self.buttons = [NSArray arrayWithArray:mArray];
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
//    self.segment.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
    CGFloat width = self.width / self.titles.count;
    CGFloat offset = 0;
    for (NSInteger index = 0; index < self.titles.count; index++) {
        UIButton *button = [self.buttons objectAtIndex:index];
        button.frame = CGRectMake(offset, 0, width + 1, self.height);
        offset +=width;
    }
}

-(void)valueChanged:(UISegmentedControl*)button{
    //[self setSelectedIndexI:button.selectedSegmentIndex];
//    self.block(button.selectedSegmentIndex);
    
}

-(void)buttonEvent:(UIButton*)button{
    
    if (self.selectedButton == button) {
        button.selected = NO;
        self.block(NO, -1);
        return;
    }
    
    for (UIButton*button in self.buttons) {
        button.selected = NO;
    }
    
    button.selected = YES;
    self.selectedButton = button;
    self.block(YES, button.tag);
}

-(void)setSelectedIndexI:(NSInteger)index{
    for (int index = 0; index < self.segment.numberOfSegments; index++) {
        NSString *title = [self.segment titleForSegmentAtIndex:index];
        title = [title stringByReplacingOccurrencesOfString:@"√" withString:@""];
        [self.segment setTitle:title forSegmentAtIndex:index];
    }

    
    
    NSString *title = [self.segment titleForSegmentAtIndex:index];
    title = [title stringByAppendingString:@"√"];
    [self.segment setTitle:title forSegmentAtIndex:index];
}

-(void)setSelectedIndex:(NSInteger)index{
    self.segment.selectedSegmentIndex = index;
    //[self setSelectedIndexI:index];
}
@end
