//
//  LoginViewController.m
//  DIDA_PROJECT
//
//  Created by 袁江 on 14-9-25.
//  Copyright (c) 2014年 luojilab.com. All rights reserved.
//

#import "LoginViewController.h"
#import "VerifyCodeViewController.h"
#import "WXApi.h"
#import "WeiboSDK.h"
#import "AppDelegate.h"
#import "RTLabel.h"



@interface LoginViewController ()<UITextFieldDelegate, UIScrollViewDelegate>

CREATE_STRONG UIScrollView *scrollView;

CREATE_STRONG UIImageView *logoView;

CREATE_STRONG UIImageView *accountBg;

CREATE_STRONG UITextField *accountField;

CREATE_STRONG UIImageView *passwordBg;

CREATE_STRONG UITextField *passwordField;

CREATE_STRONG UIButton *loginStauseIcon;

CREATE_STRONG RTLabel *findPasswordLb;

CREATE_STRONG UIButton *loginButton;

CREATE_STRONG UIButton *signUpButton;

CREATE_STRONG UIButton *weiboButton;

CREATE_STRONG UIButton *weixinButton;

@end






@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardWillHidden:) name:UIKeyboardWillHideNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardWillChangedFrame:) name:UIKeyboardWillChangeFrameNotification object:nil];

    
    self.scrollView = [[UIScrollView alloc] init];
    S.logoView = [[UIImageView alloc] init];
    S.accountBg = [[UIImageView alloc] init];
    S.accountField = [[UITextField alloc] init];
    S.accountField.backgroundColor = [UIColor whiteColor];
    S.accountField.textAlignment = NSTextAlignmentCenter;
    S.accountField.font = [UIFont systemFontOfSize:16.0f];
    S.accountField.clearButtonMode = UITextFieldViewModeWhileEditing;
    S.passwordBg = [UIImageView new];
    S.passwordField = [UITextField new];
    S.passwordField.backgroundColor = [UIColor whiteColor];
    S.passwordField.textAlignment = NSTextAlignmentCenter;
    S.passwordField.font = [UIFont systemFontOfSize:16.0f];
    S.passwordField.secureTextEntry = YES;
    S.loginStauseIcon = [ViewCreatorHelper createButtonWithTitle:@"保持我的登陆状态"
                                                           frame:CGRectZero
                                                           image:nil
                                                         hlImage:nil
                                                        disImage:nil
                                                          target:self
                                                          action:@selector(changeStatus:)];
    [S.loginStauseIcon setTitleColor:RGBCOLOR(102, 102, 102) forState:UIControlStateNormal];
    S.loginStauseIcon.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    
    
    S.findPasswordLb = [[RTLabel alloc] init];
    S.findPasswordLb.text = @"<a href='find password'>忘记密码</a>";
    S.findPasswordLb.font = [UIFont systemFontOfSize:16.0f];
    S.findPasswordLb.linkAttributes = [NSDictionary dictionaryWithObjectsAndKeys:@"#f68c16", @"color", @"1", @"underline", nil];
    S.findPasswordLb.selectedLinkAttributes = [NSDictionary dictionaryWithObjectsAndKeys:@"#368016", @"color", @"1", @"underline", nil];
    CGSize size = [S.findPasswordLb optimumSize];
    S.findPasswordLb.size = size;

    S.loginButton = [ViewCreatorHelper createButtonWithTitle:@"登录"
                                                       frame:CGRectZero
                                                       image:nil
                                                     hlImage:nil
                                                    disImage:nil
                                                      target:self
                                                      action:@selector(loginEvent:)];
    S.loginButton.backgroundColor = [UIColor whiteColor];
    [S.loginButton setTitleColor:DIDA_TEXT_COLOR forState:UIControlStateNormal];
    
    
    S.signUpButton = [ViewCreatorHelper createButtonWithTitle:@"手机号注册"
                                                        frame:CGRectZero
                                                        image:nil
                                                      hlImage:nil
                                                     disImage:nil
                                                       target:self
                                                       action:@selector(signUpEvent:)];
    S.signUpButton.backgroundColor = DIDA_ORANGE_COLOR;
    
    
    S.weiboButton =  [ViewCreatorHelper createButtonWithTitle:@"微博登录"
                                                        frame:CGRectZero
                                                        image:nil
                                                      hlImage:nil
                                                     disImage:nil
                                                       target:self
                                                       action:@selector(weiboLoginEvent:)];
    S.weiboButton.backgroundColor = [UIColor whiteColor];
    [S.weiboButton setTitleColor:DIDA_TEXT_COLOR forState:UIControlStateNormal];
    
    
    S.weixinButton =  [ViewCreatorHelper createButtonWithTitle:@"微信登录"
                                                         frame:CGRectZero
                                                         image:nil
                                                       hlImage:nil
                                                      disImage:nil
                                                        target:self
                                                        action:@selector(weixinLoginEvent:)];
    S.weixinButton.backgroundColor = [UIColor whiteColor];
    [S.weixinButton setTitleColor:DIDA_TEXT_COLOR forState:UIControlStateNormal];
    
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.delegate = self;
    self.accountField.returnKeyType = UIReturnKeyNext;
    self.passwordField.returnKeyType = UIReturnKeyGo;
    
    self.accountField.keyboardType = UIKeyboardTypeASCIICapable;
    
    S.accountField.delegate = self;
    S.passwordField.delegate = self;
    
    [S.scrollView addSubview:S.logoView];
    [S.scrollView addSubview:S.accountBg];
    [S.scrollView addSubview:S.accountField];
    [S.scrollView addSubview:S.passwordBg];
    [S.scrollView addSubview:S.passwordField];
    [S.scrollView addSubview:S.loginStauseIcon];
    [S.scrollView addSubview:S.findPasswordLb];

    [S.scrollView addSubview:S.signUpButton];
    [S.scrollView addSubview:S.loginButton];
    [S.scrollView addSubview:S.weiboButton];
    [S.scrollView addSubview:S.weixinButton];
    S.accountField.placeholder = @"手机号,用户名,邮箱";
    S.passwordField.placeholder = @"密码";
    self.scrollView.backgroundColor = DIDA_BACKGROUND_COLOR;
    [self.view addSubview:self.scrollView];
    self.scrollView.scrollEnabled = NO;
    
    self.logoView.backgroundColor = [UIColor greenColor];
    UITapGestureRecognizer *ges = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapEvent:)];
    [self.scrollView addGestureRecognizer:ges];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    self.navigationController.navigationBarHidden = YES;
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;

}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    self.scrollView.frame = self.view.bounds;
    float vOffset = 40;
