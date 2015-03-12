//
//  MessageViewController.m
//  DIDA_PROJECT
//
//  Created by 袁江 on 14-10-10.
//  Copyright (c) 2014年 luojilab.com. All rights reserved.
//

#import "MessageViewController.h"
#import "DiDaSegmentControl.h"
#import "ChatCell.h"
#import "ChatMessage.h"
#import "SystemMessageCell.h"
#import "ChatViewController.h"


@interface MessageViewController ()

CREATE_STRONG DiDaSegmentControl *segmentControl;

@property(nonatomic, assign)NSInteger currentPage;

@end

@implementation MessageViewController


-(instancetype)init{
    self = [super init];
    if (self) {
        self.hidesBottomBarWhenPushed = NO;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"消息";
    NSArray *titles = @[@"系统消息", @"好友消息", @"临时消息"];
    self.segmentControl = [[DiDaSegmentControl alloc] initWithTitle:titles eventCallBack:^(NSInteger selectedIndex) {
        self.currentPage = selectedIndex;
    }];
    _currentPage = 1;
    [self.segmentControl setSelectedIndex:self.currentPage];
    self.segmentControl.frame = CGRectMake(10, 10, self.view.width - 20, 30);
    UIView   *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIDevice screenWidth], 50)];
    [view addSubview:self.segmentControl];
    self.tableView.tableHeaderView = view;
    // Do any additional setup after loading the view.
//    self.fetchController = [ChatMessage  MR_fetchAllGroupedBy:@"userNameHeaderChar"
//                                                  withPredicate:nil
//                                                       sortedBy:nil
//                                                      ascending:YES];
    self.fetchController.delegate = self;
    

}

-(void)setCurrentPage:(NSInteger )currentPage{
    if (_currentPage != currentPage){
        _currentPage = currentPage;
        [self.tableView reloadData];
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.currentPage == 1) {
        ChatViewController *vc = [[ChatViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (self.currentPage == 0) {
        return 1;
    }else if(self.currentPage == 1){
        return 5;
    }else{
        return 2;
    }
    return self.fetchController.sections.count;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if (self.currentPage == 0) {
        return 10;
    }
    return 1;
}



-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 0;
    }else{
        return 10;
    }
}


-(Class)cellClassForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.currentPage == 0) {
        return [SystemMessageCell class];
    }else {
        return [ChatCell class];
    }
}


-(UITableViewStyle)DiDaTableViewStyle{
    return UITableViewStylePlain;
}

@end
