    //
//  CellHeaderForDream.m
//  DIDA_PROJECT
//
//  Created by 袁江 on 14-9-26.
//  Copyright (c) 2014年 luojilab.com. All rights reserved.
//

#import "CellHeaderForDream.h"
#import "AvatarView.h"

@interface CellHeaderForDream()

CREATE_STRONG UIImageView *avatar;

CREATE_STRONG UILabel *nameLb;

CREATE_STRONG UILabel *detailLb;

@end

@implementation CellHeaderForDream
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.avatar = [AvatarView avatarWithFrame:CGRectMake(0, 0, 50, 50) image:nil borderColor:[UIColor whiteColor]];
        self.nameLb = [ViewCreatorHelper createLabelWithTitle:@"Name "
                                                         font:[UIFont systemFontOfSize:20.0]
                                                        frame:CGRectMake(0, 0, 200, 20)
                                                    textColor:RGBCOLOR(255, 51, 102)
                                                textAlignment:NSTextAlignmentLeft];
        self.detailLb = [ViewCreatorHelper createLabelWithTitle:@"29岁，172/48"
                                                           font:[UIFont systemFontOfSize:14]
                                                          frame:CGRectMake(0, 0, 200, 16)
                                                      textColor:[UIColor orangeColor]
                                                  textAlignment:NSTextAlignmentLeft];
        //self.alpha = 0.8;
        [self addSubview:self.avatar];
        [self addSubview:self.nameLb];
//        [self addSubview:self.detailLb];
        //self.backgroundColor = [UIColor lightGrayColor];
    }
    return self;
}

-(instancetype)init{
    return [self initWithFrame:CGRectZero];
}


-(void)layoutSubviews{
    [super layoutSubviews];
    
    self.avatar.left = 10;
    self.avatar.centerY = self.height / 2;
    self.nameLb.top = self.avatar.top + 2;
    self.nameLb.left = self.avatar.right + 8;
    self.nameLb.centerY = self.avatar.centerY;
    self.detailLb.left = self.nameLb.left;
    self.detailLb.bottom = self.avatar.bottom - 2;
}

-(void)fillData:(NSDictionary*)info{
    [self.avatar sd_setImageWithURL:[NSURL URLWithString:@"http://99touxiang.com/public/upload/nvsheng/237/2_111109140942_41.jpg"]];
    NSString *path = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSLocalDomainMask, NO);
}

@end
