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

@end

@implementation SearchToolBar

-(instancetype)initWithNames:(NSArray*)names{
    self = [super init];
    if (self) {
        self.names = [NSArray arrayWithArray:names];
        NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity:5];
        for (NSString*name in self.names) {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
            [button setTitle:name forState:UIControlStateNormal];
            [array addObject:button];
            [self addSubview:button];
        }
        
        
        self.buttons = [NSArray arrayWithArray:array];
        
        [array removeAllObjects];
        
        for (int index = 0; index < self.buttons.count - 1; index++) {
            UIView *view = [[UIView alloc] init];
            view.backgroundColor = [UIColor whiteColor];
            [array addObject:view];
            [self addSubview:view];
        }
        self.separateLines = [NSArray arrayWithArray:array];
        self.backgroundColor = RGBCOLOR(225, 225, 183);
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
            separateLine.frame = CGRectMake(button.right, 1, 1, self.height - 1);
        }
    }
}



@end