//    float hWidth =
    //self.scrollView.contentSize = CGSizeMake(self.scrollView.width, self.scrollView.height + 1);
    if (IS_SCREEN_35_INCH) {
        //self.scrollView.contentSize = CGSizeMake(self.scrollView.width, self.scrollView.height + 50);
    }else if(IS_SCREEN_4_INCH){
        
    }else if(IS_SCREEN_47_INCH){
        
    }else if(IS_SCREEN_55_INCH){
        
    }
    
    
    
    self.logoView.frame = CGRectMake(100, vOffset, 200, 100);
    self.logoView.centerX = self.view.width / 2;
    self.accountField.frame = CGRectMake(0, 0, self.view.width - 80, 50);
    self.accountField.centerX = self.view.width / 2;
    self.accountField.top = self.logoView.bottom + 30;
    self.accountBg.frame = self.accountField.frame;
    
    self.passwordField.frame = CGRectOffset(self.accountField.frame, 0, 53);
    self.passwordBg.frame = self.passwordField.frame;
    self.loginStauseIcon.frame = CGRectMake(self.passwordField.left, self.passwordField.bottom + 15, 200, 20);
    self.findPasswordLb.centerY = self.loginStauseIcon.centerY;
    self.findPasswordLb.right = self.passwordField.right;
    self.signUpButton.frame = CGRectMake(0, 0, self.passwordField.width - 105, 40);
    self.signUpButton.left = self.passwordField.left;
    self.signUpButton.top = self.loginStauseIcon.bottom + 10;
    
    self.loginButton.frame = CGRectMake(0, 0, 100, 40);
    self.loginButton.right = self.passwordField.right;
    self.loginButton.top = self.signUpButton.top;
    self.weiboButton.frame = CGRectMake(0, 0, self.passwordField.width, 40);
    self.weiboButton.left = self.signUpButton.left;
    self.weiboButton.top = self.signUpButton.bottom + 10;
    self.weixinButton.frame = CGRectOffset(self.weiboButton.frame, 0, 50);
    
    
}

