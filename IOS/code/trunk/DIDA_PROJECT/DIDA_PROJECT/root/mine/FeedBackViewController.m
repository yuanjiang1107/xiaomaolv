//
//  FeedBackViewController.m
//  DIDA_PROJECT
//
//  Created by 袁江 on 14/12/3.
//  Copyright (c) 2014年 luojilab.com. All rights reserved.
//

#import "FeedBackViewController.h"

@interface FeedBackViewController ()

@property(nonatomic, strong)UITextField *textInput;

@property(nonatomic, strong)UIButton *submitButton;

@end

@implementation FeedBackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"意见反馈";
    self.textInput = [[UITextField alloc] initForAutoLayout];
    self.submitButton = [UIButton buttonForAutoLayerout];
    
    
    [self.view addSubview:self.textInput];
    [self.view addSubview:self.submitButton];
    
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.textInput
                                                              attribute:NSLayoutAttributeTop
                                                              relatedBy:NSLayoutRelationEqual
                                                                 toItem:self.topLayoutGuide
                                                              attribute:NSLayoutAttributeBottom
                                                             multiplier:1.0
                                                                constant:20]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.textInput
                                                               attribute:NSLayoutAttributeLeft
                                                               relatedBy:NSLayoutRelationEqual
                                                                  toItem:self.view
                                                               attribute:NSLayoutAttributeLeft
                                                              multiplier:1.0
                                                                constant:20]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.textInput
                                                               attribute:NSLayoutAttributeRight
                                                               relatedBy:NSLayoutRelationEqual
                                                                  toItem:self.view
                                                               attribute:NSLayoutAttributeRight
                                                              multiplier:1.0
                                                                constant:-20]];
    [self.textInput addConstraint:[NSLayoutConstraint constraintWithItem:self.textInput
                                                               attribute:NSLayoutAttributeHeight
                                                               relatedBy:NSLayoutRelationEqual
                                                                  toItem:nil
                                                               attribute:NSLayoutAttributeNotAnAttribute
                                                              multiplier:1.0
                                                                constant:200]];
    
    NSDictionary *dict = NSDictionaryOfVariableBindings(_textInput, _submitButton);
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-30-[_submitButton]-30-|"
                                                                    options:0
                                                                    metrics:nil
                                                                       views:dict]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_textInput]-10-[_submitButton(40)]"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:dict]];

    self.textInput.backgroundColor = [UIColor whiteColor];
    self.submitButton.backgroundColor = DIDA_ORANGE_COLOR;
    [self.submitButton setTitle:@"确认提交" forState:UIControlStateNormal];
    [self.submitButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];

    self.textInput.contentVerticalAlignment = UIControlContentVerticalAlignmentTop;
    
    // Do any additional setup after loading the view.
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
