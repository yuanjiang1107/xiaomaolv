//
//  MyDreamCell.m
//  DIDA_PROJECT
//
//  Created by 袁江 on 14/12/3.
//  Copyright (c) 2014年 luojilab.com. All rights reserved.
//

#import "MyDreamCell.h"
#import "DiDaButton.h"

@interface MyDreamCell()

CREATE_STRONG UIButton *addFeedButton;
CREATE_STRONG UIButton *shareButton;

@end

@implementation MyDreamCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.addFeedButton = [UIButton button];
        self.shareButton = [UIButton button];
        [self.contentView addSubview:self.addFeedButton];
        [self.contentView addSubview:self.shareButton];
        [self.addFeedButton setTitle:@"添加动态" forState:UIControlStateNormal];
        [self.shareButton setTitle:@"分享" forState:UIControlStateNormal];
        self.shareButton.titleLabel.font = [UIFont systemFontOfSize:14.0f];
        self.addFeedButton.titleLabel.font = [UIFont systemFontOfSize:14.0f];

    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.addFeedButton.frame = CGRectMake(self.width - 145, self.height - 35, 75, 27);
    self.shareButton.frame = CGRectMake(self.addFeedButton.right + 10, self.addFeedButton.top, 50, 27);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
