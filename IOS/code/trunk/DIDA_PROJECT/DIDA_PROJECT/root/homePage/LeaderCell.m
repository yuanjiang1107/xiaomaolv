//
//  LeaderCell.m
//  DIDA_PROJECT
//
//  Created by 袁江 on 14/11/12.
//  Copyright (c) 2014年 luojilab.com. All rights reserved.
//

#import "LeaderCell.h"

@interface LeaderCell()

CREATE_STRONG UILabel *title;
CREATE_STRONG UILabel *content;

@end

@implementation LeaderCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.title = [[UILabel alloc] initForAutoLayout];
        self.content = [[UILabel alloc] initForAutoLayout];

        self.title.numberOfLines = 0;
        self.content.numberOfLines = 0;
        self.content.font = [UIFont systemFontOfSize:14.0f];
        self.content.textColor = DIDA_TEXT_COLOR;
        
        [self addsubviewToContentView:@[_title, _content]];
        
        
        [self.title autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:8];
        [self.title autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:cellContentLeftInset + 10];
        [self.title autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:cellContentLeftInset + 10];
        
        [self.content autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.title withOffset:10];
        [self.content autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:cellContentLeftInset + 10];
        [self.content autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:cellContentLeftInset + 10];
    
//        [self.contentView autoSetDimension:ALDimensionWidth toSize:[UIDevice screenWidth]];
//        NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self.contentView
//                                                                      attribute:NSLayoutAttributeBottom
//                                                                      relatedBy:NSLayoutRelationEqual
//                                                                         toItem:self.content
//                                                                      attribute:NSLayoutAttributeBottom
//                                                                     multiplier:1.0
//                                                                       constant:20];
        
//        constraint.priority = UILayoutPriorityRequired;
//        [self.contentView addConstraint:constraint];
    }
    return self;
}

-(void)configCellWithData:(id)data position:(CellPosition)position{
    self.title.text = @"罗振宇";
    self.content.text = @"罗振宇，自媒体视频脱口秀《罗辑思维》主讲人，互联网知识型社群试水者，资深媒体人和传播专家。1973年1月11日生，安徽芜湖人。90级华中科技大学新闻系本科，94级北京广播学院电视系硕士，04级中国传媒大学博士生。历任CCTV：《商务电视》、《经济与法》、《对话》制片人。";
    
    [self showBg];
}

-(CGFloat)heightForCellWidth:(id)data{
    [self configCellWithData:nil position:CellPositionTop];
    CGSize size = [self systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    return 200;
}




/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
