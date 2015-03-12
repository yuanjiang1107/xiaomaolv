//
//  OwnerFeedCell.m
//  DIDA_PROJECT
//
//  Created by 袁江 on 14/11/17.
//  Copyright (c) 2014年 luojilab.com. All rights reserved.
//

#import "OwnerFeedCell.h"
#import "Dashed.h"


@interface OwnerFeedCell()

CREATE_STRONG Dashed *dashed;
CREATE_STRONG UIView *dot;
CREATE_STRONG UILabel *date;
CREATE_STRONG UIImageView *contentBg;

CREATE_STRONG NSArray *dashedConstraints;

@end

@implementation OwnerFeedCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.dashed = [[Dashed alloc] initForAutoLayout];
        self.dashed.dashedDirection = DashedDirectionVertical;
        
        self.dot = [[UIView alloc] initForAutoLayout];
        self.dot.backgroundColor = DIDA_ORANGE_COLOR;
        
        self.date = [[UILabel alloc] initForAutoLayout];
        self.date.font = [UIFont systemFontOfSize:12.0];
        self.contentBg = [[UIImageView alloc] initForAutoLayout];
        self.contentBg.backgroundColor = [UIColor yellowColor];
        self.contentView.translatesAutoresizingMaskIntoConstraints = NO;
        [self addsubviewToContentView:@[_dashed, _date, _dot, _contentBg]];
        
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.contentView
                                                                     attribute:NSLayoutAttributeWidth
                                                                     relatedBy:NSLayoutRelationEqual
                                                                        toItem:nil
                                                                     attribute:NSLayoutAttributeNotAnAttribute
                                                                    multiplier:1.0
                                                                      constant:[UIDevice screenWidth]]];

        
        NSDictionary *dict = NSDictionaryOfVariableBindings(_dashed, _date, _dot, _contentBg);
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:
                                        [NSString stringWithFormat:@"H:|-%d-[_dot(5)]-5-[_date(70)]-10-[_contentBg]-%d-|", cellContentLeftInset + 10, cellContentLeftInset + 10]
                                                                               options:0
                                                                               metrics:nil
                                                                                 views:dict]];
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:
                                          [NSString stringWithFormat:@"H:|-%f-[_dashed(2)]", cellContentLeftInset + 11.5]
                                                                                 options:0
                                                                                 metrics:nil
                                                                                   views:dict]];

        
        
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[_dot(5)]"
                                                                                options:0
                                                                                metrics:nil
                                                                                  views:dict]];
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-16-[_date]"
                                                                                 options:0
                                                                                 metrics:nil
                                                                                   views:dict]];
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-10-[_contentBg(100)]"
                                                                                 options:0
                                                                                 metrics:nil
                                                                                   views:dict]];

        NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self.contentView
                                                                      attribute:NSLayoutAttributeBottom
                                                                      relatedBy:NSLayoutRelationGreaterThanOrEqual
                                                                         toItem:self.contentBg
                                                                      attribute:NSLayoutAttributeBottom
                                                                     multiplier:1.0
                                                                       constant:20];
        [self.contentView addConstraint:constraint];


        
    }
    return self;
}


-(void)configCellWithData:(id)data position:(CellPosition)position{
    self.date.text = @"2014.12.12";
    if (self.dashedConstraints) {
        [self.contentView removeConstraints:self.dashedConstraints];
    }
    if (position == CellPositionTop) {
        NSDictionary *dict = NSDictionaryOfVariableBindings(_dashed, _date, _dot, _contentBg);
        self.dashedConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[_dashed]-0-|"
                                                                         options:0
                                                                         metrics:nil
                                                                           views:dict];
    }else if(position == CellPositionMid) {
        NSDictionary *dict = NSDictionaryOfVariableBindings(_dashed, _date, _dot, _contentBg);
        self.dashedConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[_dashed]-0-|"
                                                                         options:0
                                                                         metrics:nil
                                                                           views:dict];
  
    }else {
        NSDictionary *dict = NSDictionaryOfVariableBindings(_dashed, _date, _dot, _contentBg);
        self.dashedConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[_dashed(20)]"
                                                                         options:0
                                                                         metrics:nil
                                                                           views:dict];

    }
    [self.contentView addConstraints:self.dashedConstraints];
    [self showBg];
    self.needSeparator = NO;

}

-(CGFloat)heightForCellWidth:(id)data{
    [self configCellWithData:nil position:CellPositionTop];
    CGSize size = [self.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    return size.height;
}



//-(void)layoutSubviews{
//    [super layoutSubviews];
//    self.dashed.frame = CGRectMake(100, 0, 10, self.height);
//}
//
//-(CGFloat)heightForCellWidth:(id)data{
//    return 100;
//}

@end
