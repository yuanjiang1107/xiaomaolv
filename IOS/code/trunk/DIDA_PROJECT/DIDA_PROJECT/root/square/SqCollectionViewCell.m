//
//  SqCollectionViewCell.m
//  dida
//
//  Created by 袁江 on 14-9-24.
//  Copyright (c) 2014年 he chao. All rights reserved.
//

#import "SqCollectionViewCell.h"

@interface SqCollectionViewCell()

@property(nonatomic, strong)UIImageView *avatar;
@property(nonatomic, strong)UIImageView *stateView;
@property(nonatomic, strong)UIImageView *genderSymbol;
@property(nonatomic, strong)UIImageView *citySymbol;
@property(nonatomic, strong)UILabel *genderLb;
@property(nonatomic, strong)UILabel *cityLb;

@property(nonatomic, strong)UIView *bottomBg;
@end

@implementation SqCollectionViewCell


-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.avatar = [[UIImageView alloc] init];
        [self.avatar sd_setImageWithURL:[NSURL URLWithString:@"http://news.yzz.cn/public/images/110213/68_193730_28e63.jpg"]];
//        
//        UIImageView *view = [[UIImageView alloc] init];
//        view.image = [UIImage imageNamed:@"test.jpg"];
//        self.selectedBackgroundView = view;
        self.backgroundView = self.avatar;
        //[self.contentView addSubview:self.avatar];
        
        self.stateView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 40, 20)];
        self.stateView.backgroundColor = [UIColor greenColor];
        [self.contentView addSubview:self.stateView];
        self.stateView.alpha = 0.5;
        self.bottomBg = [[UIView alloc] init];
        self.genderSymbol = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, 8, 8)];
        self.genderSymbol.backgroundColor = [UIColor greenColor];
        self.genderLb = [ViewCreatorHelper createLabelWithTitle:@"男"
                                                           font:[UIFont systemFontOfSize:10]
                                                          frame:CGRectMake(0, 0, 20, 15)
                                                      textColor:[UIColor orangeColor]
                                                  textAlignment:NSTextAlignmentLeft];
        self.citySymbol = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, 8, 8)];
        self.citySymbol.backgroundColor = [UIColor greenColor];
        self.cityLb = [ViewCreatorHelper createLabelWithTitle:@"北京"
                                                         font:[UIFont systemFontOfSize:10]
                                                        frame:CGRectMake(0, 0, 30, 15)
                                                    textColor:[UIColor orangeColor]
                                                textAlignment:NSTextAlignmentLeft];
        
        self.genderSymbol.left = 5;
        self.citySymbol.left = 40;
        self.genderLb.left = self.genderSymbol.right + 5;
        self.cityLb.left = self.citySymbol.right + 5;
        self.bottomBg.alpha = 0.3;
        self.bottomBg.backgroundColor = [UIColor blackColor];
        [self.bottomBg addSubview:self.genderSymbol];
        [self.bottomBg addSubview:self.genderLb];
        [self.bottomBg addSubview:self.citySymbol];
        [self.bottomBg addSubview:self.cityLb];
        [self.contentView addSubview:self.bottomBg];
        
        UIView *sView = [[UIView alloc] init];
        sView.backgroundColor = [UIColor blackColor];
        sView.alpha = 0.2;
        self.selectedBackgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ios-icon-游记B.png"]];
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.bottomBg.frame = CGRectMake(0, 0, self.width, 15);
    self.bottomBg.bottom = self.height;
    self.stateView.right = self.width + 5;
    self.stateView.top = 10;
}
@end
