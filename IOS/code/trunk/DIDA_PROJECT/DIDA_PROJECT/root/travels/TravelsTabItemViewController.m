//
//  TravelsTabItemViewController.m
//  DIDA_PROJECT
//
//  Created by 袁江 on 14-9-25.
//  Copyright (c) 2014年 luojilab.com. All rights reserved.
//

#import "TravelsTabItemViewController.h"
#import "filterView.h"
#import "DreamCell.h"

@interface TravelsTabItemViewController ()

CREATE_STRONG FilterView *filterView;

@end

@implementation TravelsTabItemViewController

//-(instancetype)init{
//    self = [super init];
//    if (self) {
//        
//    }
//    return self;
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIDevice screenWidth], 60)];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"设置筛选条件" forState:UIControlStateNormal];
    button.frame = CGRectMake(0, 5, view.width - 40, 30);
    button.centerX = view.width / 2;
    [button  addTarget:self action:@selector(filterEvent:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:button];
    button.backgroundColor = [UIColor yellowColor];
    self.tableView.tableHeaderView = view;
    // Do any additional setup after loading the view.
}

-(void)filterEvent:(id)sender{
    self.filterView = [[FilterView alloc] initWithBlock:^(NSDictionary *info) {
        
    }];
//    UIAlertView *alertView  = [[UIAlertView alloc] initWithTitle:@"xxxx" message:@"ddddd" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
//    [alertView show];
    
    [self.filterView show];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
