//
//  UserDRFListController.m
//  DIDA_PROJECT
//
//  Created by 袁江 on 14/11/24.
//  Copyright (c) 2014年 luojilab.com. All rights reserved.
//

#import "UserDRFListController.h"
#import "DiDaSegmentControl.h"
#import "DreamCell.h"
#import "OwnerFeedCell.h"



@interface UserDRFListController()

CREATE_STRONG UIImageView *avatar;
CREATE_STRONG UILabel *nameLb;
CREATE_STRONG UILabel *desLb;
CREATE_STRONG UIImageView *genderIcon;

CREATE_STRONG DiDaSegmentControl *control;

CREATE_ASSIGN NSInteger currentPage;

@end



@implementation UserDRFListController

-(instancetype)initWithIndex:(NSInteger)index{
    self = [super init];
    if (self) {
        _currentPage = index;
    }
    return self;
}

-(void)viewDidLoad{
    [super viewDidLoad];
    self.title = @"会员资料";
    UIView *view = [[UIView alloc] init];
    self.avatar = [[UIImageView alloc] initForAutoLayout];
    self.nameLb = [[UILabel alloc] initForAutoLayout];
    self.desLb = [[UILabel alloc] initForAutoLayout];
    self.genderIcon = [[UIImageView alloc] initForAutoLayout];
    
    self.avatar.layer.borderWidth = 1;
    self.avatar.layer.borderColor = [UIColor blackColor].CGColor;
    self.avatar.layer.cornerRadius = 25.0f;
    
    [view addSubview:self.avatar];
    [view addSubview:self.nameLb];
    [view addSubview:self.desLb];
    [view addSubview:self.genderIcon];
   
    NSDictionary *dict = NSDictionaryOfVariableBindings(_avatar, _nameLb, _desLb, _genderIcon);
    [view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-100-[_avatar(50)]-5-[_nameLb]-5-[_genderIcon(10)]"
                                                                options:0
                                                                metrics:nil
                                                                   views:dict]];
    [view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[_avatar(50)]"
                                                                 options:0
                                                                 metrics:nil
                                                                   views:dict]];
    [view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-28-[_genderIcon(10)]"
                                                                 options:0
                                                                 metrics:nil
                                                                   views:dict]];
    [view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-23-[_nameLb]-3-[_desLb]"
                                                                 options:0
                                                                 metrics:nil
                                                                   views:dict]];
    
    [view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[_avatar]-5-[_desLb]"
                                                                 options:0
                                                                 metrics:nil
                                                                   views:dict]];

    view.frame = CGRectMake(0, 0, [UIDevice screenWidth], 140);
    
    self.control = [[DiDaSegmentControl alloc] initWithTitle:@[@"主人的梦想", @"主人的动态"]
                                                currentIndex:-1
                                               eventCallBack:^(BOOL selected, NSInteger selectedIndex) {
                                                   self.currentPage = selectedIndex;
                                               }];
    [self.control setSelectedIndex:self.currentPage];
    self.control.frame = CGRectMake(10, 0, [UIDevice screenWidth] - 20, 40);
    self.control.bottom = view.height - 10;
    [view addSubview:self.control];
    self.tableView.tableHeaderView = view;
    
    self.nameLb.text = @"宋佳佳";
    self.desLb.text = @"0xxx, 0yyyy";
    self.genderIcon.backgroundColor = [UIColor blackColor];
}

-(void)setCurrentPage:(NSInteger)currentPage{
    if (_currentPage != currentPage) {
        _currentPage = currentPage;
        [self.tableView reloadData];
    }
}

-(void)firstWillApear{
    [super firstWillApear];
    [self.tableView addInfiniteScrollingWithActionHandler:^{
        
    }];
}

-(UITableViewStyle)DiDaTableViewStyle{
    return UITableViewStylePlain;
}

-(UITableViewCellSeparatorStyle)DiDaTableViewSeparatorStyle{
    return UITableViewCellSeparatorStyleNone;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.currentPage == 1) {
        return [super tableView:tableView heightForRowAtIndexPath:indexPath];
    }
    return 300.0f;
}

-(CellPosition)positionForCellAtIndex:(NSIndexPath *)indexPath{
    CellPosition position;
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            position = CellPositionTop;
        }else if(indexPath.row == 4){
            position = CellPositionBottom;
        }else{
            position = CellPositionMid;
        }
    }
    return position;
}


-(Class)cellClassForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.currentPage == 0) {
        return [DreamCell class];
    }else if(self.currentPage == 1){
        return [OwnerFeedCell class];
    }else{
        return [DiDaTableViewCell class];
    }
}


@end
