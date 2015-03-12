//
//  SignUpCell.m
//  DIDA_PROJECT
//
//  Created by 袁江 on 14/11/12.
//  Copyright (c) 2014年 luojilab.com. All rights reserved.
//

#import "SignUpCell.h"
#import "RTLabel.h"


NSString *promptTextFormate = @"由于手机功能限制，众筹报名必须通过网站发起\n请访问网站<a href='http://you1ke.com' color='#bbff00'>http://you1ke.com</a>\n并搜索数字<font face='HelveticaNeue-CondensedBold' size=20 color='#CCFF00'>%@</font>查看本活动报名";


@interface SignUpCell()

CREATE_STRONG UILabel *priceLb;
CREATE_STRONG UIButton *signUpButton;
CREATE_STRONG UIButton *crowdfundingButton;
CREATE_STRONG UIImageView *promptIcon;
CREATE_STRONG RTLabel *promptLb;


@end


@implementation SignUpCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.priceLb = [[UILabel alloc] initForAutoLayout];
        self.priceLb.textAlignment = NSTextAlignmentCenter;
        self.signUpButton = [ViewCreatorHelper createAutoLayoutButton:@"立刻报名"
                                                           normaImage:nil
                                                       highlitedImage:nil
                                                         disableImage:nil
                                                               target:nil
                                                               action:nil];
        self.crowdfundingButton = [ViewCreatorHelper createAutoLayoutButton:@"众筹报名"
                                                                 normaImage:nil
                                                             highlitedImage:nil
                                                               disableImage:nil
                                                                     target:nil
                                                                     action:nil];
        self.signUpButton.backgroundColor = DIDA_ORANGE_COLOR;
        self.crowdfundingButton.backgroundColor = DIDA_BACKGROUND_COLOR;
        
        self.promptIcon = [[UIImageView alloc] initForAutoLayout];
        self.promptIcon.backgroundColor = [UIColor blackColor];
        self.promptLb = [[RTLabel alloc] initWithFrame:CGRectMake(0, 0, [UIDevice screenWidth] - 100, 0)];
        
//        [self addsubviewToContentView:@[self.priceLb, self.signUpButton, self.crowdfundingButton, self.promptIcon, self.promptLb]];
        [self.contentView addSubview:self.promptLb];
        
//        
//        
//        [self.priceLb autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:10];
//        [self.priceLb autoAlignAxisToSuperviewAxis:ALAxisVertical];
//        [self.signUpButton  autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.priceLb withOffset:10];
//        [self.crowdfundingButton autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.signUpButton withOffset:10];
//        [self.promptIcon autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.crowdfundingButton withOffset:10];
//        [self.promptLb autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.crowdfundingButton withOffset:10];
//        
//        [self.signUpButton autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:40];
//        [self.signUpButton autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:40];
//        [self.signUpButton autoSetDimension:ALDimensionHeight toSize:30];
//        
//        [self.crowdfundingButton autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.signUpButton];
//        [self.crowdfundingButton autoMatchDimension:ALDimensionWidth toDimension:ALDimensionWidth ofView:self.signUpButton];
//        [self.crowdfundingButton autoSetDimension:ALDimensionHeight toSize:30];
//        
//        
//        [self.promptLb autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:30];
//        [self.promptLb autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:30];
//        [self.promptLb autoSetDimension:ALDimensionHeight toSize:100];
//        
//        [self.promptIcon autoSetDimensionsToSize:CGSizeMake(10, 10)];
//        [self.promptIcon autoPinEdge:ALEdgeRight toEdge:ALEdgeLeft ofView:self.promptLb withOffset:-5];
//        
//        
//        NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self.contentView
//                                                                      attribute:NSLayoutAttributeBottom
//                                                                      relatedBy:NSLayoutRelationEqual
//                                                                         toItem:self.promptLb
//                                                                      attribute:NSLayoutAttributeBottom
//                                                                     multiplier:1.0
//                                                                       constant:10];
        
//        [self.contentView addConstraint:constraint];

        
        
        
    }
    return self;
}


-(void)layoutSubviews{
    [super layoutSubviews];
    CGSize optimumSize = [self.promptLb optimumSize];
    CGRect frame = [self.promptLb frame];
    frame.size.height = (int)optimumSize.height;
    [self.promptLb setFrame:frame];
    self.promptLb.bottom = self.height;
}

-(void)configCellWithData:(id)data position:(CellPosition)position{
    self.priceLb.text = @"费用¥7803／人";
    self.promptLb.text = [NSString stringWithFormat:promptTextFormate, @"23244"];
    self.promptLb.backgroundColor = [UIColor redColor];
}

+(CGFloat)heightForClassCellWidth:(id)data position:(CellPosition)position{
    return 300;
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
