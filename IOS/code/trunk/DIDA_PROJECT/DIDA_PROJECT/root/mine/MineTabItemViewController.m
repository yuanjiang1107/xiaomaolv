//
//  MineTabItemViewController.m
//  DIDA_PROJECT
//
//  Created by 袁江 on 14-9-25.
//  Copyright (c) 2014年 luojilab.com. All rights reserved.
//

#import "MineTabItemViewController.h"
#import "HeaderForMineCell.h"
#import "ContactLisViewController.h"
#import "UserDetailViewController.h"
#import "AboutAppViewController.h"
#import "CheckUpgradeViewController.h"
#import "MessageViewController.h"
#import "AppDelegate.h"
#import "MyProfileViewController.h"
#import "MyDRFListViewController.h"
#import "ChangePassWordViewController.h"
#import "MyAccountViewController.h"
#import "PrivacySettingViewController.h"
#import "FeedBackViewController.h"
#import "MyPhotosSettingViewController.h"


@interface MineTabItemViewController ()

    @property(nonatomic, strong)NSArray *dataSource;

@end

@implementation MineTabItemViewController


-(instancetype)init{
    self = [super initWithTableViewType:UITableViewStyleGrouped];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadContent];
    [self loadDataSource];
    // Do any additional setup after loading the view.
}



-(void)loadDataSource{
    NSArray *section0 = [[NSArray alloc] initWithObjects:@"headerPlacehodler", nil];
    NSArray *sectionI = [[NSArray alloc] initWithObjects:@"我的出行梦想",@"我的嘀嗒动态",@"我的形象相册",@"我的好友管理", nil];
    NSArray *sectionII = [[NSArray alloc] initWithObjects:@"默认登录帐号",@"修改登录密码",@"隐私设置",@"信息推送设置", nil];
    NSArray *sectionIII = [[NSArray alloc] initWithObjects:@"离线浏览设置",@"清除本地数据",@"检测更新",@"意见反馈",@"关于帮我去", nil];
    self.dataSource = [[NSArray alloc] initWithObjects:section0 ,sectionI, sectionII, sectionIII, nil];
}

