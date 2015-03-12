//
//  DreamInfoCell.m
//  DIDA_PROJECT
//
//  Created by 袁江 on 14/11/14.
//  Copyright (c) 2014年 luojilab.com. All rights reserved.
//

#import "DreamInfoCell.h"

#define testText  @"豪华游艇千人相亲大会da解放啦风家阿里减肥啦减肥的垃圾封疆dlfjxdfjalfjalfjaljdflajflfdjlaf哇卡卡"

@interface DreamInfoCell()

CREATE_STRONG UIImageView * activityPhoto;
CREATE_STRONG UILabel *activityTitle;
CREATE_STRONG UILabel *subTitle;
CREATE_STRONG UIView  *separateLIne;

CREATE_STRONG UIImageView *destinationsIcon;
CREATE_STRONG UIImageView *dateIcon;
CREATE_STRONG UIImageView *focusNumIcon;

CREATE_STRONG UILabel *destinationsLb;
CREATE_STRONG UILabel *dateLb;
CREATE_STRONG UILabel *focusNumLb;
@end

@implementation DreamInfoCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.activityPhoto = [[UIImageView alloc] init];
        self.activityTitle = [[UILabel alloc] init];
        self.subTitle = [[UILabel alloc] initForAutoLayout];
        self.activityTitle.lineBreakMode = NSLineBreakByClipping;
        self.separateLIne = [[UIView alloc] initForAutoLayout];
        self.separateLIne.translatesAutoresizingMaskIntoConstraints = NO;
        self.separateLIne.backgroundColor = [UIColor greenColor];
        
        self.activityPhoto.translatesAutoresizingMaskIntoConstraints = NO;
        self.activityTitle.translatesAutoresizingMaskIntoConstraints = NO;
        self.contentView.translatesAutoresizingMaskIntoConstraints = NO;
        
        self.destinationsIcon = [[UIImageView alloc] initForAutoLayout];
        self.dateIcon = [[UIImageView alloc] initForAutoLayout];
        self.focusNumIcon = [[UIImageView alloc] initForAutoLayout];
        
        self.destinationsLb = [[UILabel alloc] initForAutoLayout];
        self.dateLb = [[UILabel alloc] initForAutoLayout];
        self.focusNumLb = [[UILabel alloc] initForAutoLayout];
        self.destinationsLb.numberOfLines = 0;
        self.dateLb.numberOfLines = 0;
        self.focusNumLb.numberOfLines = 0;
        self.activityTitle.numberOfLines = 0;
        self.subTitle.numberOfLines = 0;
        
        self.destinationsIcon.backgroundColor = [UIColor blackColor];
        self.dateIcon.backgroundColor = [UIColor blackColor];
        self.focusNumIcon.backgroundColor =[UIColor blackColor];
        [self.contentView addSubview:self.activityPhoto];
        [self.contentView addSubview:self.activityTitle];
        [self.contentView addSubview:self.subTitle];
        [self.contentView addSubview:self.separateLIne];
        [self addsubviewToContentView:@[_destinationsIcon, _dateIcon, _focusNumIcon, _destinationsLb, _dateLb, _focusNumLb]];
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.contentView
                                                                    attribute:NSLayoutAttributeWidth
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:nil
                                                                    attribute:NSLayoutAttributeNotAnAttribute
                                                                   multiplier:1.0
                                                                     constant:[UIDevice screenWidth]]];
        NSDictionary *dic = NSDictionaryOfVariableBindings(_activityPhoto, _activityTitle, _subTitle, _separateLIne, _destinationsIcon, _destinationsLb, _dateIcon, _focusNumIcon, _dateLb, _focusNumLb);
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[_activityPhoto]-10-|"
                                                                                 options:0
                                                                                 metrics:nil
                                                                                   views:dic]];
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[_activityTitle]-10-|"
                                                                                 options:0
                                                                                 metrics:nil
                                                                                   views:dic]];
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[_subTitle]-10-|"
                                                                                 options:0
                                                                                 metrics:nil
                                                                                   views:dic]];
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[_separateLIne]-0-|"
                                                                                 options:0
                                                                                 metrics:nil
                                                                                   views:dic]];
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[_destinationsIcon(20)]-5-[_destinationsLb]-10-|"
                                                                                 options:0
                                                                                 metrics:nil
                                                                                   views:dic]];
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[_destinationsIcon]-5-[_dateLb]-10-|"
                                                                                 options:0
                                                                                 metrics:nil
                                                                                   views:dic]];
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[_destinationsIcon]-5-[_focusNumLb]-10-|"
                                                                                 options:0
                                                                                 metrics:nil
                                                                                   views:dic]];

        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[_dateIcon(20)]"
                                                                                 options:0
                                                                                 metrics:nil
                                                                                   views:dic]];
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[_focusNumIcon(20)]"
                                                                                 options:0
                                                                                 metrics:nil
                                                                                   views:dic]];


        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-5-[_activityPhoto(200)]-10-[_activityTitle]-10-[_subTitle]-10-[_separateLIne(0.5)]"
                                                                                 options:0
                                                                                 metrics:nil
                                                                                   views:dic]];
        
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_separateLIne]-10-[_destinationsIcon(20)]"
                                                                                 options:0
                                                                                 metrics:nil
                                                                                   views:dic]];

        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_separateLIne]-10-[_destinationsLb]-10-[_dateLb]-10-[_focusNumLb]"
                                                                                 options:0
                                                                                 metrics:nil
                                                                                   views:dic]];
        
        
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_dateIcon(20)]"
                                                                                 options:0
                                                                                 metrics:nil
                                                                                   views:dic]];
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_focusNumIcon(20)]"
                                                                                 options:0
                                                                                 metrics:nil
                                                                                   views:dic]];
        
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.dateIcon
                                                                    attribute:NSLayoutAttributeTop
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:self.dateLb
                                                                    attribute:NSLayoutAttributeTop
                                                                   multiplier:1.0
                                                                      constant:0]];

        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.focusNumIcon
                                                                     attribute:NSLayoutAttributeTop
                                                                     relatedBy:NSLayoutRelationEqual
                                                                        toItem:self.focusNumLb
                                                                     attribute:NSLayoutAttributeTop
                                                                    multiplier:1.0
                                                                      constant:0]];
        

        NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self.contentView
                                                                      attribute:NSLayoutAttributeBottom
                                                                      relatedBy:NSLayoutRelationEqual
                                                                         toItem:self.focusNumLb
                                                                      attribute:NSLayoutAttributeBottom
                                                                     multiplier:1.0
                                                                       constant:20];
        
        [self.contentView addConstraint:constraint];
        
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
}



-(void)configCellWithData:(id)data position:(CellPosition)position{
    [self.activityPhoto sd_setImageWithURL:[NSURL URLWithString:@"http://f.hiphotos.baidu.com/image/pic/item/37d12f2eb9389b50d28b314e8635e5dde7116eb2.jpg"]];
    self.activityTitle.text = testText;
    self.subTitle.text = @"2014";
    self.destinationsLb.text = @"记得叫啊d叫fjafaljflajfljaldfjaljfdlajflajdflajflajflajldajdljfalfjaldsfflajdf";
    self.dateLb.text = @"活动时间：10-10 至 10-18";
    self.focusNumLb.text = @"232人关注，1212人关注\n 112人报名";
}



@end
