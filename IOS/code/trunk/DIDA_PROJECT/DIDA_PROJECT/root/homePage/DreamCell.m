//
//  DreamCell.m
//  DIDA_PROJECT
//
//  Created by 袁江 on 14-9-26.
//  Copyright (c) 2014年 luojilab.com. All rights reserved.
//

#import "DreamCell.h"
#import "CellHeaderForDream.h"
#import "DiDaProgressView.h"


@interface DreamCell()
CREATE_STRONG UIImageView *bgImage;
CREATE_STRONG CellHeaderForDream *dreamHeader;
CREATE_STRONG UILabel *title;
CREATE_STRONG UIView *titleBg;
CREATE_STRONG UIImageView *destinationIcon;
CREATE_STRONG UILabel  *destinationLb;
CREATE_STRONG UIImageView *dateIcon;
CREATE_STRONG UILabel *dateLb;
CREATE_STRONG UIImageView *statusView;
CREATE_STRONG UILabel *crowdfundingBegingTime;
CREATE_STRONG UILabel *crowdfundingendTime;
CREATE_STRONG DiDaProgressView *processView;
CREATE_STRONG UILabel *raisedFunds;
CREATE_STRONG UILabel *needRaisedFunds;
CREATE_STRONG UILabel *followedNumber;
CREATE_STRONG UIView *separateLine;
@end

@implementation DreamCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.bgImage = [UIImageView new];
        self.dreamHeader = [CellHeaderForDream new];
        self.title = [ViewCreatorHelper createLabelWithTitle:@"豪华游艇相亲大会"
                                                        font:[UIFont systemFontOfSize:18.]
                                                       frame:CGRectZero
                                                   textColor:[UIColor whiteColor]
                                               textAlignment:NSTextAlignmentLeft];
        self.titleBg = [[UIView alloc]init];
        self.titleBg.backgroundColor = [UIColor blackColor];
        self.titleBg.alpha = 0.3;
        self.title.shadowColor = [UIColor grayColor];
        
        
        self.destinationIcon = [UIImageView new];
        self.destinationLb = [ViewCreatorHelper createLabelWithTitle:@"环太平洋9天9夜"
                                                                font:[UIFont systemFontOfSize:15.]
                                                               frame:CGRectZero
                                                           textColor:[UIColor whiteColor]
                                                       textAlignment:NSTextAlignmentLeft];
        self.dateIcon = [UIImageView new];
        self.dateLb = [ViewCreatorHelper createLabelWithTitle:@"8-25 至 9-3"
                                                                font:[UIFont systemFontOfSize:15.]
                                                               frame:CGRectZero
                                                           textColor:[UIColor whiteColor]
                                                       textAlignment:NSTextAlignmentLeft];
        self.statusView = [UIImageView new];
        self.statusView.backgroundColor = [UIColor orangeColor];
        self.crowdfundingBegingTime = [ViewCreatorHelper createLabelWithTitle:@"6-16"
                                                                         font:[UIFont systemFontOfSize:13.]
                                                                        frame:CGRectZero
                                                                    textColor:[UIColor grayColor]
                                                                textAlignment:NSTextAlignmentLeft];
        self.crowdfundingendTime = [ViewCreatorHelper createLabelWithTitle:@"8-16"
                                                                      font:[UIFont systemFontOfSize:13.]
                                                                     frame:CGRectZero
                                                                 textColor:[UIColor grayColor]
                                                             textAlignment:NSTextAlignmentRight];
        self.processView = [DiDaProgressView  new];
        self.processView.tintColor = DIDA_ORANGE_COLOR;
        self.processView.backgroundColor = DIDA_BACKGROUND_COLOR;
//        self.processView.transform = CGAffineTransformMakeScale(1.0f,3.0f);

        self.needRaisedFunds = [ViewCreatorHelper createLabelWithTitle:@"需筹集¥65000"
                                                                  font:[UIFont systemFontOfSize:13.]
                                                                 frame:CGRectZero
                                                             textColor:DIDA_TEXT_COLOR                                                         textAlignment:NSTextAlignmentCenter];
        
        self.raisedFunds = [ViewCreatorHelper createLabelWithTitle:@""
                                                              font:[UIFont systemFontOfSize:13.]
                                                             frame:CGRectZero
                                                         textColor:DIDA_TEXT_COLOR
                                                     textAlignment:NSTextAlignmentLeft];
        
        self.followedNumber = [ViewCreatorHelper createLabelWithTitle:@"已有328人关注此问题"
                                                                 font:[UIFont boldSystemFontOfSize:16.]
                                                                frame:CGRectZero
                                                            textColor:[UIColor blackColor]
                                                        textAlignment:NSTextAlignmentLeft];
        
        self.separateLine = [[UIView alloc] init];
        self.separateLine.backgroundColor = RGBCOLOR(126, 226, 226);
        [self addSubview:self.separateLine];

        [self.contentView addSubview:self.bgImage];
        [self.contentView addSubview:self.dreamHeader];
        [self.contentView addSubview:self.titleBg];
        [self.contentView addSubview:self.title];