- (void)loadContent{
    
    
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 80)];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"退出客户端" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor whiteColor];
    [button setTitleColor:DIDA_ORANGE_COLOR forState:UIControlStateNormal];
    button.frame = CGRectMake(0, 20, self.view.width - 60, 40);
    button.centerX = [UIDevice screenWidth] / 2;
    [button addTarget:self action:@selector(logoutEvent:) forControlEvents:UIControlEventTouchUpInside];
    [footerView addSubview:button];
    self.tableView.tableFooterView = footerView;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataSource.count;
}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.width, 40)];
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 5, 20, 20)];
    [view addSubview:imageView];
    
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, 200, 30)];
    [view addSubview:title];
    title.font = [UIFont systemFontOfSize:16.0f];
    title.textColor = DIDA_TEXT_COLOR;
    title.centerY = view.height / 2;
    
    switch (section) {
        case 0:
            return nil;
            break;
        case 1:
            title.text = @"我的又一课";
            break;
        case 2:
            title.text = @"安全隐私";
            break;
        case 3:
            title.text = @"软件设置";
        default:
            break;
    }
    view.backgroundColor = [UIColor clearColor];
    return view;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 0.1;
    }
    return 40;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [[self.dataSource objectAtIndex:section] count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return [super tableView:tableView heightForRowAtIndexPath:indexPath];
    }
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        return [super tableView:tableView cellForRowAtIndexPath:indexPath];
    }
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (nil == cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
        cell.textLabel.font = [UIFont systemFontOfSize:14.0f];
        cell.textLabel.textColor = DIDA_TEXT_COLOR;
        cell.separatorInset = UIEdgeInsetsMake(0, -10, 0, 0);
    }
    
    
    
    cell.textLabel.text = [[self.dataSource objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.detailTextLabel.font = [UIFont systemFontOfSize:12.0f];
    cell.detailTextLabel.textColor = DIDA_TEXT_COLOR;
    
    if ([cell.textLabel.text isEqualToString:@"清除本地数据"]) {
        cell.accessoryType = UITableViewCellAccessoryNone;
        NSInteger size = [[SDImageCache sharedImageCache] getSize];
        double dSize = size / 1000.0;
        NSString *str;
        if (dSize < 1024.0) {
            str = [NSString stringWithFormat:@"%llu K", (unsigned long long)dSize];
        }
        else {
            str = [NSString stringWithFormat:@"%.1lf M", dSize / 1000.0];
        }
        cell.detailTextLabel.text = str;
    }else{
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.detailTextLabel.text = @"test";
    }
    
    return cell;
}

-(Class)cellClassForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [HeaderForMineCell class];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];

    if (indexPath.section == 0) {
        switch (indexPath.row) {
            case 0:
            {
                MyProfileViewController *vc = [[MyProfileViewController alloc] init];
                [self.navigationController pushViewController:vc animated:YES];
            }
                break;
                
            default:
                break;
        }
    }else if(indexPath.section == 1){
        switch (indexPath.row) {
            case 0:
            case 1:
            {
                MyDRFListViewController *vc = [[MyDRFListViewController alloc] initWithSelectedType:indexPath.row];
                [self.navigationController pushViewController:vc animated:YES];
            }
                break;
            case 2:{
                MyPhotosSettingViewController *vc = [[MyPhotosSettingViewController alloc] init];
                [self.navigationController pushViewController:vc animated:YES];
            }
                break;
            case 3:
            {
                ContactLisViewController *vc = [[ContactLisViewController alloc] init];
                [self.navigationController pushViewController:vc animated:YES];
            }
                break;
            default:
                break;
        }
    }else if(indexPath.section == 2){
        switch (indexPath.row) {
            case 0:
            {
                MyAccountViewController *vc = [[MyAccountViewController alloc] init];
                [self.navigationController pushViewController:vc animated:YES];
            }
                break;
            case 1:
            {
                ChangePassWordViewController *vc = [[ChangePassWordViewController alloc] init];
                [self.navigationController pushViewController:vc animated:YES];
            }
                break;
            case 2:
            {
                PrivacySettingViewController *vc = [[PrivacySettingViewController alloc] init];
                [self.navigationController pushViewController:vc animated:YES];
                break;
            }
            
                break;
            case 3:
                break;
            default:
                break;
        }
        
    }else if (indexPath.section == 3){
        switch (indexPath.row) {
            case 0:
                
                break;
            case 1:
                [self cleanCache];
                break;
            case 2:
            {
                [self checkVersion];
            }
                break;
                case 3:
            {
                FeedBackViewController *vc = [[FeedBackViewController alloc] init];
                [self.navigationController pushViewController:vc animated:YES];
            }
                break;
            case 4:{
                AboutAppViewController *vc = [[AboutAppViewController  alloc] init];
                [self.navigationController pushViewController:vc animated:YES];
            }
                break;
            default:
                break;
        }
    }
}

-(UITableViewCellSeparatorStyle)DiDaTableViewSeparatorStyle{
    return UITableViewCellSeparatorStyleSingleLine;
}

-(void)checkVersion{
    NSString *appVersion = [UIDevice appShotVersion];
    [MBHudUtil showActivityView:@"检测更新" inView:self.view];
    [[DataEngine sharedInstance] getAPPInfoFromItunes:^(NSDictionary *sourceDic, NSInteger errorCode, NSString *errorMsg, BOOL hasMore, id otherData) {
        NSDictionary *dic = [[sourceDic objectForKey:@"results"] objectAtIndex:0];
        NSString *appVersionFromItunes = [dic objectForKey:@"version"];
        
        if ([appVersion compare:appVersionFromItunes] == NSOrderedAscending) {
            [MBHudUtil hideActivityView:self.view];
            CheckUpgradeViewController *vc = [[CheckUpgradeViewController alloc] init];
            vc.info = dic;
            [self.navigationController pushViewController:vc animated:YES];
        }else{
            [MBHudUtil showFinishActivityView:@"已经是最新版本" inView:self.view];
        }
    }];

}


- (void)cleanCache
{
    // TLB TODO
    [MBHudUtil showActivityView:@"缓存清理中..." inView:self.view];
    [self performSelector:@selector(finishCleanCache) withObject:nil afterDelay:0.5f];
    //
    [[SDImageCache sharedImageCache] clearDisk];
    //
    [self.tableView reloadData];
}

- (void)finishCleanCache
{
    [MBHudUtil showFinishActivityView:@"缓存清理完成"
                               inView:self.view];
}



-(void)logoutEvent:(id)sender{
   AppDelegate *app = [UIApplication sharedApplication].delegate;
    [app showLoginVc];
}





- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
  
}

@end
