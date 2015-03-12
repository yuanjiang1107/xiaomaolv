
//
//  DiDaTabItemViewController.m
//  DIDA_PROJECT
//
//  Created by 袁江 on 14-9-26.
//  Copyright (c) 2014年 luojilab.com. All rights reserved.
//

#import "DiDaTabItemViewController.h"
#import "SearchViewController.h"


@interface DiDaTabItemViewController ()<SearchViewControllerDelegate>

@end

@implementation DiDaTabItemViewController

-(instancetype)initWithTableViewType:(UITableViewStyle)style{
    self = [super initWithTableViewType:style];
    if (self) {
        self.hidesBottomBarWhenPushed = NO;
    }
    return self;
}

-(instancetype)init{
    return [self initWithTableViewType:UITableViewStylePlain];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"search_icon"]
                                                                              style:UIBarButtonItemStylePlain
                                                                             target:self
                                                                             action:@selector(barSearchEvent:)];
    // Do any additional setup after loading the view.
}


-(void)barSearchEvent:(id)sender{
    SearchViewController *vc =[[SearchViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    
    [self.navigationController  setNavigationBarHidden:YES animated:YES];
    vc.delegate = self;
    [self presentViewController:nav animated:NO completion:^{
        
    }];
}

-(void)dismissMe{
    [self dismissViewControllerAnimated:NO completion:^{
        [self.navigationController setNavigationBarHidden:NO animated:YES];
    }];
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
