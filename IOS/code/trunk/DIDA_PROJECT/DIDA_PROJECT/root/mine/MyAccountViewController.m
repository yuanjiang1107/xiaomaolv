//
//  MyAccountViewController.m
//  DIDA_PROJECT
//
//  Created by 袁江 on 14/12/1.
//  Copyright (c) 2014年 luojilab.com. All rights reserved.
//

#import "MyAccountViewController.h"

@interface MyAccountViewController ()

@end

@implementation MyAccountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"账号设置";
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
        return 1;
    }else{
        return 2;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 40;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1;
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

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    DiDaTableViewCell *cell = [[DiDaTableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"xxxxxx"];
    if (indexPath.section == 0) {
        cell.textLabel.text = @"指日可待";
    }else{
        if (indexPath.row == 0) {
            cell.textLabel.text = @"微信";
        }else{
            cell.textLabel.text = @"新浪微博";
        }
        cell.accessoryView = [[UISwitch alloc] init];
    }
    cell.needSeparator = NO;
    return cell;
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
