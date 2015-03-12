//
//  HomeTabItemViewController.m
//  DIDA_PROJECT
//
//  Created by 袁江 on 14-9-25.
//  Copyright (c) 2014年 luojilab.com. All rights reserved.
//

#import "HomeTabItemViewController.h"
#import "HeaderForMineCell.h"
#import "ContactLisViewController.h"
#import "PrepareCell.h"
#import "CycleScrollView.h"
#import "DiDaSegmentControl.h"
#import "DreamCell.h"
#import "DreamDetailViewController.h"
#import "ActivityListViewController.h"


@interface HomeTabItemViewController ()

CREATE_STRONG CycleScrollView *bannerView;

CREATE_STRONG DiDaSegmentControl *segmentControl;

CREATE_STRONG NSArray *bannerImages;

@end

@implementation HomeTabItemViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    [self loadBannerView];
    [self loadData];
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, 250)];
    __weak typeof(self) bSelf = self;
    self.segmentControl = [[DiDaSegmentControl alloc] initWithTitle:@[@"最多关注", @"最新发布", @"我的关注"] eventCallBack:^(NSInteger selectedIndex) {
        [bSelf.segmentControl setSelectedIndex:1];
        bSelf.tabBarController.selectedIndex = 1;
    }];
    self.segmentControl.size = CGSizeMake(self.view.width - 40, 30);
    self.segmentControl.centerX = self.view.width / 2;
    self.segmentControl.bottom = view.height;
    [view addSubview:self.bannerView];
    [view addSubview:self.segmentControl];
    self.tableView.tableHeaderView = view;
    view.backgroundColor = RGBCOLOR(226, 226, 226);
    self.tableView.backgroundColor =  RGBCOLOR(226, 226, 226);
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    


}

-(void)firstDidApear{
    [super firstDidApear];
    block_self;
    [self.tableView addInfiniteScrollingWithActionHandler:^{
        
        [bself performSelector:@selector(stop) withObject:bself afterDelay:1];
    }];
}

-(void)stop{
    [self.tableView.infiniteScrollingView stopAnimating];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self.tableView addPullToRefreshWithActionHandler:^{
        //[self.tableView.pullToRefreshView stopAnimating];
    }];

}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    
}

-(void)loadData{
    NSArray *imageUrls = [NSArray arrayWithObjects:@"http://picview01.baomihua.com/photos/20111215/m_14_634595725839531250_35375108.jpg",
                         @"http://i9.topit.me/9/5d/de/1131723464c60de5d9o.jpg", @"http://img3.chinaface.com/original/112a1XZF4HDtEaP0PzJHaqX7t4DoB2.jpg", nil];
    NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity:5];
    for (NSString *urlStr in imageUrls) {
        UIImageView *imageView = [[UIImageView alloc] init];
        [imageView sd_setImageWithURL:[NSURL URLWithString:urlStr]];
        [array addObject:imageView];
    }
    self.bannerImages = [NSArray arrayWithArray:array];
    
    
}


- (void)loadBannerView{
    self.bannerView = [[CycleScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, 200) animationDuration:3];
    self.bannerView.currentPage = ^(NSInteger index){
        
    };
    
    __weak typeof(self) bSelf = self;
    self.bannerView.totalPagesCount = ^NSInteger{
        return 3;
    };
    
    
    self.bannerView.fetchContentViewAtIndex = ^UIView*(NSInteger index){
        UIView *view = [bSelf.bannerImages objectAtIndex:index];
        view.frame = bSelf.bannerView.bounds;
        return view;
    };
    
    block_self;
    self.bannerView.TapActionBlock = ^(NSInteger index){
        ActivityListViewController *vc = [[ActivityListViewController alloc] init];
        [bself.navigationController pushViewController:vc animated:YES];
    };
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 290.0;
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
    cell.selectionStyle = UITableViewCellSelectionStyleDefault;

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    DreamDetailViewController *vc = [[DreamDetailViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
    [self.bannerView.animationTimer pauseTimer];
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    [self.bannerView.animationTimer resumeTimer];
}
@end
