//
//  UserInfoHeaderView.m
//  dida
//
//  Created by 袁江 on 14-9-24.
//  Copyright (c) 2014年 he chao. All rights reserved.
//

#define S self

#import "UserInfoHeaderView.h"


@interface UserInfoHeaderView()

@property(nonatomic, strong)UIImageView *avatar;

@property(nonatomic, strong)UIImageView *statusSymbol;

@property(nonatomic, strong)UILabel *nameLb;

@property(nonatomic, strong)UIImageView *genderSymbol;

@property(nonatomic, strong)UILabel *ageLb;

@property(nonatomic, strong)UILabel *weightLb;

@property(nonatomic, strong)UILabel *ciytLb;

@end

@implementation UserInfoHeaderView




-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.avatar = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 80, 80)];
        self.avatar.backgroundColor = [UIColor greenColor];
        self.statusSymbol = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 40, 20)];
        self.statusSymbol.backgroundColor = [UIColor orangeColor];
        self.statusSymbol.alpha = 0.5;
        self.nameLb = [ViewCreatorHelper createLabelWithTitle:@"Micell Sun"
                                                         font:[UIFont systemFontOfSize:20]
                                                        frame:CGRectMake(0, 0, 150, 20)
                                                    textColor:[UIColor whiteColor]
                                                textAlignment:NSTextAlignmentLeft];
        self.genderSymbol = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 8, 8)];
        self.genderSymbol.backgroundColor = [UIColor orangeColor];
        self.ageLb = [ViewCreatorHelper createLabelWithTitle:@"24 - 大学生"
                                                        font:[UIFont systemFontOfSize:14]
                                                       frame:CGRectMake(0, 0, 150, 14)
                                                   textColor:[UIColor whiteColor]
                                               textAlignment:NSTextAlignmentLeft];
        self.weightLb = [ViewCreatorHelper createLabelWithTitle:@"172cm/49kg"
                                                           font:[UIFont systemFontOfSize:14]
                                                          frame:CGRectMake(0, 0, 150, 14)
                                                      textColor:[UIColor whiteColor]
                                                  textAlignment:NSTextAlignmentLeft];
        self.ciytLb = [ViewCreatorHelper createLabelWithTitle:@"北京 － 海淀"
                                                         font:[UIFont systemFontOfSize:14]
                                                        frame:CGRectMake(0, 0, 150, 14)
                                                    textColor:[UIColor whiteColor]
                                                textAlignment:NSTextAlignmentLeft];
    
        [self addSubview:self.avatar];
        [self addSubview:self.statusSymbol];
        [self addSubview:self.nameLb];
        [self addSubview:self.genderSymbol];
        [self addSubview:self.ageLb];
        [self addSubview:self.weightLb];
        [self addSubview:self.ciytLb];
        S.backgroundColor = RGBCOLOR(255, 84, 186);
        self.avatar.image = [UIImage imageNamed:@"test.jpg"];
    }
    return self;
}

-(instancetype)init{
    return  [self initWithFrame:CGRectMake(0, 0, [UIDevice screenWidth], 100)];
}

-(void)layoutSubviews{
    [super layoutSubviews];
    S.avatar.left = 10;
    S.avatar.top = 10;
    S.statusSymbol.left = S.avatar.left;
    S.statusSymbol.top = S.avatar.top + 10;
    S.nameLb.top = 10;
    S.nameLb.left = S.avatar.right + 5;
    S.genderSymbol.left = S.nameLb.left;
    S.genderSymbol.top = S.nameLb.bottom + 5;
    S.ageLb.left = S.genderSymbol.right + 5;
    S.ageLb.top = S.nameLb.bottom + 5;
    S.weightLb.left = self.nameLb.left;
    S.weightLb.top = self.ageLb.bottom + 5;
    S.ciytLb.left = self.nameLb.left;
    S.ciytLb.top = self.weightLb.bottom + 5;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
