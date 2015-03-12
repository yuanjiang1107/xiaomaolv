//
//  VerifyCodeViewController.m
//  DIDA_PROJECT
//
//  Created by 袁江 on 14-9-25.
//  Copyright (c) 2014年 luojilab.com. All rights reserved.
//

#import "VerifyCodeViewController.h"
#import "FillRegistInfoViewController.h"


@interface VerifyCodeViewController ()

CREATE_STRONG UILabel *tipLab;

CREATE_STRONG UIImageView *bgView;

CREATE_STRONG UILabel *prefixLb;

CREATE_STRONG UITextField *textField;

CREATE_STRONG UIButton *requstButton;

CREATE_STRONG UITextField *codeTextField;

CREATE_STRONG UIButton *commiteButton;

@end

@implementation VerifyCodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"验证";
    
    self.tipLab = [ViewCreatorHelper createLabelWithTitle:@"请输入注册手机号："
                                                     font:[UIFont systemFontOfSize:16]
                                                    frame:CGRectMake(0, 0, 200, 20)
                                                textColor:[UIColor blackColor]
                                            textAlignment:NSTextAlignmentLeft];
    self.bgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 280, 40)];
    
    self.textField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 150, 20)];
    self.textField.placeholder = @"输入手机号";
    self.prefixLb = [ViewCreatorHelper createLabelWithTitle:@"+86"
                                                       font:[UIFont systemFontOfSize:15]
                                                      frame:CGRectMake(0, 0, 30, 20)
                                                  textColor:[UIColor grayColor]
                                              textAlignment:NSTextAlignmentLeft];
    self.requstButton = [ViewCreatorHelper createButtonWithTitle:@"获取验证码"
                                                           frame:CGRectMake(0, 0, 100, 40)
                                                           image:nil
                                                         hlImage:nil
                                                        disImage:nil
                                                          target:self
                                                          action:@selector(requstEvent:)];
    
    self.codeTextField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 100, 20)];
    self.codeTextField.placeholder = @"请输入验证码";
    self.commiteButton = [ViewCreatorHelper createButtonWithTitle:@"确认"
                                                            frame:CGRectMake(0, 0, 100, 40)
                                                            image:nil
                                                          hlImage:nil
                                                         disImage:nil
                                                           target:self
                                                           action:@selector(commiteEvent:)];
    self.bgView.userInteractionEnabled = YES;
    [self.view addSubview:self.tipLab];
    
    self.textField.left = self.prefixLb.right + 5;
    self.requstButton.left = self.textField.right + 5;
    self.textField.font = [UIFont systemFontOfSize:15];
    self.codeTextField.font = [UIFont systemFontOfSize:15];
    [self.bgView addSubview:self.prefixLb];
    [self.bgView addSubview:self.textField];
    [self.bgView addSubview:self.requstButton];
    
    
    [self.view addSubview:self.bgView];
    [self.view addSubview:self.codeTextField];
    [self.view  addSubview:self.commiteButton];
    
    
#warning test
    self.bgView.backgroundColor = [UIColor greenColor];
    self.commiteButton.backgroundColor = [UIColor redColor];
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];

}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];

}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    //self.navigationController.navigationBarHidden = YES;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    self.tipLab.left = 20;
    self.tipLab.top = 100;
    self.bgView.left = self.tipLab.left;
    self.bgView.top = self.tipLab.bottom + 5;
    self.codeTextField.left = 100;
    self.codeTextField.top = self.bgView.bottom + 10;
    self.commiteButton.top = self.codeTextField.top;
    self.commiteButton.left = self.codeTextField.right + 10;
}

-(void)requstEvent:(UIButton*)button{
    
}

-(void)commiteEvent:(UIButton*)button{
    FillRegistInfoViewController *vc = [[FillRegistInfoViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
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
