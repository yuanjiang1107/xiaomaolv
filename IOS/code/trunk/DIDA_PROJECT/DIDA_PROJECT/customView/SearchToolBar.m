//
//  SearchToolBar.m
//  DIDA_PROJECT
//
//  Created by 袁江 on 14-9-26.
//  Copyright (c) 2014年 luojilab.com. All rights reserved.
//

#import "SearchToolBar.h"


@interface SearchToolBar()

CREATE_STRONG NSArray* names;

CREATE_STRONG NSArray* buttons;

CREATE_STRONG NSArray* separateLines;

CREATE_COPY SearchToolBarSelectedBlock block;

@end

@implementation SearchToolBar

-(instancetype)initWithNames:(NSArray*)names currentIndex:(NSInteger)index selectedBlock:(SearchToolBarSelectedBlock)block{
    self = [super init];
    if (self) {
        self.names = [NSArray arrayWithArray:names];
        NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity:5];
        NSInteger loopIndex = 0;
        for (NSString*name in self.names) {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            [button setTitleColor:DIDA_TEXT_COLOR forState:UIControlStateNormal];
            [button setTitleColor:DIDA_ORANGE_COLOR forState:UIControlStateSelected];
            [button setTitleColor:DIDA_ORANGE_COLOR forState:UIControlStateHighlighted];
            
            button.titleLabel.font = [UIFont boldSystemFontOfSize:16.0];
            
            [button addTarget:self action:@selector(buttonEvent:) forControlEvents:UIControlEventTouchUpInside];
            
            [button setTitle:name forState:UIControlStateNormal];
            [array addObject:button];
            [self addSubview:button];
            if (loopIndex == index) {
                button.selected = YES;
            }
            button.tag = loopIndex;
            loopIndex++;
        }
        
        self.block = block;
        
        self.buttons = [NSArray arrayWithArray:array];
        
        [array removeAllObjects];
        
        for (int index = 0; index < self.buttons.count - 1; index++) {
            UIView *view = [[UIView alloc] init];
            view.backgroundColor = DIDA_BACKGROUND_COLOR;
            [array addObject:view];
            [self addSubview:view];
        }
        self.separateLines = [NSArray arrayWithArray:array];
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}


-(void)layoutSubviews{
    [super layoutSubviews];
    CGFloat width = self.width / self.buttons.count;
    CGRect rect = CGRectMake(0, 0, width, self.height);
    
    for (int index = 0; index < self.buttons.count; index++) {
        UIButton *button = [self.buttons objectAtIndex:index];
        button.frame = rect;
        rect = CGRectOffset(rect, width, 0);
        if (index < self.separateLines.count ) {
            UIView *separateLine = [self.separateLines objectAtIndex:index];
            separateLine.frame = CGRectMake(button.right, 10, 1, self.height - 20);
        }
    }
}

-(void)buttonEvent:(UIButton*)button{
    
    if (button.selected == YES) {
        return;
    }
    for (int index = 0; index < self.buttons.count; index++) {
        UIButton *button = [self.buttons objectAtIndex:index];
        button.selected = NO;
    }
    button.selected = YES;
    self.block(button.tag);
}


@end
