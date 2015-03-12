//
//  RepayWayCell.m
//  DIDA_PROJECT
//
//  Created by 袁江 on 14/11/17.
//  Copyright (c) 2014年 luojilab.com. All rights reserved.
//

#import "RepayWayCell.h"

@interface RepayWayCell()

CREATE_STRONG UILabel *supportTitle;
CREATE_STRONG UILabel *restrictLb;
CREATE_STRONG UILabel *content;
CREATE_STRONG UIButton *supportButton;
@end

@implementation RepayWayCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.supportTitle = [[UILabel alloc] initForAutoLayout];
        self.restrictLb = [[UILabel alloc] initForAutoLayout];
        self.content = [[UILabel alloc] initForAutoLayout];
        self.supportTitle.textAlignment = NSTextAlignmentLeft;
        self.content.numberOfLines = 0;
        
        self.contentView.translatesAutoresizingMaskIntoConstraints = NO;
        self.supportButton = [ViewCreatorHelper createAutoLayoutButton:@"立即资助本计划"
                                                            normaImage:nil
                                                        highlitedImage:nil
                                                          disableImage:nil
                                                                target:nil
                                                                action:nil];
        
        [self addsubviewToContentView:@[_supportTitle, _restrictLb, _content, _supportButton]];
        
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.contentView
                                                                     attribute:NSLayoutAttributeWidth
                                                                     relatedBy:NSLayoutRelationEqual
                                                                        toItem:nil
                                                                     attribute:NSLayoutAttributeNotAnAttribute
                                                                    multiplier:1.0
                                                                      constant:[UIDevice screenWidth]]];
        NSDictionary *dict =  NSDictionaryOfVariableBindings(_supportTitle, _restrictLb, _content, _supportButton);
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:[NSString stringWithFormat:
                                                                                          @"H:|-%d-[_supportTitle]-%d-|", cellContentLeftInset + 10,cellContentLeftInset +10]
                                                                                 options:0
                                                                                 metrics:nil
                                                                                   views:dict]];
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:[NSString stringWithFormat:
                                                                                          @"H:|-%d-[_restrictLb]-%d-|", cellContentLeftInset + 10,cellContentLeftInset +10]
                                                                                 options:0
                                                                                 metrics:nil
                                                                                   views:dict]];

        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:[NSString stringWithFormat:
                                                                                          @"H:|-%d-[_content]-%d-|", cellContentLeftInset + 10,cellContentLeftInset +10]
                                                                                 options:0
                                                                                 metrics:nil
                                                                                   views:dict]];
        
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:[NSString stringWithFormat:
                                                                                          @"H:|-%d-[_supportButton]-%d-|", cellContentLeftInset + 30,cellContentLeftInset +30]
                                                                                 options:0
                                                                                 metrics:nil
                                                                                   views:dict]];

        
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-10-[_supportTitle]-10-[_restrictLb]-10-[_content]-10-[_supportButton(40)]-10-|"
                                                                                 options:0
                                                                                 metrics:nil
                                                                                   views:dict]];


        
        
        
    }
    return self;
}


-(void)configCellWithData:(id)data position:(CellPosition)position{
    self.supportTitle.text = @"¥2000回报";
    self.restrictLb.text = @"xxxx xxxx xxx";
    self.content.text = @"xxxx\ndfal\nflafj\n";
    self.supportButton.backgroundColor = DIDA_ORANGE_COLOR;
    [self showBg];
}

@end
