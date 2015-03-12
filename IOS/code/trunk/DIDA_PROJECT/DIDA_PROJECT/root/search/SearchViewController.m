//
//  SearchViewController.m
//  DIDA_PROJECT
//
//  Created by 袁江 on 14-9-26.
//  Copyright (c) 2014年 luojilab.com. All rights reserved.
//

#import "SearchViewController.h"
#import "SearchToolBar.h"
#import "DiDaSegmentControl.h"


@interface SearchViewController ()<UISearchBarDelegate>

CREATE_STRONG SearchToolBar *searchToolBar;

CREATE_STRONG UISearchBar *searchField;

@end

@implementation SearchViewController

-(instancetype)init{
    self = [super init];
    if (self) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem =  [[UIBarButtonItem alloc] initWithTitle:@"取消"
                                                                               style:UIBarButtonItemStylePlain target:self action:@selector(cancelEvent:)];
    S.searchToolBar = [[SearchToolBar alloc] initWithNames:@[@"梦想", @"找人"] currentIndex:1 selectedBlock:^(NSInteger index) {
        [self setPlaceHolder:index];
    } ];
    S.searchToolBar.frame = CGRectMake(0, 0, self.view.width, 35);
    

    [self.view addSubview:self.searchToolBar];
    
    S.searchField = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 15, self.view.width - 90, 30)];
    self.navigationItem.titleView = S.searchField;
    S.searchField.delegate = self;
    [self setPlaceHolder:self.searchType];
    
}


-(void)setPlaceHolder:(NSInteger)type{
    switch (type) {
        case SearchTypeDream:
            S.searchField.placeholder = @"梦想";
            break;
        case SearchTypeSomeone:
            S.searchField.placeholder = @"找人";
            break;
        case SearchTypeTravel:
            S.searchField.placeholder = @"游记";
            break;
        default:
            break;
    }

}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    self.tableView.frame = CGRectMake(0, 40, self.view.width, self.view.height - 40);
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    S.searchField.becomeFirstResponder;
}

-(void)cancelEvent:(id)sender{
    if ([self.delegate respondsToSelector:@selector(dismissMe)]) {
        [self.delegate dismissMe];
    }
}


-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    DiDaSegmentControl *control = [[DiDaSegmentControl alloc] initWithTitle:@[@"最多关注", @"最新发布", @"我的关注"]
                                   
                                                               currentIndex:-1 eventCallBack:^(BOOL selected, NSInteger selectedIndex) {
        
    }];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, 60)];
    UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, self.view.width - 20, 20)];
    lab.textAlignment = NSTextAlignmentCenter;
    lab.text = @"搜索到xxx条数据";
    lab.font = [UIFont systemFontOfSize:14.0f];
    lab.textColor = DIDA_TEXT_COLOR;
    [view addSubview:lab];
    control.frame = CGRectMake(5, 0, self.view.width - 10, 32);
    control.bottom = view.height;
    [view addSubview:control];
    self.tableView.tableHeaderView = view;
    [self.tableView reloadData];
    [self.searchField resignFirstResponder];
}


-(void)processDreamSearch{
    
}

-(void)processFriendSearch{
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
