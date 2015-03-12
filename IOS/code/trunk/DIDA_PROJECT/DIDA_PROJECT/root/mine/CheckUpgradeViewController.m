//
//  CheckUpgradeViewController.m
//  DIDA_PROJECT
//
//  Created by 袁江 on 14-9-29.
//  Copyright (c) 2014年 luojilab.com. All rights reserved.
//

#import "CheckUpgradeViewController.h"

@interface CheckUpgradeViewController ()

CREATE_STRONG UIScrollView *scrollerView;

CREATE_STRONG UIImageView *logoView;
CREATE_STRONG UILabel *versionInfo;
CREATE_STRONG UILabel *upgradeTitle;
CREATE_STRONG UIView  *separateLine;
CREATE_STRONG UILabel *upgradeInfo;

CREATE_STRONG UIButton *upgradeButton;

@end

@implementation CheckUpgradeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.scrollerView = [UIScrollView new];
    self.logoView = [UIImageView new];
    self.versionInfo = [ViewCreatorHelper createLabelWithTitle:@"xxxxxxxxxx"
                                                          font:[UIFont systemFontOfSize:15]
                                                         frame:CGRectZero
                                                     textColor:[UIColor blackColor]
                                                 textAlignment:NSTextAlignmentLeft];
    self.versionInfo.numberOfLines = 0;
    self.upgradeTitle = [ViewCreatorHelper createLabelWithTitle:@"更新信息"
                                                           font:[UIFont systemFontOfSize:18]
                                                          frame:CGRectZero
                                                      textColor:[UIColor blackColor]
                                                  textAlignment:NSTextAlignmentLeft];
    self.separateLine = [UIView new];
    self.separateLine.backgroundColor = [UIColor lightGrayColor];
    self.upgradeInfo =  [ViewCreatorHelper createLabelWithTitle:@"更新内容"
                                                           font:[UIFont systemFontOfSize:15]
                                                          frame:CGRectZero
                                                      textColor:[UIColor blackColor]
                                                  textAlignment:NSTextAlignmentLeft];
    self.upgradeButton = [ViewCreatorHelper createButtonWithTitle:@"下载更新"
                                                            frame:CGRectZero
                                                            image:nil
                                                          hlImage:nil
                                                         disImage:nil
                                                           target:self action:@selector(upgradeEvent:)];
    [self.scrollerView addSubview:self.logoView];
    [self.scrollerView addSubview:self.versionInfo];
    [self.scrollerView addSubview:self.upgradeTitle];
    [self.scrollerView addSubview:self.upgradeInfo];
    [self.scrollerView addSubview:self.upgradeButton];
    [self.view addSubview:self.scrollerView];
    // Do any additional setup after loading the view.
    
    
    self.logoView.backgroundColor = [UIColor greenColor];
    self.upgradeButton.backgroundColor = [UIColor greenColor];
}


-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    self.scrollerView.frame = self.view.bounds;
    self.logoView.frame = CGRectMake(0, 0, 80, 80);
    self.logoView.top = 20;
    self.logoView.left = 20;
    self.versionInfo.frame = CGRectMake(0, 0, 180, 80);
    self.versionInfo.left = self.logoView.right + 10;
    self.versionInfo.top = self.logoView.top;
    self.upgradeTitle.frame = CGRectMake(self.logoView.left, self.logoView.bottom + 20, 100, 20);
    self.separateLine.frame = CGRectMake(self.logoView.left, self.upgradeTitle.bottom + 10, self.view.width - 40, 2);
    
    CGFloat height = 300;
    self.upgradeInfo.frame = CGRectMake(self.logoView.left, self.separateLine.bottom + 10, self.separateLine.width, height);
    
    self.upgradeButton.frame = CGRectMake(0, 0, 200, 40);
    self.upgradeButton.centerX = self.view.width / 2;
    self.upgradeButton.top = self.upgradeInfo.bottom + 20;
    self.scrollerView.contentSize = CGSizeMake(self.scrollerView.width, self.upgradeButton.bottom + 20);

}


-(void)upgradeEvent:(UIButton*)button{
    
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
