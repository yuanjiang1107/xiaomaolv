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
#import "FeedCell.h"
#import "CommentListViewController.h"
#import "Feed.h"
#import "PlaceholderTextView.h"


typedef NS_ENUM(NSInteger, HomeDataSource) {
    HomeDataSourceActivityAndDream,
    HomeDataSourceFeed
};

@interface HomeTabItemViewController ()<FeedCommentDelegate, UITextViewDelegate>

CREATE_STRONG CycleScrollView *bannerView;

CREATE_STRONG DiDaSegmentControl *segmentControl;

CREATE_STRONG NSArray *bannerImages;


CREATE_ASSIGN HomeDataSource dataSource;

CREATE_STRONG NSFetchedResultsController *feedFetchedResultsController;

CREATE_STRONG UIView *inputTool;

CREATE_STRONG PlaceholderTextView *inputTextView;

@end

@implementation HomeTabItemViewController

-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(void)viewDidLoad{
    self.dataSource = HomeDataSourceFeed;
    [super viewDidLoad];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboarFrameWillChangedNotification:) name:UIKeyboardWillChangeFrameNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidHiddenNotification:) name:UIKeyboardDidHideNotification object:nil];
    
    
    self.feedFetchedResultsController = [Feed MR_fetchAllGroupedBy:nil
                                                     withPredicate:nil
                                                          sortedBy:nil
                                                         ascending:YES];
    self.feedFetchedResultsController.delegate = self;
    
    self.fetchController = self.feedFetchedResultsController;

    [self loadData];
    [self loadBannerView];
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, 250)];
    __weak typeof(self) bSelf = self;
    self.segmentControl = [[DiDaSegmentControl alloc] initWithTitle:@[@"众筹游学", @"消息动态"] currentIndex:1 eventCallBack:^(BOOL selected, NSInteger selectedIndex) {
        if (selectedIndex == 1) {
            bSelf.dataSource = HomeDataSourceFeed;
            bSelf.fetchController = self.feedFetchedResultsController;
        }else{
            bSelf.dataSource = HomeDataSourceActivityAndDream;
        }
        [bSelf.tableView reloadData];

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
    self.tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

-(void)firstDidApear{
    [super firstDidApear];
    block_self;
//    [self.tableView addInfiniteScrollingWithActionHandler:^{
//        
//        [bself performSelector:@selector(stop) withObject:bself afterDelay:1];
//    }];
}

-(void)stop{
    [self.tableView.infiniteScrollingView stopAnimating];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
//    [self.tableView addPullToRefreshWithActionHandler:^{
//        //[self.tableView.pullToRefreshView stopAnimating];
//    }];

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
    
//    [[DataEngine sharedInstance] getRecommendListWithOnComplete:^(NSDictionary *sourceDic, NSInteger errorCode, NSString *errorMsg, BOOL hasMore, id otherData) {
//        NSMutableArray *mArray = [[NSMutableArray alloc] initWithCapacity:5];
//        for (NSDictionary *item in sourceDic) {
//            NSString *imageUrlStr = [item objectForKey:@"pic"];
//            UIImageView *imageView = [[UIImageView alloc] init];
//            [imageView sd_setImageWithURL:[NSURL URLWithString:imageUrlStr]];
//            [mArray addObject:imageView];
//        }
//        self.bannerImages = [NSArray arrayWithArray:mArray];
//        __weak typeof(self) bSelf = self;
//        self.bannerView.totalPagesCount = ^NSInteger{
//            return bSelf.bannerImages.count;
//        };
//
//    }];
        [[DataEngine sharedInstance] getFeedListOnComplete:^(NSDictionary *sourceDic, NSInteger errorCode, NSString *errorMsg, BOOL hasMore, id otherData) {
            
        }];
}


- (void)loadBannerView{
    self.bannerView = [[CycleScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, 200) animationDuration:3];
    self.bannerView.currentPage = ^(NSInteger index){
        
    };
    
    __weak typeof(self) bSelf = self;
    self.bannerView.totalPagesCount = ^NSInteger{
        NSInteger count = bSelf.bannerImages.count;
        return count;
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
    if (self.dataSource == HomeDataSourceFeed) {
        return self.feedFetchedResultsController.fetchedObjects.count;
    }
    return 5;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (self.dataSource == HomeDataSourceFeed) {
        return 10;
    }else{
        return 0;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.dataSource == HomeDataSourceFeed) {
        Feed *feed = [self.feedFetchedResultsController objectAtIndexPath:indexPath];
       return [FeedCell heightForClassCellWidth:feed position:0];
    }
    return 290.0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    if (self.dataSource == HomeDataSourceFeed) {
        Class obj_class = [self cellClassForRowAtIndexPath:indexPath];
        
        FeedCell *cell = [tableView dequeueReusableCellWithIdentifier:[self reusableIdentifierWithClass:obj_class]];
        if (cell == nil) {
            cell = [[obj_class alloc] initWithStyle:[self DiDaTableViewCellStyle] reuseIdentifier:[self reusableIdentifierWithClass:obj_class]];
            cell.ancestorsTableviewController = self;
        }
        Feed *feedInfo = (Feed*)([self.fetchController objectAtIndexPath:indexPath]);
        [cell fillCommentList:feedInfo.commentList];
        [cell configCellWithData:feedInfo position:0];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    
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


-(NSArray*)sortArray:(NSSet*)set{
    if (set.count == 0) {
        return nil;
    }
    NSArray *array = [set allObjects];
    NSSortDescriptor *dpr = [NSSortDescriptor sortDescriptorWithKey:@"fromName" ascending:YES];
    NSArray *array2 = [array sortedArrayUsingDescriptors:@[dpr]];
    return [NSArray arrayWithArray:array2];
}

-(Class)cellClassForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.dataSource == HomeDataSourceFeed)
        return [FeedCell class];
    return [super cellClassForRowAtIndexPath:indexPath];
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.dataSource == HomeDataSourceFeed) {
        return;
    }
    
    DreamDetailViewController *vc = [[DreamDetailViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
    [self.bannerView.animationTimer pauseTimer];
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    [self.bannerView.animationTimer resumeTimer];
}

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller{
    if (self.fetchController == self.feedFetchedResultsController && self.dataSource == HomeDataSourceFeed) {
        [self.tableView reloadData];
    }
}


- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    if (scrollView == self.inputTextView ) {
        return;
    }
    NSLog(@"scroll by code");
    if ([self.inputTool isDescendantOfView:self.view]) {
        return;
    }
    self.inputTextView = [[PlaceholderTextView alloc] initWithFrame:CGRectMake(0, 0, [UIDevice screenWidth] - 220, 10)];
    self.inputTextView.frame = CGRectMake(10, 0, [UIDevice screenWidth] - 220, [self heightForInputTextView:@"text"]);
    
    self.inputTool = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIDevice screenWidth], self.inputTextView.height + 8)];

    
    self.inputTextView.centerY  = self.inputTool.height / 2;
    self.inputTextView.backgroundColor = [UIColor greenColor];
    self.inputTextView.returnKeyType = UIReturnKeySend;
    [self.inputTool addSubview:self.inputTextView];
    self.inputTool.backgroundColor = [UIColor redColor];
    self.inputTextView.scrollEnabled = NO;
    self.inputTextView.placeholder = @"回复懂大卫";
    self.inputTool.bottom = self.view.height;
    
    [self.view addSubview:self.inputTool];
    [self.inputTextView becomeFirstResponder];
    self.inputTextView.delegate = self;
    
}



