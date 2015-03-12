//
//  ActivityInfoCell.m
//  DIDA_PROJECT
//
//  Created by 袁江 on 14/11/12.
//  Copyright (c) 2014年 luojilab.com. All rights reserved.
//

#import "ActivityInfoCell.h"

@interface ActivityInfoCell()



@end

@implementation ActivityInfoCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
//        self.contentView.translatesAutoresizingMaskIntoConstraints = NO;
        self.activityPhoto = [[UIImageView alloc] initForAutoLayout];
        self.focusButton = [ViewCreatorHelper createAutoLayoutButton:@"关注"
                                                          normaImage:nil
                                                      highlitedImage:nil
                                                        disableImage:nil
                                                              target:nil
                                                              action:nil];
        self.shareButton = [ViewCreatorHelper createAutoLayoutButton:@"分享"
                                                          normaImage:nil
                                                      highlitedImage:nil
                                                        disableImage:nil
                                                              target:nil
                                                              action:nil];
        self.focusButton.backgroundColor = DIDA_ORANGE_COLOR;
        self.shareButton.backgroundColor = DIDA_ORANGE_COLOR;

        
        self.activityTitle = [[UILabel alloc] initForAutoLayout];
        self.activitySubTitle = [[UILabel alloc] initForAutoLayout];
        self.separateLine = [[UIView alloc] initForAutoLayout];
        self.separateLine.backgroundColor = [UIColor redColor];
        
        
        self.destinationsIcon = [[UIImageView alloc] initForAutoLayout];
        self.dateIcon = [[UIImageView alloc] initForAutoLayout];
        self.focusNumIcon= [[UIImageView alloc] initForAutoLayout];
        
        self.destinationsLb = [[UILabel alloc] initForAutoLayout];
        self.dateLb = [[UILabel alloc] initForAutoLayout];
        self.focusNumLb = [[UILabel alloc] initForAutoLayout];
        self.destinationsLb.numberOfLines = 0;
        self.dateLb.numberOfLines = 0;
        self.focusNumLb.numberOfLines = 0;
        self.activityTitle.numberOfLines = 0;
        
        [self addsubviewToContentView:@[_activityPhoto
                                        , _focusButton, _shareButton, _activityTitle, _activitySubTitle, _separateLine,
                                        _destinationsIcon,
                                         _destinationsLb, _dateIcon, _dateLb,_focusNumIcon,  _focusNumLb]];
        
        
        
        
        [self.activityPhoto autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:0];
        [self.activityPhoto autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:0];
        [self.activityPhoto autoMatchDimension:ALDimensionWidth toDimension:ALDimensionWidth ofView:self.contentView];
        [self.activityPhoto autoSetDimension:ALDimensionHeight toSize:200];
        
        
        [self.focusButton autoSetDimensionsToSize:CGSizeMake(40, 30)];
        [self.shareButton autoSetDimensionsToSize:CGSizeMake(40, 30)];
        [self.focusButton autoPinEdge:ALEdgeRight toEdge:ALEdgeLeft ofView:self.shareButton withOffset:-10];
        [self.focusButton autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:self.activityPhoto withOffset:-10];
        [self.shareButton autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self.activityPhoto withOffset:-10];
        [self.shareButton  autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:self.activityPhoto withOffset:-10];
        
        
        [self.activityTitle autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.activityPhoto withOffset:10];
        [self.activityTitle autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.activityPhoto withOffset:10];
        
        [self.activitySubTitle autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.activityTitle withOffset:0];
        [self.activitySubTitle autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.activityTitle withOffset:10];
        
        [self.separateLine autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.activityPhoto withOffset:0];
        [self.separateLine autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.activitySubTitle withOffset:10];
        [self.separateLine autoMatchDimension:ALDimensionWidth toDimension:ALDimensionWidth ofView:self.contentView];
        [self.separateLine autoSetDimension:ALDimensionHeight toSize:0.5];
        
        [self.destinationsIcon autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.activitySubTitle withOffset:0];
        [self.destinationsIcon autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.activitySubTitle withOffset:20];
        [self.destinationsIcon autoSetDimensionsToSize:CGSizeMake(20, 20)];
        
        [self.destinationsLb autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:self.destinationsIcon withOffset:0];
        [self.destinationsLb autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.destinationsIcon withOffset:5];
        [self.destinationsLb autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self.activityPhoto withOffset:-10];
        
        [self.dateIcon autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.destinationsLb withOffset:10];
        [self.dateIcon autoSetDimensionsToSize:CGSizeMake(20, 20)];

        [self.dateLb autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.destinationsLb withOffset:10];
        [self.dateLb autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self.activityPhoto withOffset:-10];

        [self.focusNumIcon  autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.dateLb withOffset:5];
        [self.focusNumIcon autoSetDimensionsToSize:CGSizeMake(20, 20)];
        [self.focusNumLb autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:self.focusNumIcon withOffset:0];
        [self.focusNumLb autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self.activityPhoto withOffset:-10];

        [@[self.destinationsIcon, self.dateIcon, self.focusNumIcon] autoAlignViewsToEdge:ALEdgeLeft];
        [@[self.destinationsLb, self.dateLb, self.focusNumLb] autoAlignViewsToEdge:ALEdgeLeft];

//        [self.contentView autoSetDimension:ALDimensionWidth toSize:[UIDevice screenWidth]];
        NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self.contentView
                                                                      attribute:NSLayoutAttributeBottom
                                                                      relatedBy:NSLayoutRelationGreaterThanOrEqual
                                                                         toItem:self.activityPhoto
                                                                      attribute:NSLayoutAttributeBottom
                                                                     multiplier:1.0
                                                                       constant:20];
        
//        [self.contentView addConstraint:constraint];
        
    }
    return self;
}

-(void)configCellWithData:(id)data position:(CellPosition)position{
    [self.activityPhoto sd_setImageWithURL:[NSURL URLWithString:@"http://f.hiphotos.baidu.com/image/pic/item/37d12f2eb9389b50d28b314e8635e5dde7116eb2.jpg"]];
    self.activityTitle.text = @"豪华游艇千人相亲大会";
    self.activitySubTitle.text = @"2014光棍节脱光计划";
    self.destinationsLb.text = @"途径：ddddddddd";
    self.dateLb.text = @"9-9 至 10-2";
    self.focusNumLb.text = @"xxxx人关\n注";
    self.destinationsIcon.backgroundColor = [UIColor blackColor];
    self.dateIcon.backgroundColor = [UIColor blackColor];
    self.focusNumIcon.backgroundColor = [UIColor blackColor];
    self.backgroundColor = [UIColor greenColor];
}




+(CGFloat)heightForClassCellWidth:(id)data position:(CellPosition)position{
    return 500;
}

@end
