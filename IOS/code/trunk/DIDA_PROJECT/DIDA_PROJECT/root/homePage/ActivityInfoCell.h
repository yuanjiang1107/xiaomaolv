//
//  ActivityInfoCell.h
//  DIDA_PROJECT
//
//  Created by 袁江 on 14/11/12.
//  Copyright (c) 2014年 luojilab.com. All rights reserved.
//

#import "DiDaTableViewCell.h"

@interface ActivityInfoCell : DiDaTableViewCell

CREATE_STRONG UIImageView* activityPhoto;
CREATE_STRONG UIButton *focusButton;
CREATE_STRONG UIButton *shareButton;

CREATE_STRONG UILabel *activityTitle;
CREATE_STRONG UILabel *activitySubTitle;
CREATE_STRONG UIView *separateLine;

CREATE_STRONG UIImageView *destinationsIcon;
CREATE_STRONG UIImageView *dateIcon;
CREATE_STRONG UIImageView *focusNumIcon;

CREATE_STRONG UILabel *destinationsLb;
CREATE_STRONG UILabel *dateLb;
CREATE_STRONG UILabel *focusNumLb;


@end
