//
//  ContactLisViewController.m
//  dida
//
//  Created by 袁江 on 14-9-23.
//  Copyright (c) 2014年 he chao. All rights reserved.
//

#import "ContactLisViewController.h"
#import "DiDaSegmentControl.h"
#import "ContactEntity.h"
#import "UserDetailViewController.h"
#import "MyDRFListViewController.h"


@interface ContactLisViewController ()<UITableViewDelegate, UITableViewDataSource, NSFetchedResultsControllerDelegate>
@property(nonatomic, strong)DiDaSegmentControl *segmentControl;
@end

@implementation ContactLisViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的好友管理";
    NSArray *titles = [[NSArray alloc] initWithObjects:@"最近添加", @"资助梦想", @"特别关注", nil];
    self.segmentControl = [[DiDaSegmentControl alloc] initWithTitle:titles
                                                      currentIndex:-1
                                                      eventCallBack:^(BOOL selected , NSInteger selectedIndex) {
        
    }];
    self.segmentControl.frame = CGRectMake(0, 0, [UIDevice screenWidth], 40);
    self.tableView.tableHeaderView = self.segmentControl;
    self.fetchController = [ContactEntity  MR_fetchAllGroupedBy:@"userNameHeaderChar"
                                                  withPredicate:nil
                                                       sortedBy:@"userName"
                                                      ascending:YES];
    self.fetchController.delegate = self;
    
    [[DataEngine sharedInstance] getContactList:^(NSDictionary *sourceDic, NSInteger errorCode, NSString *errorMsg, BOOL hasMore, id otherData) {
        
    }];

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller{
    [self.tableView reloadData];
}

#pragma - mark  UITableViewDataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.fetchController.sections.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [[self.fetchController.sections objectAtIndex:section] numberOfObjects];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell;
    cell = [tableView dequeueReusableCellWithIdentifier:@"ContactCellIdentifer"];
    if (nil == cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ContactCellIdentifer"];
    }
    
    ContactEntity *contactInfo = [self.fetchController objectAtIndexPath:indexPath];
    
    cell.detailTextLabel.text = contactInfo.userName;
    cell.textLabel.text = contactInfo.userName;
    
    return cell;
}

#pragma - mark UITableViewDelegate


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 30;
}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    id<NSFetchedResultsSectionInfo> obj = [self.fetchController.sections objectAtIndex:section];
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, 30)];
    UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, 100, 20)];
    lab.text = obj.name;
    [view addSubview:lab];
    view.backgroundColor = [UIColor grayColor];
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
