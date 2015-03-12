//
//  filterView.m
//  DIDA_PROJECT
//
//  Created by 袁江 on 14-10-21.
//  Copyright (c) 2014年 luojilab.com. All rights reserved.
//

#import "filterView.h"
#import "FilterContentViewController.h"

#define cell_height 40
#define section_footer_height 8

@interface FilterView()<UIAlertViewDelegate, FilterContentViewControllerDelegate>

CREATE_COPY FilterEventBlock block;


CREATE_STRONG UIView *bgView;

CREATE_STRONG UIButton *cancelButton;

CREATE_STRONG UIButton *commiteButton;

CREATE_STRONG FilterContentViewController *contentController;

@end


const FilterView *filterView;

@implementation FilterView


-(instancetype)initWithBlock:(FilterEventBlock)block{
    self = [super init];
    if (self) {
        self.block = block;
        self.frame = [UIScreen mainScreen].bounds;
        if (IOS8_OR_LATER) {
            self.bgView = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleExtraLight]];
        }else{
            self.bgView = [[UIView alloc] init];
            self.bgView.backgroundColor = [UIColor whiteColor];
        }
        UIView *maskView = [[UIView alloc] initWithFrame:self.bounds];
        maskView.backgroundColor = [UIColor blackColor];
        maskView.alpha = 0.5;
        [self addSubview:maskView];
        self.bgView.frame = CGRectMake(10, 64  + 10, self.width - 20, 348);
        self.bgView.clipsToBounds = YES;
        self.bgView.layer.cornerRadius = 5.0;
        self.bgView.userInteractionEnabled = YES;
        
        
        

        UIStoryboard *storyBoart = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        UIViewController *vc = [storyBoart instantiateViewControllerWithIdentifier:@"filterId"];
        self.contentController = (FilterContentViewController*)vc;
        vc.view.frame = self.bgView.frame;
        self.contentController.dalegate = self;
        
        [self addSubview:vc.view];
    }
    return self;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
}

-(void)show{
    filterView  = self;
    [[UIApplication sharedApplication].keyWindow addSubview:self];
}

-(void)cancelEvent:(id)sender{
    [self remove];
}

-(void)commiteEvent:(id)sender{
    [self remove];
    self.block(nil);
}

-(void)remove{
    if (self.superview) {
        [self removeFromSuperview];
    }
}

-(void)didCommitInfo:(BOOL)isCommit info:(NSDictionary *)info{
    if (isCommit) {
        [self commiteEvent:nil];
    }else{
        [self cancelEvent:nil];
    }
}



@end
