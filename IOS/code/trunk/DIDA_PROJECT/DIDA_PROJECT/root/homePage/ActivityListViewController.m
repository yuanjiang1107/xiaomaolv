//
//  ActivityListViewController.m
//  DIDA_PROJECT
//
//  Created by 袁江 on 14-10-24.
//  Copyright (c) 2014年 luojilab.com. All rights reserved.
//

#import "ActivityListViewController.h"
#import "ActivityCell.h"
#import "ActivityInfoCell.h"
#import "ActivityVideoCell.h"
#import "SignUpCell.h"
#import "Top5Cell.h"
#import "LeaderCell.h"
#import "GuideInfoCell.h"
#import "RewardCell.h"
#import "SchedulingCell.h"
#import "NoticeCell.h"
#import "MemberListCell.h"
#import "PhotoAlbumCell.h"
#import <objc/runtime.h>

#define sectionHeaderHeight 35

@interface ActivityListViewController ()

@end

@implementation ActivityListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.estimatedRowHeight = UITableViewAutomaticDimension;
    self.tableView.backgroundColor = DIDA_BACKGROUND_COLOR;
    self.title = @"活动详情";
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


-(UITableViewStyle)DiDaTableViewStyle{
    return UITableViewStyleGrouped;
}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 0.1;
    }
    return sectionHeaderHeight;
}

//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    Class obj_class = [self cellClassForRowAtIndexPath:indexPath];
//    DiDaTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[self reusableIdentifierWithClass:obj_class]];
//    if (cell == nil) {
//        cell = [[obj_class alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[self reusableIdentifierWithClass:obj_class]];
//    }
//    CGFloat height = [cell heightForCellWidth:nil];
//    return height;
//}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 9;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 10;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return 3;
            break;
        case 1:
            return 1;
            break;
        case 2:
            return 3;
            break;
        case 3:
            break;
        default:
            break;
    }
    return 1;
}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    NSString *title = nil;
    NSUInteger index = 0;
    switch (section) {
        case 0:
            return nil;
            break;
        case 1:
            title = @"筹款报名 Top 5";
            break;
        case 2:
            title = @"带队大伽／明星";
            break;
        case 3:
            title = @"活动导读－活动看点";
            index = 5;
            break;
        case 4:
            title = @"独享福利-活动特色";
            index = 5;
            break;
        case 5:
            title = @"日程与行程－活动安排";
            index = 6;
            break;
        case 6:
            title = @"报名必读－注意事项";
            index = 5;
            break;
        case 7:
            title = @"报名名单－出行成员墙";
            index = 5;
            break;
        case 8:
            title = @"活动图集";
            break;
        default:
            break;
    }
    NSMutableAttributedString *attributeStr = [[NSMutableAttributedString alloc] initWithString:title];
    [attributeStr addAttribute:NSForegroundColorAttributeName
                          value:DIDA_ORANGE_COLOR
                          range:NSMakeRange(0, index)];
    
    return [self sectionHeaderViewWidth: attributeStr];

}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [super tableView:tableView cellForRowAtIndexPath:indexPath];
    return cell;
}

-(UITableViewCellSeparatorStyle)DiDaTableViewSeparatorStyle{
    return UITableViewCellSeparatorStyleNone;
}

-(Class)cellClassForRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.section) {
        case 0:
            if (indexPath.row == 0) {
                return [ActivityInfoCell class];
            }else if(indexPath.row == 1){
                return [ActivityVideoCell class];
            }else if(indexPath.row == 2){
                return [SignUpCell class];
            }
        case 1:
            return [Top5Cell class];
            break;
        case 2:
            return [LeaderCell class];
            break;
        case 3:
            return [GuideInfoCell class];
            break;
        case 4:
            return [RewardCell class];
        case 5:
            return [SchedulingCell class];
            break;
        case 6:
            return [NoticeCell class];
            break;
        case 7:
            return [MemberListCell class];
            break;
        case 8:
            return [PhotoAlbumCell class];
            break;
        default:
            break;
    }
    return [ActivityCell class];
}



#pragma -mark custom methed

-(UIView*)sectionHeaderViewWidth:(NSAttributedString*)title{
    UIImageView *view = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, [UIDevice screenWidth], sectionHeaderHeight)];
    UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(cellContentLeftInset + 10, 0, 200, 20)];
    lab.attributedText = title;
    lab.centerY = view.height / 2;
    [view addSubview:lab];
    lab.font = [UIFont systemFontOfSize:16.0f];
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIDevice screenWidth] - 2 * cellContentLeftInset, 1)];
    line.centerX = self.view.width / 2;
    line.bottom = view.height;
    line.backgroundColor = DIDA_ORANGE_COLOR;
    [view addSubview:line];
    view.backgroundColor = [UIColor clearColor];
    
    UIImage *image = [UIImage imageNamed:@"ios切片_02.png"];
    CGSize s = image.size;
    view.image = [image resizableImageWithCapInsets:UIEdgeInsetsMake(s.height/2.0f-1, s.width/2.0f-1, s.height/2.0+1, s.width/2.0+1)];
    return view;
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
