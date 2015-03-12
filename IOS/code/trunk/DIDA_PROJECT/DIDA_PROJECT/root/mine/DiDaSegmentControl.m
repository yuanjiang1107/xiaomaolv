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


@property(nonatomic, copy)DiDaSegmentControlEventBlock block;

@end

@implementation DiDaSegmentControl

@synthesize segment = segment;


-(instancetype)initWithImages:(NSArray *)images eventCallBack:(DiDaSegmentControlEventBlock)block{
    self = [super init];
    if (self) {
    }
    
    return self;
}

-(instancetype)initWithTitle:(NSArray *)titles eventCallBack:(DiDaSegmentControlEventBlock)block{
    self = [super init];
    if (self) {
        self.segment = [[UISegmentedControl alloc]initWithItems:titles];
        self.block = block;
        [self.segment addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventValueChanged];
        [self setSelectedIndex:titles.count / 2];
        self.segment.tintColor = RGBCOLOR(255, 255, 255);
        NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:RGBCOLOR(253, 126, 68),NSForegroundColorAttributeName,
                             [UIFont systemFontOfSize:16.0], NSFontAttributeName, nil];
        [self.segment setTitleTextAttributes:dic forState:UIControlStateSelected];
        NSDictionary *dicNormal = [NSDictionary dictionaryWithObjectsAndKeys:RGBCOLOR(102, 102, 102),NSForegroundColorAttributeName,
                                   [UIFont systemFontOfSize:16.0], NSFontAttributeName, nil];
        [self.segment setTitleTextAttributes:dicNormal forState:UIControlStateNormal];
        [self addSubview:self.segment];
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.segment.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
}

-(void)valueChanged:(UISegmentedControl*)button{
    //[self setSelectedIndexI:button.selectedSegmentIndex];
    self.block(button.selectedSegmentIndex);
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
