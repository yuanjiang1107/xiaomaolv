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
#import "filterView.h"
#import "DreamDetailViewController.h"


#define filterButtonTitlePrefix @"设置筛选条件"


@interface FilterViewButton : UIButton

@end

@implementation FilterViewButton

-(CGRect)imageRectForContentRect:(CGRect)contentRect{
    CGRect rect = CGRectMake(self.width - self.currentImage.size.width - 5, (self.height - self.currentImage.size.height) / 2, self.currentImage.size.width,self.currentImage.size.height);
    return rect;
}

-(CGRect)titleRectForContentRect:(CGRect)contentRect{
    CGRect rect = CGRectMake(10, 0, self.width - self.currentImage.size.width - 5, self.height);
    return rect;
}
@end


@interface DreamTabItemViewController ()

CREATE_STRONG DiDaSegmentControl *segmentControl;
CREATE_ASSIGN NSInteger cellCount;
CREATE_STRONG FilterViewButton* filterButton;
@end




@implementation DreamTabItemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.cellCount = 5;
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, 80)];
    self.filterButton = [FilterViewButton buttonWithType:UIButtonTypeSystem];
    self.filterButton .backgroundColor = [UIColor whiteColor];
    self.filterButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [self.filterButton setImage:[UIImage imageNamed:@"arrow.png"] forState:UIControlStateNormal];
    [self.filterButton setTitleColor:DIDA_TEXT_COLOR forState:UIControlStateNormal];
    [self setFilterButtonTitle:@"未设置"];
    
    self.filterButton.frame = CGRectMake(10, 10, self.view.width - 20, 30);
    [self.filterButton  addTarget:self action:@selector(showFilter:) forControlEvents:UIControlEventTouchUpInside];
    self.filterButton.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    [view addSubview:self.filterButton ];
    
    __weak typeof(self) bSelf = self;
    self.segmentControl = [[DiDaSegmentControl alloc] initWithTitle:@[@"最多关注", @"最新发布", @"我的关注"]
                                                      currentIndex:-1 eventCallBack:^(BOOL selected, NSInteger selectedIndex) {
        
    }];
    self.segmentControl.size = CGSizeMake(self.view.width - 20, 30);
    self.segmentControl.centerX = self.view.width / 2;
    self.segmentControl.bottom = view.height;
    [view addSubview:self.segmentControl];
    self.tableView.tableHeaderView = view;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:self.title style:UIBarButtonItemStyleDone target:nil action:nil];
    
    self.navigationItem.backBarButtonItem = item;
}

-(void)setFilterButtonTitle:(NSString*)text{
    NSString *str = [NSString stringWithFormat:@"%@ %@", filterButtonTitlePrefix, text];
    NSDictionary *att = [NSDictionary dictionaryWithObject:[UIFont systemFontOfSize:10.0f] forKey:NSFontAttributeName];
    NSMutableAttributedString *mStr = [[NSMutableAttributedString alloc] initWithString:str ];
    [mStr addAttributes:att range:NSMakeRange(filterButtonTitlePrefix.length + 1, text.length)];
    [mStr addAttribute:NSForegroundColorAttributeName value:DIDA_TEXT_COLOR range:NSMakeRange(0, mStr.length)];
    [self.filterButton setAttributedTitle:mStr forState:UIControlStateNormal];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)showFilter:(UIButton*)button{
    FilterView  *filterView = [[FilterView alloc] initWithBlock:^(NSDictionary *info) {
        
    }];
    [filterView show];
}

-(void)firstDidApear{
    [super firstDidApear];
    block_self;
    [self addPullToRefreshWithActionHandler:^{
        [bself performSelector:@selector(stop) withObject:bself afterDelay:1];
    }];
    
    [self addInfiniteScrollingWithActionHandler:^{
        [bself performSelector:@selector(stop1) withObject:bself afterDelay:1];
    }];
}

-(void)stop{
    [self.tableView.pullToRefreshView stopAnimating];
//    [self.tableView.infiniteScrollingView stopAnimating];
//    self.tableView.showsInfiniteScrolling = NO;
//    UILabel *lb = [[UILabel alloc] init];
//    lb.text = @"没有更多";
//    lb.frame = CGRectMake(0, 0, [UIDevice screenWidth], 40);
//    [self.tableView.infiniteScrollingView setCustomView:lb forState:SVInfiniteScrollingStateAll];
//
    self.cellCount = 5;
    [self.tableView reloadData];
}

-(void)stop1{
    [self.tableView.infiniteScrollingView stopAnimating];
    self.cellCount += 5;
    if (self.cellCount > 15) {
        self.tableView.showsInfiniteScrolling = NO;
    }
    [self.tableView reloadData];
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.cellCount;
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
    DreamDetailViewController *vc = [[DreamDetailViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
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
