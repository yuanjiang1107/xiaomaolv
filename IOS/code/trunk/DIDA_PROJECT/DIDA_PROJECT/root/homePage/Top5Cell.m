//
//  Top5Cell.m
//  DIDA_PROJECT
//
//  Created by 袁江 on 14/11/12.
//  Copyright (c) 2014年 luojilab.com. All rights reserved.
//

#import "Top5Cell.h"
#import "CellHeaderForDream.h"
#import "DiDaProgressView.h"

#define cellBaseHeight 135

@interface Top5Cell()

CREATE_STRONG CellHeaderForDream *cellHeader;
CREATE_STRONG UILabel *title;
CREATE_STRONG UILabel *content;
CREATE_STRONG DiDaProgressView *progress;
CREATE_STRONG UILabel *crowdfundingDetail;
@end

@implementation Top5Cell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.cellHeader = [[CellHeaderForDream alloc] init];
        self.title = [ViewCreatorHelper createLabelWithTitle:nil
                                                        font:[UIFont systemFontOfSize:16.0]
                                                       frame:CGRectZero
                                                   textColor:DIDA_TEXT_COLOR
                                               textAlignment:NSTextAlignmentLeft];
        self.content = [ViewCreatorHelper createLabelWithTitle:nil
                                                          font:[UIFont systemFontOfSize:14.0f]
                                                         frame:CGRectZero
                                                     textColor:DIDA_TEXT_COLOR
                                                 textAlignment:NSTextAlignmentLeft];
        self.progress = [[DiDaProgressView alloc] init];
        self.crowdfundingDetail = [[UILabel alloc] init];
        self.crowdfundingDetail.font = [UIFont systemFontOfSize:16.0f];
        self.title.numberOfLines = 0;
        self.content.numberOfLines = 0;
        
        [self.contentView addSubview:self.cellHeader];
        [self.contentView addSubview:self.title];
        [self.contentView addSubview:self.content];
        [self.contentView addSubview:self.progress];
        [self.contentView addSubview:self.crowdfundingDetail];
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    CGFloat width = self.width - 2 * (cellContentLeftInset + 10);
    self.cellHeader.frame   = CGRectMake(cellContentLeftInset, 0, width , 60);
    
    CGSize size = [self.title sizeThatFits:CGSizeMake(width, 1000)];
    self.title.frame = CGRectMake(0, _cellHeader.bottom + 10, width, size.height);
    self.title.centerX = self.width / 2;
    size = [self.content sizeThatFits:CGSizeMake(width, 1000)];
    self.content.frame = CGRectMake(0, 0, width , size.height);
    self.content.left = self.title.left;
    self.content.top = self.title.bottom + 10;
    self.progress.frame = CGRectMake(self.title.left, self.content.bottom + 10, width, 4);
    self.crowdfundingDetail.frame = CGRectMake(self.title.left, self.progress.bottom + 10, width, 20);
    
}

-(void)configCellWithData:(id)data position:(CellPosition)position{
    [self.cellHeader fillData:nil];
    self.title.text = @"xxxxxfl\najflaa";
    self.content.text = @"djafljflaflajflajlfabcank\ndja\nfjal\n\n\ncnakfhafdfa;afa;fd\ndfjaljfdlafd\nfjdaj\nn\njfjf\n";
    self.crowdfundingDetail.text = @"已筹集¥25000，占20%，还差¥36000";
    self.progress.progress = 0.5;
    self.progress.tintColor = RGBCOLOR(253, 104, 153);
    [self showBg];
}


-(CGFloat)heightForCellWidth:(id)data{
    CGFloat width = [UIDevice screenWidth] - 2 * cellContentLeftInset;
    [self configCellWithData:nil position:CellPositionBottom];
    CGFloat height = [self.title sizeThatFits:CGSizeMake(width, 1000)].height + [self.content sizeThatFits:CGSizeMake(width, 1000)].height + cellBaseHeight;
    return height;

}

@end
