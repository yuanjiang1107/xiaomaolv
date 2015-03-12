//
//  filterView.m
//  DIDA_PROJECT
//
//  Created by 袁江 on 14-10-21.
//  Copyright (c) 2014年 luojilab.com. All rights reserved.
//

#import "filterView.h"


#define cell_height 40
#define section_footer_height 8

@interface FilterView()<UIAlertViewDelegate, UITableViewDataSource, UITableViewDelegate>

CREATE_COPY FilterEventBlock block;


CREATE_STRONG UIView *bgView;

CREATE_STRONG UIButton *cancelButton;

CREATE_STRONG UIButton *commiteButton;
@end

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
        maskView.alpha = 0.3;
        [self addSubview:maskView];
        self.bgView.frame = CGRectMake(0, 0, self.width - 60, 200);
        self.bgView.clipsToBounds = YES;
        self.bgView.layer.cornerRadius = 5.0;
        self.bgView.userInteractionEnabled = YES;
        
        
        UILabel *lab = [[UILabel alloc] initWithFrame:CGRectZero];
        lab.font = [UIFont systemFontOfSize:20.0];
        lab.text = @"筛选条件设置";
        [lab sizeToFit];
        [self.bgView addSubview:lab];
        lab.centerX = self.bgView.width / 2;
        lab.top = 8;

        UIView *topLine = [[UIView alloc] initWithFrame:CGRectMake(0, 40, self.bgView.width, 1)];
        topLine.backgroundColor = [UIColor lightGrayColor];
        [self.bgView addSubview:topLine];
        
        
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        tableView.frame = CGRectMake(0, topLine.bottom, self.bgView.width, 6*cell_height + 3*section_footer_height);
        tableView.delegate = self;
        tableView.dataSource = self;
        self.bgView.height = tableView.bottom + 40;
        tableView.scrollEnabled = NO;
        tableView.backgroundColor = [UIColor clearColor];
        UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, self.bgView.height - 40, self.bgView.width, 1)];
        [self.bgView addSubview:line];
        line.backgroundColor = [UIColor whiteColor];
        [self.bgView addSubview:line];
        
        UIView *vLine = [[UIView alloc] initWithFrame:CGRectMake(self.bgView.width / 2, self.bgView.height - 40, 1, 40)];
        vLine.backgroundColor = [UIColor whiteColor];
        [self.bgView addSubview:vLine];
        self.bgView.centerX = self.width / 2;
        self.bgView.centerY = self.height / 2;
        self.userInteractionEnabled = YES;
        self.bgView.userInteractionEnabled = YES;
        self.cancelButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [self.cancelButton setTitle:@"取消" forState:UIControlStateNormal];
        [self.cancelButton addTarget:self action:@selector(cancelEvent:) forControlEvents:UIControlEventTouchUpInside];
        self.commiteButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [self.commiteButton setTitle:@"确定" forState:UIControlStateNormal];
        [self.commiteButton addTarget:self action:@selector(commiteEvent:) forControlEvents:UIControlEventTouchUpInside];
        
        self.cancelButton.frame = CGRectMake(0, line.bottom, self.bgView.width / 2, 40);
        self.commiteButton.frame = CGRectOffset(self.cancelButton.frame, self.cancelButton.width, 0);
        if (IOS8_OR_LATER) {
            UIVisualEffectView *visualView = (UIVisualEffectView*)self.bgView;
            [visualView.contentView addSubview:self.cancelButton];
            [visualView.contentView addSubview:self.commiteButton];
            [visualView.contentView addSubview:tableView];
            //line.backgroundColor = [UIColor clearColor];
            
        }else{
            [self.bgView addSubview:self.commiteButton];
            [self.bgView addSubview:self.cancelButton];
            [self.bgView addSubview:tableView];

            topLine.backgroundColor = [UIColor lightGrayColor];
            line.backgroundColor    = [UIColor lightGrayColor];
            vLine.backgroundColor = [UIColor lightGrayColor];
        }
        [self addSubview:self.bgView];
    }
    return self;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
}

-(void)show{
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


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return 1;
            break;
        case 1:
            return 2;
            break;
        case 2:
            return 3;
            break;
        default:
            break;
    }
    return 0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return section_footer_height;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return cell_height;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ffff"];
    cell.textLabel.text = @"xxxxxx";
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    UISwitch *switchButton = [[UISwitch alloc] init];
    switchButton.translatesAutoresizingMaskIntoConstraints = NO;
    [cell.contentView addSubview:switchButton];
    [switchButton autoPinEdgeToSuperviewEdge:ALEdgeTrailing withInset:10];
    [switchButton autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

-(UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *view = [UIView  new];
    view.backgroundColor = [UIColor clearColor];
    return view;
}

@end
