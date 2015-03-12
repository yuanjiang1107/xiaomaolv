//
//  ChatMessageBodyCell.m
//  DIDA_PROJECT
//
//  Created by 袁江 on 14/11/25.
//  Copyright (c) 2014年 luojilab.com. All rights reserved.
//

#import "ChatMessageBodyCell.h"
#import "ChatMessage.h"
#import "AvatarView.h"

@interface ChatMessageBodyCell()

@property(nonatomic, strong)AvatarView *avatar;
@property(nonatomic, strong)UIImageView *cellBg;
@property(nonatomic, strong)UILabel *content;

@property(nonatomic, strong)NSArray *constraints;

@end

@implementation ChatMessageBodyCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.avatar = [AvatarView avatarWithFrame:CGRectMake(0, 0, 50, 50) image:nil borderColor:[UIColor blackColor]];
        self.avatar.translatesAutoresizingMaskIntoConstraints = NO;
        self.cellBg = [[UIImageView alloc] initForAutoLayout];
        self.content = [[UILabel alloc] initForAutoLayout];
        self.content.numberOfLines = 0;
        self.content.backgroundColor = [UIColor clearColor];
        [self addsubviewToContentView:@[_avatar, _cellBg, _content]];
        self.contentView.backgroundColor = [UIColor clearColor];
        self.backgroundColor = [UIColor clearColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        if (IOS7_OR_EARLIER) {
            self.contentView.translatesAutoresizingMaskIntoConstraints = NO;
        }
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.contentView
                                                                     attribute:NSLayoutAttributeWidth
                                                                     relatedBy:NSLayoutRelationEqual
                                                                        toItem:nil
                                                                     attribute:NSLayoutAttributeNotAnAttribute
                                                                    multiplier:1.0
                                                                      constant:[UIDevice screenWidth]]];
        
        
        NSDictionary *dict = NSDictionaryOfVariableBindings(_avatar, _cellBg, _content);
        
        
//        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:
//                                          [NSString stringWithFormat:@"H:|-%d-[_avatar(50)]-12-[_content]-(>=70)-|", cellContentLeftInset]
//                                                                                 options:0
//                                                                                 metrics:nil
//                                                                                   views:dict]];
        
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-5-[_avatar(50)]"
                                                                                 options:0
                                                                                 metrics:nil
                                                                                   views:dict]];
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[_content]"
                                                                                 options:0
                                                                                 metrics:nil
                                                                                   views:dict]];
        
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.cellBg
                                                                     attribute:NSLayoutAttributeLeft
                                                                     relatedBy:NSLayoutRelationEqual
                                                                        toItem:self.content
                                                                     attribute:NSLayoutAttributeLeft
                                                                    multiplier:1.0
                                                                      constant:-5]];

        
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.cellBg
                                                                    attribute:NSLayoutAttributeRight
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:self.content
                                                                    attribute:NSLayoutAttributeRight
                                                                   multiplier:1.0
                                                                      constant:5]];
        
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.cellBg
                                                                     attribute:NSLayoutAttributeBottom
                                                                     relatedBy:NSLayoutRelationEqual
                                                                        toItem:self.content
                                                                     attribute:NSLayoutAttributeBottom
                                                                    multiplier:1.0
                                                                      constant:5]];
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.cellBg
                                                                     attribute:NSLayoutAttributeTop
                                                                     relatedBy:NSLayoutRelationEqual
                                                                        toItem:self.content
                                                                     attribute:NSLayoutAttributeTop
                                                                    multiplier:1.0
                                                                      constant:-5]];
        
        

        NSLayoutConstraint *constraint1 = [NSLayoutConstraint constraintWithItem:self.contentView
                                                                      attribute:NSLayoutAttributeBottom
                                                                      relatedBy:NSLayoutRelationGreaterThanOrEqual
                                                                         toItem:self.avatar
                                                                      attribute:NSLayoutAttributeBottom
                                                                     multiplier:1.0
                                                                       constant:10];
        
        NSLayoutConstraint *constraint2 = [NSLayoutConstraint constraintWithItem:self.contentView
                                                                       attribute:NSLayoutAttributeBottom
                                                                       relatedBy:NSLayoutRelationGreaterThanOrEqual
                                                                          toItem:self.cellBg
                                                                       attribute:NSLayoutAttributeBottom
                                                                      multiplier:1.0
                                                                        constant:10];
        
        [self.contentView addConstraint:constraint1];
        [self.contentView addConstraint:constraint2];
        self.needSeparator = NO;
        
    }
    return self;
}


-(void)configCellWithData:(id)data position:(CellPosition)position{
    if (self.constraints.count > 0)
    [self.contentView removeConstraints:self.constraints];
    ChatMessage *message = (ChatMessage*)data;
    
    
    if (message.from.integerValue == CURRENT_USER_ID) {
        NSDictionary *dict = NSDictionaryOfVariableBindings(_avatar, _cellBg, _content);
        self.constraints = [NSLayoutConstraint constraintsWithVisualFormat:
                            [NSString stringWithFormat:@"H:|-(>=70)-[_content]-12-[_avatar(50)]-%d-|", cellContentLeftInset]
                                                                   options:0
                                                                   metrics:nil
                                                                     views:dict];
        [self.contentView addConstraints:self.constraints];
        self.content.textAlignment = NSTextAlignmentRight;
        [self.avatar sd_setImageWithURL:[NSURL URLWithString:@"http://99touxiang.com/public/upload/nvsheng/237/2_111109140942_41.jpg"]];
         
    }else{
        
        NSDictionary *dict = NSDictionaryOfVariableBindings(_avatar, _cellBg, _content);
        self.constraints = [NSLayoutConstraint constraintsWithVisualFormat:
                            [NSString stringWithFormat:@"H:|-%d-[_avatar(50)]-12-[_content]-(>=70)-|", cellContentLeftInset]
                                                                   options:0
                                                                   metrics:nil
                                                                     views:dict];
        [self.contentView addConstraints:self.constraints];
        self.content.textAlignment = NSTextAlignmentLeft;
        [self.avatar sd_setImageWithURL:[NSURL URLWithString:@"http://news.yzz.cn/public/images/110213/68_193730_28e63.jpg"]];

    }
    
    self.cellBg.backgroundColor = [UIColor greenColor];
    self.content.text = message.content;
}

@end