-(void)changeStatus:(UIButton*)button{
    
}

-(void)loginEvent:(UIButton*)button{
    AppDelegate *delegate = [UIApplication sharedApplication].delegate;
    [delegate showRootViewVc];
}

-(void)signUpEvent:(UIButton*)button{
    VerifyCodeViewController *vc = [[VerifyCodeViewController alloc] init];
    self.title = @"登录";
    [self.navigationController pushViewController:vc animated:YES];
}


-(void)weixinLoginEvent:(UIButton*)button{
    BOOL is = [WXApi isWXAppInstalled];
    SendAuthReq *request = [[SendAuthReq alloc] init];
    request.scope = @"snsapi_userinfo" ;
    request.state = @"123" ;
    [WXApi sendReq:request];
    is =  [WXApi sendReq:request];
}

-(void)weiboLoginEvent:(UIButton*)button{
    WBAuthorizeRequest *request = [WBAuthorizeRequest request];
    request.redirectURI =  @"http://www.sina.com";
    request.scope = @"all";
    request.userInfo = @{@"SSO_From": @"LoginViewController",
                         @"Other_Info_1": [NSNumber numberWithInt:123],
                         @"Other_Info_2": @[@"obj1", @"obj2"],
                         @"Other_Info_3": @{@"key1": @"obj1", @"key2": @"obj2"}};
    [WeiboSDK sendRequest:request];

}


-(void)tapEvent:(UIGestureRecognizer*)ges{
    [self.accountField resignFirstResponder];
    [self.passwordField resignFirstResponder];
}


#pragma -mark UITextFieldDelegate


-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    if (textField == self.accountField) {
        [self.passwordField becomeFirstResponder];
    }else if(textField == self.passwordField){
        [textField resignFirstResponder];
    }
    return YES;
}

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    return YES;
}

-(void)textFieldDidEndEditing:(UITextField *)textField{
    if (textField == self.passwordField) {
    }
}

-(void)keyBoardWillShow:(NSNotification*)not{
    //self.scrollView.contentOffset = CGPointMake(0, 258);
    float vOffset = 40;
    if (IS_SCREEN_35_INCH) {
    }else if(IS_SCREEN_4_INCH){
        
    }else if(IS_SCREEN_47_INCH){
        
    }else if(IS_SCREEN_55_INCH){
        
    }
    
    self.scrollView.contentOffset = CGPointMake(0, vOffset);
}

-(void)keyBoardWillHidden:(NSNotification*)not{
    //[self.scrollView scrollsToTop];
    self.scrollView.contentOffset = CGPointMake(0, 0);

}

-(void)keyBoardWillChangedFrame:(NSNotification*)not{
    CGRect beginRect = [[not.userInfo objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue];
    CGRect endRect = [[not.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    CGFloat offset = endRect.origin.y - beginRect.origin.y;
    
}


- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [self.accountField resignFirstResponder];
    [self.passwordField resignFirstResponder];
 
}


@end
