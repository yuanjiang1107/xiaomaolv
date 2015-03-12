//
//  DiDaTableViewController.m
//  dida
//
//  Created by 袁江 on 14-9-22.
//  Copyright (c) 2014年 he chao. All rights reserved.
//

#import "DiDaTableViewController.h"

@interface DiDaTableViewController ()
@end

@implementation DiDaTableViewController

-(instancetype)initWithTableViewType:(UITableViewStyle)style{
    self = [super init];
    if (self) {
        self.tableView = [[UITableView alloc]initWithFrame:[UIScreen mainScreen].bounds style:style];
        self.tableView.backgroundColor = [UIColor clearColor];
        self.hidesBottomBarWhenPushed = YES;
    }
    return self;
}

-(instancetype)init{
    return [self initWithTableViewType:[self DiDaTableViewStyle]];
}

- (void)viewDidLoad {
    //self.edgesForExtendedLayout = UIRectEdgeNone;
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    self.tableView.frame = self.view.frame;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = [self DiDaTableViewSeparatorStyle];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
}

-(void)firstDidLayoutSubViews{
    [super firstDidLayoutSubViews];
    self.tableView.frame = self.view.bounds;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    Class obj_class = [self cellClassForRowAtIndexPath:indexPath];
    CGFloat height = [obj_class heightForClassCellWidth:[self.fetchController objectAtIndexPath:indexPath]
                                               position:[self positionForCellAtIndex:indexPath]];
    return height;

}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [[self.fetchController.sections objectAtIndex:section] numberOfObjects];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.fetchController.sections.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    Class obj_class = [self cellClassForRowAtIndexPath:indexPath];
    
    DiDaTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[self reusableIdentifierWithClass:obj_class]];
    if (cell == nil) {
        cell = [[obj_class alloc] initWithStyle:[self DiDaTableViewCellStyle] reuseIdentifier:[self reusableIdentifierWithClass:obj_class]];
    }
    
    [self.fetchController objectAtIndexPath:indexPath];
    cell.accessoryType = [self DiDaTableViewCellAccessoryType];
    cell.tintColor = DIDA_ORANGE_COLOR;
    
    cell.cellPosition = [self positionForCellAtIndex:indexPath];
    
    [cell configCellWithData:[self.fetchController objectAtIndexPath:indexPath] position:cell.cellPosition];
    
    return cell;
}

-(CellPosition)positionForCellAtIndex:(NSIndexPath*)indexPath{
    CellPosition posion = CellPositionMid;
    if (indexPath.row == 0) {
        posion = CellPositionTop;
    }
    
    NSInteger numOfSection = [[self.fetchController.sections objectAtIndex:indexPath.section] numberOfObjects];
    
    if (indexPath.row == numOfSection - 1) {
        posion = CellPositionBottom;
    }
    return posion;
}

-(NSString*)reusableIdentifierWithClass:(Class)class{
    return [NSString stringWithFormat:@"%@_identifier", class];
}

-(Class)cellClassForRowAtIndexPath:(NSIndexPath*)indexPath{
    return [DiDaTableViewCell class];
}

-(UITableViewStyle)DiDaTableViewStyle{
    return UITableViewStyleGrouped;
}

-(UITableViewCellSeparatorStyle)DiDaTableViewSeparatorStyle{
    return UITableViewCellSeparatorStyleSingleLineEtched;
}

-(UITableViewCellStyle)DiDaTableViewCellStyle{
    return UITableViewCellStyleDefault;
}

-(UITableViewCellAccessoryType)DiDaTableViewCellAccessoryType{
    return UITableViewCellAccessoryNone;
}




- (void)addPullToRefreshWithActionHandler:(void (^)(void))actionHandler{
//    UIImage *logo = [UIImage imageNamed:@"pull_logoBg.png"];
//    UIImageView *logoView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, logo.size.width, logo.size.height)];
//    logoView.image = logo;
//    logoView.centerX = self.view.width / 2;
//    [self.view addSubview:logoView];
//    [self.view sendSubviewToBack:logoView];
//    self.view.backgroundColor = DIDA_NAVIGATIONBAR_COLOR;
    [self.tableView addPullToRefreshWithActionHandler:actionHandler];
}

- (void)addInfiniteScrollingWithActionHandler:(void (^)(void))actionHandler{
    [self.tableView addInfiniteScrollingWithActionHandler:actionHandler];
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
