//
//  TableOfContentsView.m
//  DIDA_PROJECT
//
//  Created by 袁江 on 14/10/27.
//  Copyright (c) 2014年 luojilab.com. All rights reserved.
//

#import "ContentViewToolBar.h"



@interface ContentViewToolBar()

@property(nonatomic, strong)UIButton *foucsButton;

@property(nonatomic, strong)UIButton *forumButton;

@property(nonatomic, strong)UIButton *sharedButton;

@property(nonatomic, strong)UIButton *feedButton;

@property(nonatomic, strong)UIView *contentView;


@end

@implementation ContentViewToolBar

-(instancetype)init{
    self = [super init];
    if (self) {
        if (IOS8_OR_LATER) {
//            self.contentView = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleLight]];
            self.contentView = [UIView new];

        }else{
            self.contentView = [UIView new];
        }
        
        self.foucsButton = [ViewCreatorHelper createButtonWithTitle:@"关注"
                                                              frame:CGRectZero
                                                              image:nil
                                                            hlImage:nil
                                                           disImage:nil
                                                             target:self
                                                             action:@selector(toolButtonEvent:)];
        self.forumButton = [ViewCreatorHelper createButtonWithTitle:@"讨论"
                                                              frame:CGRectZero
                                                              image:nil
                                                            hlImage:nil
                                                           disImage:nil
                                                             target:self
                                                             action:@selector(toolButtonEvent:)];
        self.sharedButton = [ViewCreatorHelper createButtonWithTitle:@"分享"
                                                              frame:CGRectZero
                                                              image:nil
                                                            hlImage:nil
                                                           disImage:nil
                                                             target:self
                                                             action:@selector(toolButtonEvent:)];
        
        self.feedButton = [ViewCreatorHelper createButtonWithTitle:@"动态"
                                                               frame:CGRectZero
                                                               image:nil
                                                             hlImage:nil
                                                            disImage:nil
                                                              target:self
                                                              action:@selector(toolButtonEvent:)];
        self.foucsButton.tag = 0;
        self.forumButton.tag = 1;
        self.sharedButton.tag = 2;
        self.feedButton.tag = 3;

        [self.contentView addSubview:self.foucsButton];
        [self.contentView addSubview:self.forumButton];
        [self.contentView addSubview:self.sharedButton];
        [self.contentView addSubview:self.feedButton];
        self.foucsButton.backgroundColor = DIDA_ORANGE_COLOR;
        self.forumButton.backgroundColor = DIDA_ORANGE_COLOR;
        self.sharedButton.backgroundColor = DIDA_ORANGE_COLOR;
        self.feedButton.backgroundColor = DIDA_ORANGE_COLOR;

        [self addSubview:self.contentView];
        self.contentView.backgroundColor = [UIColor clearColor];
    }
    
    
    self.foucsButton.alpha = 0.0;
    self.forumButton.alpha = 0.0;
    self.sharedButton.alpha = 0.0;
    self.feedButton.alpha = 0.0;
    
    
    [UIView animateWithDuration:0.08
                          delay:0.05
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         self.feedButton.alpha = 1;
                     } completion:^(BOOL finished) {
                         
                     }];
    [UIView animateWithDuration:0.08
                          delay:0.1
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         self.sharedButton.alpha = 1;
                         
                     } completion:^(BOOL finished) {
                         
                     }];
    [UIView animateWithDuration:0.08
                          delay:0.15
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         self.forumButton.alpha = 1;
                         
                     } completion:^(BOOL finished) {
                         
                     }];
    [UIView animateWithDuration:0.08
                          delay:0.2
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         self.foucsButton.alpha = 1;
                         
                     } completion:^(BOOL finished) {
                         
                     }];

    return self;
}



-(void)toolButtonEvent:(UIButton*)button{
    if ([self.delegate respondsToSelector:@selector(contentViewToolBarDidSelectedItem:)]) {
        [self.delegate contentViewToolBarDidSelectedItem:button.tag];
    }
    
    [self fold];
}


-(void)layoutSubviews{
    [super layoutSubviews];
    self.contentView.frame = self.bounds;
    self.foucsButton.frame = CGRectMake(2, 2, self.width - 4, 40);
    self.forumButton.frame = CGRectMake(2, 60, self.width - 4, 40);
    self.sharedButton.frame = CGRectMake(2, 120, self.width - 4, 40);
    self.feedButton.frame = CGRectMake(2, 180, self.width - 4, 40);


}



-(void)fold{
    
    [UIView animateWithDuration:0.15
                          delay:0.25
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         self.feedButton.alpha = 0.0;
                         
                     } completion:^(BOOL finished) {
                         if ([self.delegate respondsToSelector:@selector(contentViewDidFold)]) {
                             [self.delegate contentViewDidFold];
                         }
                     }];
    [UIView animateWithDuration:0.15
                          delay:0.2
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         self.sharedButton.alpha = 0.0;
                         
                     } completion:^(BOOL finished) {
                         
                     }];
    [UIView animateWithDuration:0.15
                          delay:0.15
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         self.forumButton.alpha = 0.0;
                         
                     } completion:^(BOOL finished) {
                         
                     }];
    [UIView animateWithDuration:0.15
                          delay:0.1
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         self.foucsButton.alpha = 0.0;
                         
                     } completion:^(BOOL finished) {
                         
                     }];

}


@end
