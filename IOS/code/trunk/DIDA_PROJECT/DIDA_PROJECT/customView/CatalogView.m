//
//  CatalogView.m
//  DIDA_PROJECT
//
//  Created by 袁江 on 14/11/19.
//  Copyright (c) 2014年 luojilab.com. All rights reserved.
//

#import "CatalogView.h"


#define button_height 30

@interface CatalogView()

@property(nonatomic, strong)NSArray *buttons;

@property(nonatomic, strong)UIView *buttonsBg;

@end



@implementation CatalogView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(instancetype)initWithList:(NSArray*)list{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.buttonsBg = [[UIView alloc] initWithFrame:CGRectZero];
        self.buttonsBg.frame = CGRectMake(0, 0, 100, list.count * button_height);
        CGRect rect = CGRectMake(0, 0, self.buttonsBg.width, button_height);
        self.buttonsBg.backgroundColor = DIDA_NAVIGATIONBAR_COLOR;
        self.buttonsBg.userInteractionEnabled = YES;
        self.list = [NSArray arrayWithArray:list];
        self.autoresizesSubviews = YES;
        NSMutableArray* array = [NSMutableArray arrayWithCapacity:10];
        NSInteger index = 0;
        for (NSString *name in list) {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            [button setTitle:name forState:UIControlStateNormal];
            [button setTitleColor:DIDA_ORANGE_COLOR forState:UIControlStateHighlighted];
            button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
            button.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 10);
            button.titleLabel.font = [UIFont systemFontOfSize:14.0f];
            button.frame = rect;
            button.autoresizingMask =  UIViewAutoresizingFlexibleRightMargin ;
            rect = CGRectOffset(rect, 0, button_height);
            button.tag = index;
            [array addObject:button];
            [button addTarget:self action:@selector(buttonEvent:) forControlEvents:UIControlEventTouchUpInside];
            [self.buttonsBg addSubview:button];
            index++;
        }
        self.buttons = [NSArray arrayWithArray:array];
        self.height = self.list.count * 40;
        [self addSubview:self.buttonsBg];
        self.buttonsBg.alpha = 0.0;
        [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture:)]];
        [self addGestureRecognizer:[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture:)]];
        
        
    }
    [self unfold];
    return self;
}

-(void)buttonEvent:(UIButton*)button{
    if ([self.delegate respondsToSelector:@selector(catalogDidSelectedItemWith:title:)]) {
        [self.delegate catalogDidSelectedItemWith:button.tag title:button.titleLabel.text];
    }
    [self fold];
}


-(void)setFrame:(CGRect)frame{
    [super setFrame:frame];
    self.buttonsBg.right = self.right - 10;
}

-(void)tapGesture:(UITapGestureRecognizer*)gest{
    [self fold];
}

-(void)unfold{
    [UIView animateWithDuration:0.3
                     animations:^{
                         self.buttonsBg.alpha = 1.0;
                     } completion:^(BOOL finished) {
                         
                     }];
}

-(void)fold{
    typeof(self) bself = self;
    [UIView animateWithDuration:0.4
                          delay:0.01
                        options:UIViewAnimationOptionLayoutSubviews
                     animations:^{
                         self.buttonsBg.frame = CGRectMake(self.width - 10, self.buttonsBg.origin.y, self.buttonsBg.width, 1);
                     } completion:^(BOOL finished) {
                         if ([bself.delegate respondsToSelector:@selector(catalogDidFolded)]) {
                             [bself.delegate catalogDidFolded];
                         }
                     }];
    [UIView animateWithDuration:0.2
                          delay:0.01
                        options:UIViewAnimationOptionLayoutSubviews
                     animations:^{
                         self.buttonsBg.alpha = 0.0;
                     } completion:^(BOOL finished) {
                         
                     }];
}

@end
