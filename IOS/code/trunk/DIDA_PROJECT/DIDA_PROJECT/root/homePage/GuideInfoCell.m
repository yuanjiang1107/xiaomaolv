//
//  GuideInfoCell.m
//  DIDA_PROJECT
//
//  Created by 袁江 on 14/11/12.
//  Copyright (c) 2014年 luojilab.com. All rights reserved.
//

#import "GuideInfoCell.h"

@implementation GuideInfoCell

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
        [imageView sd_setImageWithURL:[NSURL URLWithString:@"http://e.hiphotos.baidu.com/image/w%3D2048/sign=0935132e38f33a879e6d071af2641038/55e736d12f2eb938475ceaecd7628535e5dd6fff.jpg"]];
        imageView.frame = CGRectMake(cellContentLeftInset + 10, vOffset, width, imageHeight);
        vOffset += imageHeight;
        
        [self.contentView addSubview:lab];
        [self.contentView addSubview:imageView];
        
        vOffset += 10;
    }
    
    [self showBg];
}


-(CGFloat)heightForCellWidth:(id)data{
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
