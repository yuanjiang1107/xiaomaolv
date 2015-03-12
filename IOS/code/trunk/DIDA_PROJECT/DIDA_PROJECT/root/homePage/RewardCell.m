//
//  RewardCell.m
//  DIDA_PROJECT
//
//  Created by 袁江 on 14/11/12.
//  Copyright (c) 2014年 luojilab.com. All rights reserved.
//

#import "RewardCell.h"

@implementation RewardCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
    }
    return self;
}

-(void)configCellWithData:(id)data position:(CellPosition)position{
    CGFloat vOffset = 8;
    CGFloat imageHeight = 200;
    
    CGFloat width = [UIDevice screenWidth] - (cellContentLeftInset + 10) * 2;
    
    for (int index = 0; index < 2; index++) {
        UILabel *lab = [[UILabel alloc] init];
        lab.text = @"乞力马扎罗山";
        [lab sizeToFit];
        lab.left = cellContentLeftInset + 10;
        lab.top = vOffset;
        
        vOffset += lab.height + 10;
        
        UIImageView *imageView = [[UIImageView alloc] init];
        [imageView sd_setImageWithURL:[NSURL URLWithString:@"http://b.hiphotos.baidu.com/image/w%3D2048/sign=6aa9e4258501a18bf0eb154faa170608/42166d224f4a20a4a75e5ece92529822720ed073.jpg"]];
        imageView.frame = CGRectMake(cellContentLeftInset + 10, vOffset, width, imageHeight);
        vOffset += imageHeight;
        
        [self.contentView addSubview:lab];
        [self.contentView addSubview:imageView];
        
        vOffset += 10;
    }
    [self showBg];
}

+(CGFloat)heightForClassCellWidth:(id)data position:(CellPosition)position{
    return 500;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
