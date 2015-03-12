//
//  HeaderForMineCell.m
//  dida
//
//  Created by 袁江 on 14-9-23.
//  Copyright (c) 2014年 he chao. All rights reserved.
//

#import "HeaderForMineCell.h"
#import "AvatarView.h"

@interface HeaderForMineCell()

@property(nonatomic, strong) UIImageView *avatar;

@property(nonatomic, strong) UILabel *userNameLb;

@property(nonatomic, strong) UILabel *desLb;

@property(nonatomic, strong) UIImageView *genderIcon;

@end

@implementation HeaderForMineCell



-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.avatar = [AvatarView avatarWithFrame:CGRectMake(0, 0, 50, 50) image:nil borderColor:[UIColor blackColor]];
        self.avatar.translatesAutoresizingMaskIntoConstraints = NO;
        self.userNameLb = [[UILabel alloc] initForAutoLayout];
        self.desLb = [[UILabel alloc]initForAutoLayout];
        self.genderIcon = [[UIImageView alloc] initForAutoLayout];
        self.desLb.font = [UIFont systemFontOfSize:12.0f];
        self.contentView.translatesAutoresizingMaskIntoConstraints = NO;

        [self.contentView addSubview:self.avatar];
        [self.contentView addSubview:self.userNameLb];
        [self.contentView addSubview:self.desLb];
        [self.contentView addSubview:self.genderIcon];
        
        
        
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.contentView
                                                                     attribute:NSLayoutAttributeWidth
                                                                     relatedBy:NSLayoutRelationEqual
                                                                        toItem:nil
                                                                     attribute:NSLayoutAttributeNotAnAttribute
                                                                    multiplier:1.0
                                                                      constant:[UIDevice screenWidth]]];

        
        NSDictionary *dict = NSDictionaryOfVariableBindings(_avatar, _userNameLb, _desLb, _genderIcon);
        
        CGFloat offset;
        if (IOS8_OR_LATER) {
            offset = 15;
        }else{
            offset = 30;
        }
        NSString *conStr = [NSString stringWithFormat:@"H:|-%f-[_avatar(50)]-8-[_userNameLb]-5-[_genderIcon(10)]", offset];
        
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:conStr
                                                                     options:0
                                                                     metrics:nil
                                                                       views:dict]];
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[_avatar(50)]-10-|"
                                                                     options:0
                                                                     metrics:nil
                                                                       views:dict]];
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-30-[_genderIcon(10)]"
                                                                     options:0
                                                                     metrics:nil
                                                                       views:dict]];
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-25-[_userNameLb]-3-[_desLb]"
                                                                     options:0
                                                                     metrics:nil
                                                                       views:dict]];
        
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[_avatar]-8-[_desLb]"
                                                                     options:0
                                                                     metrics:nil
                                                                       views:dict]];

    }
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arrow.png"]];
    
    self.accessoryView = imageView;
//    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backgroundColor = RGBCOLOR(236, 236, 236);
    return self;
}
-(void)layoutSubviews{
    [super layoutSubviews];
}

-(void)configCellWithData:(id)data position:(CellPosition)position{
    self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

    self.avatar.backgroundColor = [UIColor redColor];
    self.userNameLb.text = @"dkdkdkdkd";
    self.desLb.text = @"0个梦想 0篇游记";
    self.genderIcon.backgroundColor = [UIColor greenColor];
    [self.avatar sd_setImageWithURL:[NSURL URLWithString:@"http://99touxiang.com/public/upload/nvsheng/237/2_111109140942_41.jpg"]];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    self.avatar.backgroundColor = [UIColor redColor];
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated{
    [super setHighlighted:highlighted animated:animated];
    self.avatar.backgroundColor = [UIColor redColor];
}

@end
