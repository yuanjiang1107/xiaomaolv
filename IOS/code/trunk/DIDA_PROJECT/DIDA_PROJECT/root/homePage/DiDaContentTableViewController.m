//
//  DiDaContentTableViewController.m
//  DIDA_PROJECT
//
//  Created by 袁江 on 14/11/19.
//  Copyright (c) 2014年 luojilab.com. All rights reserved.
//

#import "DiDaContentTableViewController.h"
#import "ContentViewToolBar.h"
#import "CatalogView.h"

#define contentTableViewTag  11011011
#define catalogViewTag  11011012


@interface DiDaContentTableViewController ()

@property(nonatomic, strong)UIButton *contentsTableButton;

@property(nonatomic, assign)BOOL showingCatalog;

@property(nonatomic, assign)BOOL showingTool;
@end

@implementation DiDaContentTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.contentsTableButton = [ViewCreatorHelper createAutoLayoutButton:nil
                                                              normaImage:nil
                                                          highlitedImage:nil
                                                            disableImage:nil
                                                                  target:self
                                                                  action:@selector(contentsTableButtonEvent:)];
    self.contentsTableButton.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.contentsTableButton];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"目录"
                                                                              style:UIBarButtonItemStyleDone
                                                                             target:self
                                                                             action:@selector(rightItemEvent:)];
    
}



-(void)rightItemEvent:(id)sender{
    if (self.showingCatalog == NO) {
        [self showCatalog];
    }else{
        [self hiddenCatalog];
    }
}


-(void)showCatalog{
    CatalogView *catalogView = [[CatalogView alloc] initWithList:@[@"发布人信息", @"梦想摘要", @"梦想详情", @"回报方案", @"主人动态"]];
    catalogView.frame = CGRectMake(0, 64, self.view.width, self.view.height - 64);
    catalogView.delegate = self;
    catalogView.tag = catalogViewTag;
    [self.view  addSubview:catalogView];
    self.showingCatalog = YES;
}

-(void)hiddenCatalog{
    CatalogView *catalogView = (CatalogView*)[self.view viewWithTag:catalogViewTag];
    if (catalogView && [catalogView isDescendantOfView:self.view]) {
        [catalogView fold];
    }
}

-(void)catalogDidFolded{
    CatalogView *catalogView = (CatalogView*)[self.view viewWithTag:catalogViewTag];
    [catalogView removeFromSuperview];
    self.showingCatalog = NO;
}



-(void)contentsTableButtonEvent:(UIButton*)sender{
    if (self.showingTool == NO) {
        [self showContentTable];
    }else{
        [self hiddenContentTable];
    }
}

-(void)showContentTable{
    ContentViewToolBar *view = [ContentViewToolBar new];
    view.delegate = self;
    view.frame = CGRectMake(0, 0, 100, 240);
    view.layer.cornerRadius = 5;
    view.clipsToBounds = YES;
    view.tag = contentTableViewTag;
    view.bottom = self.contentsTableButton.top;
    view.right = self.view.width;
    
    
    [UIView animateKeyframesWithDuration:0.15
                                   delay:0.0
                                 options:UIViewKeyframeAnimationOptionCalculationModeLinear
                              animations:^{
                                  self.contentsTableButton.transform =  CGAffineTransformMakeRotation(90 * (M_PI / 180.0f));
                                  
                              } completion:^(BOOL finished) {
                                  self.showingTool = YES;
                              }];
    
    [self.view addSubview:view];
}

-(void)hiddenContentTable{
    UIView *view = [self.view viewWithTag:contentTableViewTag];
    ContentViewToolBar *contentView = (ContentViewToolBar*)view;
    [contentView fold];
    
    [UIView animateKeyframesWithDuration:0.15
                                   delay:0.0
                                 options:UIViewKeyframeAnimationOptionCalculationModeLinear
                              animations:^{
                                  self.contentsTableButton.transform =  CGAffineTransformMakeRotation(0 * (M_PI / 180.0f));
                                  
                              } completion:^(BOOL finished) {
                                  
                              }];
    
    //    [UIView animateKeyframesWithDuration:0.4
    //                                   delay:0.01
    //                                 options:UIViewKeyframeAnimationOptionCalculationModeLinear
    //                              animations:^{
    //                                  view.left = self.view.width;
    //                              } completion:^(BOOL finished) {
//    [self performSelector:@selector(removeContentTabdle) withObject:self afterDelay:1];
    //                              }];
    
}

-(void)contentViewDidFold{
    UIView *view = [self.view viewWithTag:contentTableViewTag];
    [view removeFromSuperview];
    self.showingTool = NO;
}




-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.view bringSubviewToFront:self.contentsTableButton];
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    self.contentsTableButton.frame = CGRectMake(self.view.width - 60, self.view.height - 60, 40, 40);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
