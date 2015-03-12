//
//  FilterContentViewController.h
//  DIDA_PROJECT
//
//  Created by 袁江 on 14/12/17.
//  Copyright (c) 2014年 luojilab.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "filterView.h"

@protocol FilterContentViewControllerDelegate <NSObject>

-(void)didCommitInfo:(BOOL)isCommit info:(NSDictionary*)info;

@end


@interface FilterContentViewController : UIViewController

@property (weak, nonatomic) IBOutlet UISwitch *switch1;


@property(nonatomic, weak)id<FilterContentViewControllerDelegate> dalegate;


@property (weak, nonatomic) IBOutlet UISwitch *switchCrowding;
@property (weak, nonatomic) IBOutlet UISwitch *switchFermale;
@property (weak, nonatomic) IBOutlet UISwitch *switchMale;
@property (weak, nonatomic) IBOutlet UISwitch *switchActivity;
@property (weak, nonatomic) IBOutlet UISwitch *switchDream;

@property (weak, nonatomic) IBOutlet UIButton *commitButton;
@property (weak, nonatomic) IBOutlet UIButton *cancelButton;

- (IBAction)switchCrowdEvent:(id)sender;
- (IBAction)switchFermaleEvent:(id)sender;
- (IBAction)switchMaleEvent:(id)sender;
- (IBAction)switchActivityEvent:(id)sender;
- (IBAction)switchDreamEvent:(id)sender;


- (IBAction)cancelEvent:(id)sender;
- (IBAction)commite:(id)sender;



@end
