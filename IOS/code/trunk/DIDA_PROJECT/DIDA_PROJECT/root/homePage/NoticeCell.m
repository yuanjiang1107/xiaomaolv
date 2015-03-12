//
//  NoticeCell.m
//  DIDA_PROJECT
//
//  Created by 袁江 on 14/11/12.
//  Copyright (c) 2014年 luojilab.com. All rights reserved.
//

#import "NoticeCell.h"

@interface NoticeCell()
CREATE_STRONG UILabel *content;
CREATE_STRONG UIButton *morebutton;
@end



@implementation NoticeCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.content = [[UILabel alloc] init];
        _content.font = [UIFont systemFontOfSize:14.0f];
        _content.textColor = DIDA_TEXT_COLOR;
        _content.numberOfLines = 0;
        self.morebutton = [ViewCreatorHelper createButtonWithTitle:@"阅读全文"
                                                             frame:CGRectZero
                                                             image:nil
                                                           hlImage:nil
                                                          disImage:nil
                                                            target:nil
                                                            action:nil];
        self.morebutton.backgroundColor = DIDA_ORANGE_COLOR;
        
        [self.contentView addSubview:_content];
        [self.contentView addSubview:_morebutton];
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.content.frame = CGRectMake(0,
                                    0,
                                    [UIDevice screenWidth] - (cellContentLeftInset + 10) * 2,
                                    [self contentHeightWidthText:_content.text]);
    self.content.centerX = self.width / 2;
    self.content.top = 10;
    self.morebutton.frame = CGRectMake(0, 0, self.width - 40 * 2, 40);
    self.morebutton.top = self.content.bottom + 10;
    self.morebutton.centerX = self.content.centerX;
}

-(CGFloat)contentHeightWidthText:(NSString*)text{
   CGSize size = [self.content sizeThatFits:CGSizeMake([UIDevice screenWidth] - (cellContentLeftInset + 10) * 2, CGFLOAT_MAX)];
    return size.height;
}


-(void)configCellWithData:(id)data position:(CellPosition)position{
    self.content.text = @"绝对拉风家；阿姐；记得；发觉；发觉；就发呆；就放大；减肥啦减肥的；阿警方的发动机阿凡达了空间啊来解决1大啊；发觉；发觉；酒店房间啊；福大；发觉；发觉大家放大镜地方撒；发觉大发觉短发；减肥大大激发发觉啊；发放；啊";
    [self showBg];
}

+(CGFloat)heightForClassCellWidth:(id)data position:(CellPosition)position{
    return 200;
}

@end
