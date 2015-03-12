//
//  FilterContentViewController.m
//  DIDA_PROJECT
//
//  Created by 袁江 on 14/12/17.
//  Copyright (c) 2014年 luojilab.com. All rights reserved.
//

#import "FilterContentViewController.h"
#import "filterView.h"

@interface FilterContentViewController ()


@end

@implementation FilterContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.switchActivity.on = NO;
    self.switchCrowding.on = NO;
    self.switchFermale.on = NO;
    self.switchMale.on = NO;
    self.switchDream.on = NO;
    
    self.commitButton.backgroundColor = DIDA_BACKGROUND_COLOR;
    self.cancelButton.backgroundColor = DIDA_BACKGROUND_COLOR;
    self.commitButton.layer.shadowOpacity = 0.5;
    self.commitButton.layer.shadowOffset = CGSizeMake(0, 2);
    self.cancelButton.layer.shadowOpacity = 0.5;
    self.cancelButton.layer.shadowOffset = CGSizeMake(0, 2);

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/



- (IBAction)switchCrowdEvent:(id)sender {
}

- (IBAction)switchFermaleEvent:(id)sender {
}

- (IBAction)switchMaleEvent:(id)sender {
}

- (IBAction)switchActivityEvent:(id)sender {
}

- (IBAction)switchDreamEvent:(id)sender {
}

- (IBAction)cancelEvent:(id)sender {
    [self.dalegate didCommitInfo:NO info:nil];
}

- (IBAction)commite:(id)sender {
    [self.dalegate didCommitInfo:YES info:nil];
}
@end
