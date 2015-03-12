//
//  ChatCell.m
//  DIDA_PROJECT
//
//  Created by 袁江 on 14-10-11.
//  Copyright (c) 2014年 luojilab.com. All rights reserved.
//

#import "ChatCell.h"

@interface ChatCell()

@property(nonatomic, strong)UIImageView *avatarBg;
@property(nonatomic, strong)UIImageView *avatar;
@property(nonatomic, strong)UIImageView *genderIcon;
@property(nonatomic, strong)UILabel *nameLb;
@property(nonatomic, strong)UILabel *timeLb;
@property(nonatomic, strong)UILabel *messageLb;

@end

@implementation ChatCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.avatarBg = [[UIImageView alloc] initForAutoLayout];
        self.avatar = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
        self.nameLb = [[UILabel alloc] initForAutoLayout];
        self.timeLb = [[UILabel alloc] initForAutoLayout];
        self.messageLb = [[UILabel alloc] initForAutoLayout];
        self.genderIcon = [[UIImageView alloc] initForAutoLayout];
        self.avatar.clipsToBounds = YES;
        
        self.avatar.layer.cornerRadius = 25;
        self.avatar.layer.borderWidth = 1;
        self.avatar.layer.borderColor = [UIColor blackColor].CGColor;
        [self.avatarBg addSubview:self.avatar];
        self.timeLb.textAlignment = NSTextAlignmentRight;
        self.timeLb.textColor = DIDA_TEXT_COLOR;
        
        self.nameLb.font = [UIFont boldSystemFontOfSize:14.0f];
        self.messageLb.font = [UIFont systemFontOfSize:12.0f];
        self.timeLb.font = [UIFont systemFontOfSize:12.0f];
        self.messageLb.textColor = DIDA_TEXT_COLOR;
        self.contentView.translatesAutoresizingMaskIntoConstraints = NO;
        [self addsubviewToContentView:@[_avatarBg, _nameLb, _timeLb, _messageLb, _genderIcon]];
        
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.contentView
                                                                     attribute:NSLayoutAttributeWidth
                                                                     relatedBy:NSLayoutRelationEqual
                                                                        toItem:nil
                                                                     attribute:NSLayoutAttributeNotAnAttribute
                                                                    multiplier:1.0
                                                                      constant:[UIDevice screenWidth]]];
        
        
        NSDictionary *dict = NSDictionaryOfVariableBindings(_avatarBg, _nameLb, _timeLb, _messageLb, _genderIcon);
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:
                                          [NSString stringWithFormat:@"H:|-%d-[_avatarBg(50)]-7-[_nameLb]-10-[_genderIcon(10)]-5-[_timeLb]-%d-|", cellContentLeftInset + 10, cellContentLeftInset + 10]
                                                                                 options:0
                                                                                 metrics:nil
                                                                                   views:dict]];
        
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:
                                          [NSString stringWithFormat:@"H:[_avatarBg]-7-[_messageLb]-20-|"]
                                                                                 options:0
                                                                                 metrics:nil
                                                                                   views:dict]];
        
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-10-[_avatarBg(50)]-10-|"                                                                                 options:0
                                                                                 metrics:nil
                                                                                   views:dict]];
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-17-[_nameLb]-5-[_messageLb]"                                                                                 options:0
                                                                                 metrics:nil
                                                                                   views:dict]];
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-17-[_timeLb]"                                                                                 options:0
                                                                                 metrics:nil
                                                                                   views:dict]];
        
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[_genderIcon(10)]"                                                                                 options:0
                                                                                 metrics:nil
                                                                                   views:dict]];


        
        
    }
    return self;
}

-(void)configCellWithData:(id)data position:(CellPosition)position{
    [self showBg];
    self.nameLb.text = @"小明";
    self.messageLb.text = @"滚出去";
    self.timeLb.text = @"10.1";
    self.genderIcon.backgroundColor = [UIColor blackColor];
    [self.avatar sd_setImageWithURL:[NSURL URLWithString:@"http://news.yzz.cn/public/images/110213/68_193730_28e63.jpg"]];

}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
