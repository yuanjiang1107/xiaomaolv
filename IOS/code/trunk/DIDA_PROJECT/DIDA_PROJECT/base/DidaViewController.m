//
//  DidaViewController.m
//  DIDA_PROJECT
//
//  Created by 袁江 on 14-9-25.
//  Copyright (c) 2014年 luojilab.com. All rights reserved.
//

#import "DidaViewController.h"

@interface DidaViewController ()

@property(nonatomic, assign)BOOL willAppear;
@property(nonatomic, assign)BOOL didAppear;
@property(nonatomic, assign)BOOL didLayoutSubViews;

@end

@implementation DidaViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = DIDA_BACKGROUND_COLOR;
    //self.navigationController.navigationBar.barTintColor = [UIColor greenColor];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if (self.willAppear == NO) {
        [self firstWillApear];
        self.willAppear = YES;
    }
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    if (self.didAppear == NO) {
        [self firstDidApear];
        self.didAppear = YES;
    }
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    if (self.didLayoutSubViews == NO) {
        [self firstDidLayoutSubViews];
        self.didLayoutSubViews = YES;
    }
}

-(void)firstDidApear{
    
}

-(void)firstWillApear{
    
}

-(void)firstDidLayoutSubViews{
    
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
