//
//  DreamDetailCell.m
//  DIDA_PROJECT
//
//  Created by 袁江 on 14/11/17.
//  Copyright (c) 2014年 luojilab.com. All rights reserved.
//

#import "DreamDetailCell.h"
#import <CoreText/CoreText.h>
@interface DreamDetailCell()

CREATE_STRONG UILabel *detail;

@end

@implementation DreamDetailCell



-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.detail = [[UILabel alloc] init];
        [self.contentView addSubview:self.detail];
        self.detail.numberOfLines = 0;
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.detail.frame = CGRectMake(20, 10, self.width - 40, self.height);
    
}

-(CGFloat)heightForCellWidth:(id)data{
    return 100;
}

-(void)configCellWithData:(id)data position:(CellPosition)position{
    self.detail.text = @"基督教阿里风景的；发放垃圾；发觉；福大；发觉；打飞机啊；发；发动机啊；发觉；";
    [self showBg];
}

@end
