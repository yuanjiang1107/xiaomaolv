//
//  UserDetailViewController.m
//  dida
//
//  Created by 袁江 on 14-9-24.
//  Copyright (c) 2014年 he chao. All rights reserved.
//

#import "UserDetailViewController.h"
#import "UserInfoHeaderView.h"
#import "UserDRFListController.h"
#import "UIImageView+WebCache.h"
#import "UIButton+WebCache.h"
#import "DiDaImagesViewController.h"


@interface UserDetailViewController ()

@property(nonatomic, strong) UIButton *shieldButton;
@property(nonatomic, strong) UIButton *accusationButton;
@property(nonatomic, strong) UIButton *addOrCancelFriendButton;

@end

@implementation UserDetailViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    self.title = @"个人主页";
    [self createContent];

}



-(void)createContent{
    
    UserInfoHeaderView *header = [[UserInfoHeaderView alloc] init];
    self.tableView.tableHeaderView = header;
    
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIDevice screenWidth], 60)];
    view.backgroundColor = [UIColor greenColor];
    
    self.shieldButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.shieldButton setTitle:@"屏蔽" forState:UIControlStateNormal];
    self.accusationButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.accusationButton setTitle:@"举报" forState:UIControlStateNormal];
    self.addOrCancelFriendButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.addOrCancelFriendButton setTitle:@"加为好友" forState:UIControlStateNormal];
    [self.shieldButton setTitleColor:DIDA_ORANGE_COLOR forState:UIControlStateNormal];
    [self.accusationButton setTitleColor:DIDA_ORANGE_COLOR forState:UIControlStateNormal];
    [self.addOrCancelFriendButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    
    self.shieldButton.backgroundColor = DIDA_NAVIGATIONBAR_COLOR;
    self.accusationButton.backgroundColor = DIDA_NAVIGATIONBAR_COLOR;
    self.addOrCancelFriendButton.backgroundColor = DIDA_ORANGE_COLOR;
    
    CGFloat width = ([UIDevice screenWidth] - 40) / 4;
    CGRect rect = CGRectMake(10, 10, width, 40);
    self.shieldButton.frame = rect;
    self.accusationButton.frame = CGRectOffset(rect, width + 10, 0);
    self.addOrCancelFriendButton.frame = CGRectMake(0, 10, width * 2, 40);
    self.addOrCancelFriendButton.right = [UIDevice screenWidth] - 10;
    
    self.addOrCancelFriendButton.layer.shadowOffset = CGSizeMake(0, 3);
    self.addOrCancelFriendButton.layer.shadowColor = [UIColor grayColor].CGColor;
    self.addOrCancelFriendButton.layer.shadowOpacity = 1;
    self.shieldButton.layer.shadowOffset = CGSizeMake(0, 3);
    self.shieldButton.layer.shadowColor = [UIColor grayColor].CGColor;
    self.shieldButton.layer.shadowOpacity = YES;
    self.accusationButton.layer.shadowOffset = CGSizeMake(0, 3);
    self.accusationButton.layer.shadowColor = [UIColor grayColor].CGColor;
    self.accusationButton.layer.shadowOpacity = YES;
    
    [view addSubview:self.shieldButton];
    [view addSubview:self.accusationButton];
    [view addSubview:self.addOrCancelFriendButton];
    view.backgroundColor =  RGBCOLOR(238, 238, 238);
    
    self.tableView.tableFooterView = view;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 1) {
        return 40;
    }
    return 0.1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 200;
    }
    return 44;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }
    
    if (section == 1) {
        return 2;
    }
    if (section == 2) {
        return 3;
    }
    return 3;
}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section != 1) {
        return nil;
    }
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.width, 40)];
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 5, 20, 20)];
    [view addSubview:imageView];
    
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, 200, 30)];
    [view addSubview:title];
    title.font = [UIFont systemFontOfSize:16.0f];
    title.textColor = DIDA_ORANGE_COLOR;
    title.centerY = view.height / 2;
    title.text = @"资助回报信息";
    
    view.backgroundColor = [UIColor whiteColor];
    return view;
}


-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    DiDaTableViewCell *cell = (DiDaTableViewCell*)[super tableView:tableView cellForRowAtIndexPath:indexPath];
    cell.needSeparator = NO;
    
    if (indexPath.section == 0) {
        [self configPhotosCell:cell];
        cell.accessoryType = UITableViewCellAccessoryNone;
        return cell;
    }
    
    if (indexPath.section == 2) {
        NSString *text = nil;
        switch (indexPath.row) {
            case 0:
                text = @"她的梦想";
                break;
            case 1:
                text = @"她的动态";
                break;
            case 2:
                text = @"聊天记录";
                break;
            default:
                break;
        }
        cell.textLabel.text = text;
        cell.tintColor = DIDA_ORANGE_COLOR;
    }
    
    return cell ;
}

-(void)configPhotosCell:(UITableViewCell*)cell{
    CGFloat width = [UIDevice screenWidth] - cellContentLeftInset * 2;
    CGFloat width1 = width;
    CGFloat avatarWidth = width1 / 4;
    
    for (int index = 0; index < 8; index++) {
        UIButton *avatar = [[UIButton alloc] init];
        
        NSInteger remainder = index % 4;
        NSInteger mod = index / 4;
        CGFloat hOffset;
        if (remainder == 0) {
             hOffset = 10 + avatarWidth * remainder;
        }else{
             hOffset = 10 + avatarWidth * remainder;
        }
        CGFloat VOffset = 10 * mod + 10 + avatarWidth * mod;
        
        avatar.frame = CGRectMake(hOffset, VOffset, avatarWidth + 1, avatarWidth);
        [avatar addTarget:self action:@selector(buttonEvent:) forControlEvents:UIControlEventTouchUpInside];
        
        [avatar sd_setBackgroundImageWithURL:[NSURL URLWithString:@"http://99touxiang.com/public/upload/nvsheng/237/2_111109140942_41.jpg"] forState:UIControlStateNormal];
        [cell.contentView addSubview:avatar];
    }
}

-(void)buttonEvent:(UIButton*)button{
    DiDaImagesViewController *vc = [[DiDaImagesViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 2) {
        if (indexPath.row == 0 || indexPath.row == 1) {
            UserDRFListController *vc = [[UserDRFListController alloc] initWithIndex:indexPath.row];
            [self.navigationController pushViewController:vc animated:YES];
        }
    }
}

-(void)firstWillApear{
    [super firstWillApear];
}

-(Class)cellClassForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [DiDaTableViewCell class];
}

-(UITableViewStyle)DiDaTableViewStyle{
    return UITableViewStyleGrouped;
}

-(UITableViewCellSeparatorStyle)DiDaTableViewSeparatorStyle{
    return UITableViewCellSeparatorStyleSingleLine;
}

-(UITableViewCellStyle)DiDaTableViewCellStyle{
    return UITableViewCellStyleValue1;
}

-(UITableViewCellAccessoryType)DiDaTableViewCellAccessoryType{
    return UITableViewCellAccessoryDisclosureIndicator;
}


@end
