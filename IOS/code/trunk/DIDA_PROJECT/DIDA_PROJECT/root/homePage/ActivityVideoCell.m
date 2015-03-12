//
//  ActivityVideoCell.m
//  DIDA_PROJECT
//
//  Created by 袁江 on 14/11/12.
//  Copyright (c) 2014年 luojilab.com. All rights reserved.
//

#import "ActivityVideoCell.h"

@interface ActivityVideoCell()

CREATE_STRONG UILabel *titleLb;
CREATE_STRONG UIView  *videoView;

@end

@implementation ActivityVideoCell



-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.titleLb = [[UILabel alloc] initForAutoLayout];
        self.videoView = [[UIView alloc] initForAutoLayout];
        
        [self addsubviewToContentView:@[_titleLb, _videoView]];
        [self.titleLb autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:10];
        [self.titleLb autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:10];
        [self.titleLb autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:10];
        
        [self.videoView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.titleLb withOffset:10];
        [self.videoView autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.titleLb withOffset:0];
        [self.videoView autoSetDimension:ALDimensionHeight toSize:270];
        [self.videoView autoMatchDimension:ALDimensionWidth toDimension:ALDimensionWidth ofView:self.titleLb];
        
        NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self.contentView
                                                                      attribute:NSLayoutAttributeBottom
                                                                      relatedBy:NSLayoutRelationEqual
                                                                         toItem:self.videoView
                                                                      attribute:NSLayoutAttributeBottom
                                                                     multiplier:1.0
                                                                       constant:20];
        
//        constraint.priority = UILayoutPriorityDefaultLow;
//        [self.contentView addConstraint:constraint];

    }
    return self;
}


-(void)configCellWithData:(id)data position:(CellPosition)position{
    self.titleLb.text = @"活动视频";
    self.videoView.backgroundColor = [UIColor blueColor];
}

+(CGFloat)heightForClassCellWidth:(id)data position:(CellPosition)position{
    return 315;
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
