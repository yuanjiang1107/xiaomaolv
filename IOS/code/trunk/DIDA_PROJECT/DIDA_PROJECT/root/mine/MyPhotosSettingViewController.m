//
//  MyPhotosSettingViewController.m
//  DIDA_PROJECT
//
//  Created by 袁江 on 14/12/4.
//  Copyright (c) 2014年 luojilab.com. All rights reserved.
//

#import "MyPhotosSettingViewController.h"
#import "SortPhotosViewController.h"


@interface MyPhotosSettingViewController ()

@end

@implementation MyPhotosSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"个人形象照片设置";
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 60;
    }
    return 45;
}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    CGFloat height = 45 ;
    if (section == 0) {
        height = 60;
    }
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.width, height)];
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 5, 20, 20)];
    [view addSubview:imageView];
    
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, self.view.width - 30, height)];
    [view addSubview:title];
    title.font = [UIFont systemFontOfSize:15.0f];
    title.textColor = DIDA_TEXT_COLOR;
    title.centerY = view.height / 2;
    title.numberOfLines = 0;
    switch (section) {
        case 0:
            title.text = @"个人形象照片最多只能上传8张\n默认开放4张照片\n你已设定开放8张照片";
            title.font = [UIFont systemFontOfSize:12.0f];
        
            break;
        case 1:
            title.text = @"所有人可见";
            break;
        case 2:
            title.text = @"自己可见";
            break;
        default:
            break;
    }
    view.backgroundColor = [UIColor clearColor];
    return view;

}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 44;
    }else{
        return 160;
    }
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"xx"];
    
    if (indexPath.section == 0 && indexPath.row == 0) {
        cell.textLabel.text = @"陌生人可查看8张照片";
        cell.accessoryView = [[UISwitch alloc]init];
        cell.textLabel.font = [UIFont systemFontOfSize:15.0f];
        cell.textLabel.textColor = DIDA_TEXT_COLOR;
    }else{
        [self configCell:cell indexPath:indexPath];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}


-(void)configCell:(UITableViewCell*)cell indexPath:(NSIndexPath*)indexPath{
    
    CGFloat width = [UIDevice screenWidth] - cellContentLeftInset * 2;
    CGFloat width1 = width - 10 * 5;
    CGFloat avatarWidth = width1 / 4;
    
    for (int index = 0; index < 8; index++) {
        UIButton *avatar = [[UIButton alloc] init];
        avatar.backgroundColor = [UIColor greenColor];
        
        NSInteger remainder = index % 4;
        NSInteger mod = index / 4;
        CGFloat hOffset = 10 * (remainder + 1) + avatarWidth * remainder;
        CGFloat VOffset = 10 * mod + 10 + avatarWidth * mod;
        
        avatar.frame = CGRectMake(hOffset + cellContentLeftInset, VOffset, avatarWidth, avatarWidth);
        [avatar addTarget:self action:@selector(buttonEvent:) forControlEvents:UIControlEventTouchUpInside];
        
        [cell.contentView addSubview:avatar];
    }

}

-(void)buttonEvent:(UIButton*)button{
    SortPhotosViewController *vc = [[SortPhotosViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
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
