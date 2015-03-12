//
//  DreamAbstractCell.m
//  DIDA_PROJECT
//
//  Created by 袁江 on 14/11/17.
//  Copyright (c) 2014年 luojilab.com. All rights reserved.
//

#import "DreamAbstractCell.h"
#import "CellHeaderForDream.h"


@interface DreamAbstractCell()

CREATE_STRONG CellHeaderForDream  *header;
CREATE_STRONG UILabel *title;
CREATE_STRONG UILabel *content;

@end


@implementation DreamAbstractCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.header = [[CellHeaderForDream alloc] initForAutoLayout];
        self.title = [[UILabel alloc] initForAutoLayout];
        self.content = [[UILabel alloc] initForAutoLayout];
        self.content.numberOfLines = 0;
        self.contentView.translatesAutoresizingMaskIntoConstraints = NO;
        [self addsubviewToContentView:@[_header, _title, _content]];
        self.header.backgroundColor = [UIColor lightGrayColor];
        self.title.textColor = DIDA_ORANGE_COLOR;
        NSDictionary *dict = NSDictionaryOfVariableBindings(_header, _title, _content);
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.contentView
                                                                     attribute:NSLayoutAttributeWidth
                                                                     relatedBy:NSLayoutRelationEqual
                                                                        toItem:nil
                                                                     attribute:NSLayoutAttributeNotAnAttribute
                                                                    multiplier:1.0
                                                                      constant:[UIDevice screenWidth]]];

        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:[NSString stringWithFormat:
                                                                                     @"H:|-%d-[_header]-%d-|", cellContentLeftInset,cellContentLeftInset]
                                                                           options:0
                                                                           metrics:nil
                                                                             views:dict]];
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:[NSString stringWithFormat:
                                                                                     @"H:|-%d-[_title]-%d-|", cellContentLeftInset + 10,cellContentLeftInset + 10]
                                                                            options:0
                                                                            metrics:nil
                                                                              views:dict]];
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:[NSString stringWithFormat:
                                                                                     @"H:|-%d-[_content]-%d-|", cellContentLeftInset + 10,cellContentLeftInset + 10]
                                                                            options:0
                                                                            metrics:nil
                                                                              views:dict]];
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[_header(60)]-10-[_title]-10-[_content]"
                                                                            options:0
                                                                            metrics:nil
                                                                              views:dict]];
        
        NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self.contentView
                                                                      attribute:NSLayoutAttributeBottom
                                                                      relatedBy:NSLayoutRelationGreaterThanOrEqual
                                                                         toItem:self.content
                                                                      attribute:NSLayoutAttributeBottom
                                                                     multiplier:1.0
                                                                       constant:20];
        
        [self.contentView addConstraint:constraint];

    }
    return self;
}

-(CGFloat)heightForCellWidth:(id)data{
    [self configCellWithData:nil position:CellPositionTop];
    CGSize size = [self.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    return size.height;
}

-(void)configCellWithData:(id)data position:(CellPosition)position{
    [self showBg];
    self.title.text = @"梦想摘要";
    self.content.text = @"dj到家啦减肥啦绝对拉风家啊；激发啦减肥啦减肥啦的沙发设计；发动；发觉减肥的；啊减肥的；案发时减肥撒；将发售；激发；激发；啊减肥的出那些擦饿哦呸；af分啊看风景打jlljdfla";
}

@end
