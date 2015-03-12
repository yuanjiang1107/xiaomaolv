//
//  SearchViewController.m
//  DIDA_PROJECT
//
//  Created by 袁江 on 14-9-26.
//  Copyright (c) 2014年 luojilab.com. All rights reserved.
//

#import "SearchViewController.h"
#import "SearchToolBar.h"


@interface SearchViewController ()

CREATE_STRONG SearchToolBar *searchToolBar;

CREATE_STRONG UISearchBar *searchField;

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem =  [[UIBarButtonItem alloc] initWithTitle:@"取消"
                                                                               style:UIBarButtonItemStylePlain target:self action:@selector(cancelEvent:)];
    S.searchToolBar = [[SearchToolBar alloc] initWithNames:@[@"搜梦想", @"搜游记", @"找人"]];
    S.searchToolBar.frame = CGRectMake(0, 0, self.view.width, 40);
    
    self.tableView.tableHeaderView = self.searchToolBar;
    
    
    
    S.searchField = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 15, self.view.width - 90, 30)];
    self.navigationItem.titleView = S.searchField;
    
    if (self.searchType) {
        
    }
    switch (self.searchType) {
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

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    S.searchField.becomeFirstResponder;
}

-(void)cancelEvent:(id)sender{
    if ([self.delegate respondsToSelector:@selector(dismissMe)]) {
        [self.delegate dismissMe];
    }
}

-(void)searchEvent:(id)sender{
    
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
