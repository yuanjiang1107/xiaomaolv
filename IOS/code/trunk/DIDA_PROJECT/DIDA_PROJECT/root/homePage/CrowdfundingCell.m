//
//  CrowdfundingCell.m
//  DIDA_PROJECT
//
//  Created by 袁江 on 14/11/17.
//  Copyright (c) 2014年 luojilab.com. All rights reserved.
//

#import "CrowdfundingCell.h"
#import "DiDaProgressView.h"


@interface CrowdfundingCell()

CREATE_STRONG UILabel *crowdfundingTitle;
CREATE_STRONG DiDaProgressView *process;
CREATE_STRONG UILabel *processDes;
CREATE_STRONG UIView *repayWay;

@end

@implementation CrowdfundingCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.crowdfundingTitle = [[UILabel alloc] initForAutoLayout];
        self.crowdfundingTitle.font = [UIFont systemFontOfSize:14.0f];
        self.process = [[DiDaProgressView alloc] initForAutoLayout];
        self.processDes = [[UILabel alloc] initForAutoLayout];
        self.repayWay = [[UIView alloc] initForAutoLayout];
        self.repayWay.backgroundColor = [UIColor yellowColor];
        self.contentView.translatesAutoresizingMaskIntoConstraints = NO;
        self.crowdfundingTitle.textAlignment = NSTextAlignmentCenter;
        [self addsubviewToContentView:@[_crowdfundingTitle, _process, _processDes, _repayWay]];
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.contentView
                                                                     attribute:NSLayoutAttributeWidth
                                                                     relatedBy:NSLayoutRelationEqual
                                                                        toItem:nil
                                                                     attribute:NSLayoutAttributeNotAnAttribute
                                                                    multiplier:1.0
                                                                      constant:[UIDevice screenWidth]]];

        
        NSDictionary *dict = NSDictionaryOfVariableBindings(_crowdfundingTitle, _process, _processDes, _repayWay);
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:[NSString stringWithFormat:
                                                                                          @"H:|-%d-[_crowdfundingTitle]-%d-|", cellContentLeftInset + 10,cellContentLeftInset +10]
                                                                                 options:0
                                                                                 metrics:nil
                                                                                   views:dict]];
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:[NSString stringWithFormat:
                                                                                          @"H:|-%d-[_process]-%d-|", cellContentLeftInset + 10,cellContentLeftInset + 10]
                                                                                 options:0
                                                                                 metrics:nil
                                                                                   views:dict]];
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:[NSString stringWithFormat:
                                                                                          @"H:|-%d-[_processDes]-%d-|", cellContentLeftInset + 10,cellContentLeftInset + 10]
                                                                                 options:0
                                                                                 metrics:nil
                                                                                   views:dict]];
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:[NSString stringWithFormat:
                                                                                          @"H:|-%d-[_repayWay]-%d-|", cellContentLeftInset + 10,cellContentLeftInset + 10]
                                                                                 options:0
                                                                                 metrics:nil
                                                                                   views:dict]];
        
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-10-[_crowdfundingTitle]-10-[_process(5)]-10-[_processDes]-10-[_repayWay(100)]-10-|"
                                                                                 options:0
                                                                                 metrics:nil
                                                                                   views:dict]];



        
        
    }
    return self;
}


-(void)configCellWithData:(id)data position:(CellPosition)position{
    
    self.crowdfundingTitle.attributedText = [NSMutableAttributedString crowdfundingStrWidth:@"需筹款"
                                                              crowdfunding:@"1234567"
                                                                    suffix:@""];
    self.processDes.text = @"xxxx";
    self.process.progress = 0.6;
    [self showBg];
}
@end
