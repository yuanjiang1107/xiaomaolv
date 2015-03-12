//
//  ActivityCell.m
//  DIDA_PROJECT
//
//  Created by 袁江 on 14-10-24.
//  Copyright (c) 2014年 luojilab.com. All rights reserved.
//

#import "ActivityCell.h"

@interface ActivityCell()


@end

@implementation ActivityCell

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.lab = [UILabel new];
        [self.contentView addSubview:self.lab];
        self.lab.numberOfLines = 0;
        [self.lab autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:0];
        [self.lab autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:10];
        [self.lab  autoSetDimension:ALDimensionWidth toSize:100];
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.contentView
                                                                    attribute:NSLayoutAttributeBottom
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:self.lab
                                                                    attribute:NSLayoutAttributeBottom
                                                                   multiplier:1.0
                                                                     constant:0]];
    }
    return self;
}

-(void)configCellWithData:(id)data position:(CellPosition)position{
    self.lab.text = @"nfdjfalfja\nfkjaklfjda\nkfdlajlfa\nfnakljfdla\nf";
    
}

@end
