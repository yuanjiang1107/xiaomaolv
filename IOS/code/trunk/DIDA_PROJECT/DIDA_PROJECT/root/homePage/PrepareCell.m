//
//  PrepareCell.m
//  dida
//
//  Created by he chao on 8/5/14.
//  Copyright (c) 2014 he chao. All rights reserved.
//

#import "PrepareCell.h"

@implementation PrepareCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state268
}

- (void)initSelf{
    imgBg = [[UIImageView alloc] init];
    imgBg.contentMode = UIViewContentModeScaleToFill;
    imgBg.frame = CGRectMake(0, 0, 320, 248);
    //imgBg.image = [IMAGESTRING(@"cell_white_bg") stretchableImageWithLeftCapWidth:0 topCapHeight:20];
    [self addSubview:imgBg];
    
    imgCover = [UIImageView new];
    imgCover.contentMode = UIViewContentModeScaleToFill;
    imgCover.frame = CGRectMake(0, 0, 320, 195);
    [self addSubview:imgCover];
    
//    UIImageView *shadow = [BeeUIImageView spawn];
//    shadow.frame = CGRectMake(0, 0, imgBg.width, 135);
//    shadow.image = IMAGESTRING(@"shadow");
//    [self addSubview:shadow];
    

    title = [ViewCreatorHelper createLabelWithTitle:@"都放假啊啦减肥啦"
                                               font:[UIFont systemFontOfSize:18]
                                              frame:CGRectZero
                                          textColor:[UIColor whiteColor]
                                      textAlignment:NSTextAlignmentLeft ];
    title.frame = CGRectMake(15, 10, 300, 45);
    [self addSubview:title];
    
    description = [ViewCreatorHelper createLabelWithTitle:@"description"
                                                 font:[UIFont systemFontOfSize:18]
                                                frame:CGRectZero
                                            textColor:[UIColor whiteColor]
                                        textAlignment:NSTextAlignmentLeft ];
    description.frame = CGRectMake(title.left, title.bottom, title.width, 80);
    [self addSubview:description];
    
//    imgMark = [BeeUIImageView spawn];
//    imgMark.frame = CGRectMake(title.left, 150, 49, 20);
//    imgMark.image = IMAGESTRING(@"prepare_mark");
//    [self addSubview:imgMark];
    
//    price = [BaseLabel initLabel:@"￥50000" font:FONT(18) color:kGreenColor textAlignment:NSTextAlignmentLeft];
//    price.frame = CGRectMake(title.left, imgMark.bottom, 200, 20);
//    [self addSubview:price];
    
    avatar = [AvatarView avatarWithFrame:CGRectMake(265, 150-18, 38, 38) image:nil borderColor:[UIColor whiteColor]];
    avatar.backgroundColor = [UIColor yellowColor];
    [self addSubview:avatar];
    
    name  = [ViewCreatorHelper createLabelWithTitle:@"name"
                                                       font:[UIFont systemFontOfSize:18]
                                                      frame:CGRectZero
                                                  textColor:[UIColor whiteColor]
                                              textAlignment:NSTextAlignmentLeft ];
    name.frame = CGRectMake(100, avatar.bottom, avatar.right-100, 20);
    [self addSubview:name];
    
//    progressBg = [BeeUIImageView spawn];
//    progressBg.frame = CGRectMake(15, 202, 290, 4);
//    progressBg.image = IMAGESTRING(@"progress_bg");
//    [self addSubview:progressBg];
    
//    progress = [BeeUIImageView spawn];
//    progress.frame = CGRectMake(progressBg.left, progressBg.top, 20, progressBg.height);
//    progress.contentMode = UIViewContentModeScaleToFill;
//    progress.image = [IMAGESTRING(@"progress") stretchableImageWithLeftCapWidth:3 topCapHeight:0];
//    [self addSubview:progress];
    
//    for (int i = 0; i < 3; i++) {
//        value[i] = [BaseLabel initLabel:i==0?@"￥5555":(i==1?@"￥9527":@"16天") font:FONT(14) color:price.textColor textAlignment:i==0?NSTextAlignmentLeft:(i==1?NSTextAlignmentCenter:NSTextAlignmentRight)];
//        value[i].frame = CGRectMake(15, progressBg.bottom+5, 290, 20);
//        [self addSubview:value[i]];
//        
//        BaseLabel *title2 = [BaseLabel initLabel:i==0?@"已筹金额":(i==1?@"还差金额":@"剩余时间") font:FONT(12) color:RGB(189,189,189) textAlignment:i==0?NSTextAlignmentLeft:(i==1?NSTextAlignmentCenter:NSTextAlignmentRight)];
//        title2.frame = CGRectMake(15, value[i].bottom-4, 290, 18);
//        [self addSubview:title2];
//    }
}

- (void)load{
    float getMoney = [self.dictDream[@"get_money"] floatValue];
    float countMoney = [self.dictDream[@"sum_money"] floatValue];
    float percents = getMoney/countMoney;
    int index = percents*100;
    if (index<=2) {
        index = 2;
    }
    progress.frame = CGRectMake(progress.left, progress.top, progressBg.width*index/100.0, progress.height);
//    progress.image = [IMAGESTRING(@"progress") stretchableImageWithLeftCapWidth:3 topCapHeight:0];
//    
//    title.text = self.dictDream[@"title"];
//    imgCover.url = self.dictDream[@"cover_image"];
//    
//    NSString *strDescription = [NSString stringWithFormat:@"%@\n%@-%@\n%@关注",self.dictDream[@"destination"],self.dictDream[@"dept_time"],self.dictDream[@"back_time"],self.dictDream[@"follow"]];
//    description.text = strDescription;
    
    //price.text = [NSString stringWithFormat:@"￥%@",self.dictDream[@"sum_money"]];
    value[0].text = [NSString stringWithFormat:@"￥%@",self.dictDream[@"get_money"]];
    value[1].text = [NSString stringWithFormat:@"￥%@",self.dictDream[@"nedd_money"]];
    value[2].text = [NSString stringWithFormat:@"%@",self.dictDream[@"time_left"]];
    
    NSMutableDictionary *dictUser = self.dictDream[@"user"];
//    avatar.url = dictUser[@"avatar"][@"s90"];
//    name.text = dictUser[@"nickname"];
}

@end
