//
//  PrivacySettingViewController.m
//  DIDA_PROJECT
//
//  Created by 袁江 on 14/12/1.
//  Copyright (c) 2014年 luojilab.com. All rights reserved.
//

#import "PrivacySettingViewController.h"

@interface PrivacySettingViewController ()

@end

@implementation PrivacySettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 3;
    }else{
        return 2;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 50;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1;
}




-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *identifier = @"cell______";
    DiDaTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[DiDaTableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
        UISwitch *switchControl = [[UISwitch alloc] init];
        switchControl.onTintColor = DIDA_ORANGE_COLOR;
        cell.accessoryView = switchControl;

    }
    NSString *title;
    if (indexPath.section == 0) {
        switch (indexPath.row) {
            case 0:
                title = @"想我推荐通讯录好友";
                break;
            case 1:
                title = @"加我好友需要验证";
                break;
            case 2:
                title = @"通讯录黑名单";
                break;
            case 3:
                
                break;
            default:
                break;
        }
    }else{
        switch (indexPath.row) {
            case 0:
                title = @"允许陌生人发送消息";
                break;
            case 1:
                title = @"非出行区间允许陌生人查看";
                break;
                
            default:
                break;
        }
    }
    cell.textLabel.text = title;
    cell.textLabel.font = [UIFont systemFontOfSize:16.0];
    cell.textLabel.textColor = DIDA_TEXT_COLOR;
    cell.needSeparator = NO;
    cell.separatorInset = UIEdgeInsetsMake(0, 10, 0, 0);
    return cell;
}


-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.width, 50)];
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 5, 20, 20)];
    [view addSubview:imageView];
    
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, 200, 30)];
    [view addSubview:title];
    title.font = [UIFont systemFontOfSize:16.0f];
    title.textColor = DIDA_TEXT_COLOR;
    title.centerY = view.height / 2;
    
    switch (section) {
        case 0:
            title.text = @"登陆账号";
            break;
        case 1:
            title.text = @"社交网络账号设置";
            break;
        default:
            break;
    }
    view.backgroundColor = [UIColor clearColor];
    return view;
}

-(UITableViewCellSeparatorStyle)DiDaTableViewSeparatorStyle{
    return UITableViewCellSeparatorStyleSingleLine;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
