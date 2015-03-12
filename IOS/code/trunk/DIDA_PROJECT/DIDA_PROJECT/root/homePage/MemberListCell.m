//
//  MemberListCell.m
//  DIDA_PROJECT
//
//  Created by 袁江 on 14/11/12.
//  Copyright (c) 2014年 luojilab.com. All rights reserved.
//

#import "MemberListCell.h"

@interface MemberListCell()

CREATE_STRONG UIButton *morebutton;

@end



@implementation MemberListCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.morebutton = [ViewCreatorHelper createButtonWithTitle:@"查看全部"
                                                             frame:CGRectZero
                                                             image:nil
                                                           hlImage:nil
                                                          disImage:nil
                                                            target:nil
                                                            action:nil];
        self.morebutton.backgroundColor = DIDA_ORANGE_COLOR;
        
        [self.contentView addSubview:_morebutton];
 
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.morebutton.frame =   self.morebutton.frame = CGRectMake(0, 0, self.width - 40 * 2, 40);
    self.morebutton.bottom = self.height - 10;
    self.morebutton.centerX = self.width / 2;
}

-(void)configCellWithData:(id)data position:(CellPosition)position{
    CGFloat width = [UIDevice screenWidth] - cellContentLeftInset * 2;
    CGFloat width1 = width - 10 * 5;
    CGFloat avatarWidth = width1 / 4;
    
    for (int index = 0; index < 8; index++) {
        UIImageView *avatar = [[UIImageView alloc] init];
        avatar.backgroundColor = [UIColor greenColor];
        
        NSInteger remainder = index % 4;
        NSInteger mod = index / 4;
        CGFloat hOffset = 10 * (remainder + 1) + avatarWidth * remainder;
        CGFloat VOffset = 10 * mod + 10 + avatarWidth * mod;
        
        avatar.frame = CGRectMake(hOffset + cellContentLeftInset, VOffset, avatarWidth, avatarWidth);
        
        
        [self.contentView addSubview:avatar];
    }
    
    [self showBg];
}


-(CGFloat)heightForCellWidth:(id)data{
    return 220;
}



@end
