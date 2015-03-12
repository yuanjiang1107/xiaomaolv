//
//  ChangePassWordViewController.m
//  DIDA_PROJECT
//
//  Created by 袁江 on 14/12/1.
//  Copyright (c) 2014年 luojilab.com. All rights reserved.
//

#import "ChangePassWordViewController.h"

@interface ChangePassWordViewController ()

@property(nonatomic, strong)UITextField *currentPassword;

@property(nonatomic, strong)UITextField *freshPassword;

@property(nonatomic, strong)UITextField *affirmPassword;

@property(nonatomic, strong)UILabel *lb0;

@property(nonatomic, strong)UILabel *lb1;


@property(nonatomic, strong)UIView *bg;

@property(nonatomic, strong)UIButton *commiteButton;

@property(nonatomic, assign)BOOL identifiedPassword;

@end

@implementation ChangePassWordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.lb0 = [[UILabel alloc] initForAutoLayout];
    self.currentPassword = [[UITextField alloc] initForAutoLayout];
    self.bg = [[UIImageView alloc] initForAutoLayout];
    self.commiteButton = [UIButton button];
    self.commiteButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.bg];

    [self.view addSubview:self.lb0];
    [self.view addSubview:self.currentPassword];
    [self.view addSubview:self.commiteButton];
    
    NSDictionary *dic = NSDictionaryOfVariableBindings(_bg, _lb0, _currentPassword, _commiteButton);
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-30-[_bg]-30-|"
                                                                     options:0
                                                                     metrics:nil
                                                                        views:dic]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-30-[_lb0]-30-|"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:dic]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-50-[_currentPassword]-50-|"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:dic]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-50-[_commiteButton]-50-|"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:dic]];

    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-114-[_bg(100)]"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:dic]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-129-[_lb0]"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:dic]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_lb0]-[_currentPassword(30)]"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:dic]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_bg]-15-[_commiteButton(40)]"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:dic]];
    self.lb0.text = @"请输入当前密码";
    [self.commiteButton setTitle:@"确定" forState:UIControlStateNormal];
    self.bg.backgroundColor = RGBCOLOR(237, 237, 237);
    self.currentPassword.backgroundColor = [UIColor whiteColor];
    self.lb0.textAlignment = NSTextAlignmentCenter;
    self.lb0.font = [UIFont systemFontOfSize:16.0];
    self.lb0.textColor = DIDA_TEXT_COLOR;
    self.currentPassword.secureTextEntry = YES;
    
    [self.commiteButton addTarget:self action:@selector(commiteButtonEvent:) forControlEvents:UIControlEventTouchUpInside];
    // Do any additional setup after loading the view.
}

-(void)commiteButtonEvent:(UIButton*)button{
    
    
    [self loadNewPasswordView];
    self.identifiedPassword = YES;

}

-(void)loadNewPasswordView{
    [self.view removeConstraints:self.view.constraints];

    self.lb1 = [[UILabel alloc] initForAutoLayout];
    self.affirmPassword = [[UITextField alloc] initForAutoLayout];
    [self.view addSubview:self.lb1];
    [self.view addSubview:self.affirmPassword];
    
    NSDictionary *dic = NSDictionaryOfVariableBindings(_bg, _lb0, _currentPassword, _commiteButton, _lb1, _affirmPassword);
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-30-[_bg]-30-|"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:dic]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-30-[_lb0]-30-|"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:dic]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-30-[_lb1]-30-|"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:dic]];

    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-50-[_currentPassword]-50-|"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:dic]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-50-[_affirmPassword]-50-|"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:dic]];

    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-50-[_commiteButton]-50-|"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:dic]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-114-[_bg]"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:dic]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-129-[_lb0]-[_currentPassword(30)]-10-[_lb1]-[_affirmPassword(30)]"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:dic]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.bg
                                                         attribute:NSLayoutAttributeBottom
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self.affirmPassword
                                                         attribute:NSLayoutAttributeBottom
                                                        multiplier:1.0
                                                           constant:20]];
  
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_bg]-15-[_commiteButton(40)]"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:dic]];
    
    self.lb1.text = @"请再输入一次新密码";
    self.lb1.textColor = DIDA_TEXT_COLOR;
    self.lb1.font = [UIFont systemFontOfSize:13.0f];
    self.lb1.textAlignment = NSTextAlignmentCenter;
    [self.view setNeedsUpdateConstraints];
    self.affirmPassword.backgroundColor = [UIColor whiteColor];
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
