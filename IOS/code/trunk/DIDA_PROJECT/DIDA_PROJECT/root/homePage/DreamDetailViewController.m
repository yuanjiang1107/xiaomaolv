//
//  DreamDetailViewController.m
//  DIDA_PROJECT
//
//  Created by 袁江 on 14/11/14.
//  Copyright (c) 2014年 luojilab.com. All rights reserved.
//

#import "DreamDetailViewController.h"
#import "DreamInfoCell.h"
#import "DreamAbstractCell.h"
#import "CrowdfundingCell.h"
#import "DreamDetailCell.h"
#import "RepayWayCell.h"
#import "OwnerFeedCell.h"
#import "ContentViewToolBar.h"



#define sectionHeaderHeight 35

@interface DreamDetailViewController ()<UIActionSheetDelegate>



@end

@implementation DreamDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.estimatedRowHeight = UITableViewAutomaticDimension;
    self.tableView.backgroundColor = DIDA_BACKGROUND_COLOR;
    self.title = @"梦想详情";
    self.tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    // Do any additional setup after loading the view.
}





-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 0.1;
    }if(section == 1){
        return -1;
    }if(section == 2){
        return -1;
    }
    return sectionHeaderHeight;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 6;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 4) {
        return 3;
    }else if(section == 5){
        return 4;
    }
    return 1;
}

-(Class)cellClassForRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.section) {
        case 0:
            return [DreamInfoCell class];
            break;
        case 1:
            return [DreamAbstractCell class];
            break;
        case 2:
            return [CrowdfundingCell class];
            break;
        case 3:
            return [DreamDetailCell class];
            break;
        case 4:
            return [RepayWayCell class];
            break;
        case 5:
            return [OwnerFeedCell class];
            break;
        default:
            break;
    }
    return [DreamAbstractCell class];
    
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    DiDaTableViewCell *cell = (DiDaTableViewCell*)[super tableView:tableView cellForRowAtIndexPath:indexPath];
    return cell;
}

-(CellPosition)positionForCellAtIndex:(NSIndexPath *)indexPath{
    CellPosition position;
    if (indexPath.section == 5) {
        if (indexPath.row == 0) {
            position = CellPositionTop;
        }else if(indexPath.row == 3){
            position = CellPositionBottom;
        }else{
            position = CellPositionMid;
        }
    }
    return position;
}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    NSString *title = nil;
    NSUInteger index = 0;
    switch (section) {
        case 0:
            return nil;
            break;
        case 1:
            return nil;
            break;
        case 2:
            return nil;
            break;
        case 3:
            title = @"梦想详情";
            index = 4;
            break;
        case 4:
            title = @"回报方案";
            index = 4;
            break;
        case 5:
            title = @"主人动态";
            index = 4;
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

-(void)catalogDidSelectedItemWith:(NSInteger)index title:(NSString *)title{
    NSIndexPath *path = [NSIndexPath  indexPathForRow:1 inSection:4];
    [self.tableView scrollToRowAtIndexPath:path atScrollPosition:UITableViewScrollPositionTop animated:YES];
}

-(void)contentViewToolBarDidSelectedItem:(NSInteger)index{
    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:@"分享"
                                                       delegate:self
                                              cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"微信", @"微博", nil];
    
    [sheet showInView:self.view];
}

@end
