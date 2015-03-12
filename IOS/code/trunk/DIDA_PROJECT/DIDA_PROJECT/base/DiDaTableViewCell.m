//
//  DiDaTableViewCell.m
//  DIDA_PROJECT
//
//  Created by 袁江 on 14-9-26.
//  Copyright (c) 2014年 luojilab.com. All rights reserved.
//

#import "DiDaTableViewCell.h"


@interface DiDaTableViewCell()


@property(nonatomic, strong) UIView *cellSeparateLine;

@end

@implementation DiDaTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.cellSeparateLine = [[UIView alloc] initWithFrame:CGRectZero];
        self.cellSeparateLine.backgroundColor = [UIColor redColor];
        self.needSeparator = NO;
        [self.contentView addSubview:self.cellSeparateLine];
    }
    return self;
}

-(void)addsubviewToContentView:(NSArray*)array{
    for (UIView *view in array) {
        [self.contentView addSubview:view];
    }
}

-(void)layoutSubviews{
    [super layoutSubviews];
    if (self.needSeparator == NO) {
        return;
    }
    BOOL addLine = YES;

    if (addLine) {
        self.cellSeparateLine.frame = CGRectMake(0, self.height - 0.5, self.contentView.width, 0.5);
    }
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)configCellWithData:(id)data position:(CellPosition)position{
    
}



-(void)showBg{
    UIImageView *bgView = [[UIImageView alloc] init];
    UIImage *image = [UIImage imageNamed:@"ios切片_02.png"];
    CGSize s = image.size;
    bgView.image = [image resizableImageWithCapInsets:UIEdgeInsetsMake(s.height/2.0f-1, s.width/2.0f-1, s.height/2.0+1, s.width/2.0+1)];;
    self.backgroundView = bgView;
    self.backgroundColor = [UIColor clearColor];
}

+(CGFloat)heightForClassCellWidth:(id)data position:(CellPosition)position{
    DiDaTableViewCell* cellReference;
    
    if ([[NSString stringWithFormat:@"%@", self] isEqualToString:[NSString stringWithFormat:@"%@", [gCellReference class]]]){
        cellReference = (DiDaTableViewCell*)gCellReference;
    }else{
        cellReference = [[self alloc] init];
        gCellReference = cellReference;
    }
    
    if (IOS6_OR_EARLIER && cellReference.contentView.translatesAutoresizingMaskIntoConstraints == YES) {
        return 44;
    }
    [cellReference configCellWithData:data position:position];
    
    CGSize size = [cellReference.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    return size.height;
}

-(void)setCellForAutoLayout:(BOOL)cellForAutoLayout{
    _cellForAutoLayout = cellForAutoLayout;
    if (cellForAutoLayout == YES) {
        self.translatesAutoresizingMaskIntoConstraints = NO;
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.contentView
                                                                     attribute:NSLayoutAttributeWidth
                                                                     relatedBy:NSLayoutRelationEqual
                                                                        toItem:nil
                                                                     attribute:NSLayoutAttributeNotAnAttribute
                                                                    multiplier:1.0
                                                                      constant:[UIDevice screenWidth]]];
        
    }
}

@end