//        [self.contentView addSubview:self.destinationIcon];
//        [self.contentView addSubview:self.destinationLb];
//        [self.contentView addSubview:self.dateIcon];
//        [self.contentView addSubview:self.dateLb];
        [self.contentView addSubview:self.statusView];
        [self.contentView addSubview:self.crowdfundingBegingTime];
        [self.contentView addSubview:self.crowdfundingendTime];
        [self.contentView addSubview:self.processView];
        [self.contentView addSubview:self.needRaisedFunds];
        [self.contentView addSubview:self.raisedFunds];
       // [self.contentView addSubview:self.followedNumber];
        self.backgroundColor = [UIColor clearColor];
        self.contentView.backgroundColor = [UIColor whiteColor];
        //self.bgImage.backgroundColor
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated{
    [super setSelected:selected animated:animated];
}
- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated{
    [super setHighlighted:highlighted animated:animated];
    self.titleBg.backgroundColor = [UIColor blackColor];

}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.separateLine.frame = CGRectMake(0, 0, self.width, 10);

    self.bgImage.frame = CGRectMake(10, 20, self.width - 20, 200);
    self.dreamHeader.frame = CGRectMake(self.bgImage.left, self.bgImage.top, self.bgImage.width, 60);
    //self.title.frame = CGRectMake(self.bgImage.left + 5, 0, self.width - 15, 20);
    CGSize size = [self.title sizeThatFits:CGSizeMake(self.bgImage.width, 10000)];
    self.title.size = size;
    self.title.bottom = self.bgImage.bottom - 10;
    self.title.left = self.bgImage.left + 5;
    self.titleBg.frame = CGRectMake(self.bgImage.left, self.title.top - 10, self.bgImage.width, self.title.height + 20);
    
    self.destinationIcon.frame = CGRectMake(self.title.left, self.title.bottom + 20, 10, 10);
    self.destinationLb.frame = CGRectMake(self.destinationIcon.right + 5, self.destinationIcon.top, 200, 16);
    self.dateIcon.frame = CGRectMake(self.destinationIcon.left, self.destinationIcon.bottom + 10, 10, 10);
    self.dateLb.frame = CGRectMake(self.dateIcon.right + 5, self.dateIcon.top, 200, 16);
    self.statusView.frame = CGRectMake(0, 0, 60, 30);
    self.statusView.top = self.bgImage.top + 20;
    self.statusView.right = self.bgImage.right + 5;
    self.crowdfundingBegingTime.frame = CGRectMake(10, self.bgImage.bottom + 10, 100, 16);
    self.crowdfundingendTime.frame = CGRectMake(self.width - 120, self.crowdfundingBegingTime.top, 100, 16);
    self.crowdfundingendTime.right = self.bgImage.right;
    self.processView.frame = CGRectMake(self.crowdfundingBegingTime.left, self.crowdfundingBegingTime.bottom + 5, self.width - 20, 4);
    
    self.needRaisedFunds.frame = CGRectMake(0, 0, 200, 16);
    self.needRaisedFunds.centerX = self.width / 2;
    self.needRaisedFunds.centerY = self.crowdfundingBegingTime.centerY;
    self.raisedFunds.frame = CGRectMake(self.bgImage.left, self.processView.bottom + 5, self.width - 25, 16);
    //self.followedNumber.frame = CGRectMake(self.bgImage.left, self.raisedFunds.bottom + 10, 200, 16);
}


-(void)configCellWithData:(id)data position:(CellPosition)position{
    
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString:@"筹集122222元,占20%，差xxx元"];
    [attributedStr addAttribute:NSForegroundColorAttributeName
                          value:[UIColor redColor]
                          range:NSMakeRange(2, 5)];
    self.raisedFunds.text = @"筹集122222元,占20%，差xxx元";
    [self.bgImage sd_setImageWithURL:[NSURL URLWithString:@"http://f.hiphotos.baidu.com/image/pic/item/37d12f2eb9389b50d28b314e8635e5dde7116eb2.jpg"]];
//    self.raisedFunds.attributedText = attributedStr;
    [self.dreamHeader fillData:nil];
    self.processView.progress = 0.6;
}

@end
