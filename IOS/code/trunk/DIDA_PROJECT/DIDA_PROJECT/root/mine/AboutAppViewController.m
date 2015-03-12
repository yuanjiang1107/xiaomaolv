//
//  AboutAppViewController.m
//  DIDA_PROJECT
//
//  Created by 袁江 on 14-9-29.
//  Copyright (c) 2014年 luojilab.com. All rights reserved.
//

#import "AboutAppViewController.h"

@interface AboutAppViewController ()
CREATE_STRONG UIImageView *logoView;
CREATE_STRONG UILabel *versionLb;
CREATE_STRONG UIButton *evaluateButton;
CREATE_STRONG UIButton *feedbackButton;
CREATE_STRONG UIButton *userProtocol;
CREATE_STRONG UIButton *recruitmentInfo;
CREATE_STRONG UILabel *rigthLb;
@end

@implementation AboutAppViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"关于软件";
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    self.logoView = [UIImageView new];
    self.versionLb = [ViewCreatorHelper createLabelWithTitle:@"版本1.0"
                                                        font:[UIFont systemFontOfSize:18.0]
                                                       frame:CGRectZero
                                                   textColor:[UIColor blackColor]
                                               textAlignment:NSTextAlignmentCenter];
    self.evaluateButton = [ViewCreatorHelper createButtonWithTitle:@"鼓励一下给个好评"
                                                             frame:CGRectZero
                                                             image:nil
                                                           hlImage:nil
                                                          disImage:nil
                                                            target:self
                                                            action:@selector(evaluateEvent:)];
    self.feedbackButton = [ViewCreatorHelper createButtonWithTitle:@"我有意见，我要反馈"
                                                             frame:CGRectZero
                                                             image:nil
                                                           hlImage:nil
                                                          disImage:nil
                                                            target:self
                                                            action:@selector(evaluateEvent:)];
    self.userProtocol = [ViewCreatorHelper createButtonWithTitle:@"用户协议"
                                                           frame:CGRectZero
                                                           image:nil
                                                         hlImage:nil
                                                        disImage:nil
                                                          target:self
                                                          action:@selector(evaluateEvent:)];
    self.recruitmentInfo = [ViewCreatorHelper createButtonWithTitle:@"招聘信息"
                                                              frame:CGRectZero
                                                              image:nil
                                                            hlImage:nil
                                                           disImage:nil
                                                             target:self
                                                             action:@selector(evaluateEvent:)];
    self.rigthLb = [ViewCreatorHelper createLabelWithTitle:@"帮我科技 版权所有\nCopyrigth©2014 bangwo\nAllrigth reserved"
                                       font:[UIFont systemFontOfSize:12.0]
                                      frame:CGRectZero
                                  textColor:[UIColor blackColor]
                              textAlignment:NSTextAlignmentCenter];

    self.rigthLb.numberOfLines = 0;
    [self.view addSubview:self.logoView];
    [self.view addSubview:self.versionLb];
    [self.view addSubview:self.evaluateButton];
    [self.view addSubview:self.feedbackButton];
    [self.view addSubview:self.userProtocol];
    [self.view addSubview:self.recruitmentInfo];
    [self.view addSubview:self.rigthLb];

    self.logoView.backgroundColor = [UIColor redColor];

    self.view.backgroundColor = [UIColor greenColor];
    // Do any additional setup after loading the view.
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    self.logoView.frame = CGRectMake(0, 0, 80, 80);
    self.logoView.top = 30;
    self.logoView.centerX = self.view.width / 2;
    self.versionLb.frame = CGRectMake(0, 0, 200, 20);
    self.versionLb.centerX = self.view.width / 2;
    self.versionLb.top = self.logoView.bottom + 20;
    self.evaluateButton.frame = CGRectMake(0, 0, 200, 40);
    self.evaluateButton.top = self.versionLb.bottom + 40;
    self.evaluateButton.centerX = self.view.width / 2;
    
    self.feedbackButton.frame = CGRectOffset(self.evaluateButton.frame, 0, 50);
    self.userProtocol.frame = CGRectOffset(self.feedbackButton.frame, 0, 50);
    self.recruitmentInfo.frame = CGRectOffset(self.userProtocol.frame, 0, 50);
    
    
    self.rigthLb.frame = CGRectMake(0, 0, 180, 80);
    self.rigthLb.centerX = self.view.width / 2;
    self.rigthLb.bottom = self.view.height;
}


-(void)evaluateEvent:(UIButton*)button{
    
}

-(void)feedbackEvent:(UIButton*)button{
    
}

-(void)userProtocolEvent:(UIButton*)button{
    
}

-(void)recruitmentInfoEvent:(UIButton*)button{
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
