//
//  DreamTabItemViewController.m
//  DIDA_PROJECT
//
//  Created by 袁江 on 14-9-25.
//  Copyright (c) 2014年 luojilab.com. All rights reserved.
//

#import "DreamTabItemViewController.h"
#import "DiDaSegmentControl.h"
#import "DreamCell.h"
@interface DreamTabItemViewController ()

CREATE_STRONG DiDaSegmentControl *segmentControl;

@end

@implementation DreamTabItemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, 40)];
    __weak typeof(self) bSelf = self;
    self.segmentControl = [[DiDaSegmentControl alloc] initWithTitle:@[@"最多关注", @"最新发布", @"我的关注"] eventCallBack:^(NSInteger selectedIndex) {
        
    }];
    self.segmentControl.size = CGSizeMake(self.view.width - 40, 30);
    self.segmentControl.centerX = self.view.width / 2;
    self.segmentControl.top = 10;
    [view addSubview:self.segmentControl];
    self.tableView.tableHeaderView = view;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = DIDA_BACKGROUND_COLOR;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)firstDidApear{
    [super firstDidApear];
    block_self;
    [self.tableView addPullToRefreshWithActionHandler:^{
        [bself performSelector:@selector(stop) withObject:bself afterDelay:1];
    }];
    
    [self.tableView addInfiniteScrollingWithActionHandler:^{
        [bself performSelector:@selector(stop) withObject:bself afterDelay:1];
    }];
}

-(void)stop{
    [self.tableView.pullToRefreshView stopAnimating];
    [self.tableView.infiniteScrollingView stopAnimating];
//    self.tableView.showsInfiniteScrolling = NO;
//    UILabel *lb = [[UILabel alloc] init];
//    lb.text = @"没有更多";
//    lb.frame = CGRectMake(0, 0, [UIDevice screenWidth], 40);
//    [self.tableView.infiniteScrollingView setCustomView:lb forState:SVInfiniteScrollingStateAll];
//
    [self.tableView reloadData];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 300.0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *reuseIdentifier = @"DreamCellIdentifier";
    DreamCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    if (nil == cell) {
        cell = [[DreamCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
        cell.selectionStyle = UITableViewCellSeparatorStyleNone;
    }
    [cell configCellWithData:nil position:CellPositionTop];
    cell.backgroundColor = [UIColor clearColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

-(UITableViewStyle)DiDaTableViewStyle{
    return UITableViewStylePlain;
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