#pragma -mark 动态回复

-(void)showCommentInpute:(UITableViewCell *)cell withData:(id)data toUserId:(NSInteger)toUserId toUserName:(NSString *)userName{
    if ([self.inputTool isDescendantOfView:self.view]) {
        [self.view endEditing:YES];
    }
    
    NSIndexPath *path = [self.tableView  indexPathForCell:cell];
    [self.tableView scrollToRowAtIndexPath:path atScrollPosition:UITableViewScrollPositionBottom animated:YES];
    
    
    
}

-(void)keyboarFrameWillChangedNotification:(NSNotification*)not{
    NSDictionary *info = not.userInfo;
    CGRect rect = [[info objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    NSTimeInterval time = [[info objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];
    NSInteger options = [[info objectForKey:UIKeyboardAnimationCurveUserInfoKey] integerValue];
    
    CGRect rect1 = [[UIApplication sharedApplication].keyWindow convertRect:rect toView:self.view];
    [self changeContentFrame:rect1.origin.y keyboardHeight:rect.size.height  duration:time options:options];
}

-(void)keyboardDidHiddenNotification:(NSNotification*)not{
//    [self.inputTool removeFromSuperview];
}

-(void)changeContentFrame:(CGFloat)offset keyboardHeight:(CGFloat)height duration:(NSTimeInterval)duration options:(NSInteger)options{
    //position bottomTool
  
    
    if (offset == self.view.height){
        //        return;
        [UIView beginAnimations:@"commentAM" context:@"xxxx"];
        [UIView setAnimationBeginsFromCurrentState:YES];
        [UIView setAnimationDuration:duration];
        [UIView setAnimationCurve:options];
        [UIView setAnimationDelegate:self];
        self.inputTool.bottom = offset;
        [UIView setAnimationDidStopSelector:@selector(animationDidStop:finished:context:)];
        [UIView commitAnimations];

//        self.tableView.contentOffset = CGPointMake(self.tableView.contentOffset.x, self.tableView.contentOffset.y - height + 49 - self.inputTool.height);
        return;
    }else{
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationBeginsFromCurrentState:YES];
        [UIView setAnimationDuration:duration];
        [UIView setAnimationCurve:options];
//        [UIView setAnimationDelegate:self];
        self.inputTool.bottom = offset;
//        [UIView setAnimationDidStopSelector:@selector(animationDidStop:finished:context:)];
        [UIView commitAnimations];
        self.tableView.contentOffset = CGPointMake(self.tableView.contentOffset.x, self.tableView.contentOffset.y + height - 49 + self.inputTool.height);
    }
}

-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    
    if ([text isEqualToString:@"\n"]) {
        [self.inputTextView resignFirstResponder];
    }
    return YES;
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
//    NSLog(@"xxxxxx%fXXXXXXX", scrollView.contentOffset.y);
}

-(void)textViewDidChange:(UITextView *)textView{
    CGFloat height = [self heightForInputTextView:textView.text];
    [self adjustTextViewHeight:height];

}

-(CGFloat)heightForInputTextView:(NSString*)text{
    CGFloat fw = self.inputTextView.frame.size.width;
    CGSize maxContentSize = CGSizeMake(fw, INFINITY);
    CGSize size = [self.inputTextView sizeThatFits:maxContentSize];
    return size.height;
}


-(void)adjustTextViewHeight:(CGFloat)height{
    CGFloat bottom = self.inputTool.bottom;
    self.inputTool.height = height + 8;
    self.inputTextView.height = height;
    self.inputTextView.centerY = self.inputTool.height / 2;
    self.inputTool.bottom = bottom;
}

-(void)animationDidStop:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context{
    [self.inputTool removeFromSuperview];
}

@end


