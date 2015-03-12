//
//  SystemMessageCell.m
//  DIDA_PROJECT
//
//  Created by 袁江 on 14-10-11.
//  Copyright (c) 2014年 luojilab.com. All rights reserved.
//

#import "SystemMessageCell.h"
#import "Dashed.h"

@interface SystemMessageCell()

@property(nonatomic, strong)UILabel *dateLb;

@property(nonatomic, strong)Dashed *dashed;

@property(nonatomic, strong)UILabel *content;
@end

@implementation SystemMessageCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.dateLb = [[UILabel alloc] initForAutoLayout];
        self.dashed = [[Dashed alloc] initForAutoLayout];
        self.content = [[UILabel alloc] initForAutoLayout];
        self.content.numberOfLines = 0;
        self.contentView.translatesAutoresizingMaskIntoConstraints = NO;
        [self addsubviewToContentView:@[_dateLb, _dashed, _content]];
        
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.contentView
                                                                     attribute:NSLayoutAttributeWidth
                                                                     relatedBy:NSLayoutRelationEqual
                                                                        toItem:nil
                                                                     attribute:NSLayoutAttributeNotAnAttribute
                                                                    multiplier:1.0
                                                                      constant:[UIDevice screenWidth]]];
        
        
        NSDictionary *dict = NSDictionaryOfVariableBindings(_dashed, _content, _dateLb);
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:
                                          [NSString stringWithFormat:@"H:|-%d-[_dateLb]-%d-|", cellContentLeftInset + 10, cellContentLeftInset + 10]
                                                                                 options:0
                                                                                 metrics:nil
                                                                                   views:dict]];
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:
                                          [NSString stringWithFormat:@"H:|-%d-[_dashed]-%d-|", cellContentLeftInset, cellContentLeftInset]
                                                                                 options:0
                                                                                 metrics:nil
                                                                                   views:dict]];
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:
                                          [NSString stringWithFormat:@"H:|-%d-[_content]-%d-|", cellContentLeftInset + 10, cellContentLeftInset + 10]
                                                                                 options:0
                                                                                 metrics:nil
                                                                                   views:dict]];
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-10-[_dateLb]-10-[_dashed(2)]-10-[_content]-10-|"
                                                                                 options:0
                                                                                 metrics:nil
                                                                                   views:dict]];




        
    }
    return self;
}

-(void)configCellWithData:(id)data position:(CellPosition)position{
    self.dateLb.text = @"xxxxx";
    self.content.text = @"jfalfjaf;\nfjla\n";
    [self showBg];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
