//
//  RootTabBarViewController.m
//  DIDA_PROJECT
//
//  Created by 袁江 on 14-9-25.
//  Copyright (c) 2014年 luojilab.com. All rights reserved.
//

#import "RootTabBarViewController.h"
#import "HomeTabItemViewController.h"
#import "DreamTabItemViewController.h"
#import "TravelsTabItemViewController.h"
#import "SquareTabItemViewController.h"
#import "MineTabItemViewController.h"
#import "DiDaNavigationController.h"
#import "MessageViewController.h"

@interface RootTabBarViewController ()

CREATE_STRONG UITabBarController *rootTabVc;

@end



@implementation RootTabBarViewController

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.rootTabVc  = [[UITabBarController alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIViewController *vcI = [[HomeTabItemViewController alloc] initWithTableViewType:UITableViewStylePlain];
    UIViewController *vcII = [[DreamTabItemViewController alloc] init];
    UIViewController *vcIII = [[TravelsTabItemViewController alloc] init];
    UIViewController *vcIV = [[SquareTabItemViewController alloc] init];
    UIViewController *vcV = [[MineTabItemViewController alloc] init];
    UIViewController *vcVI = [[MessageViewController alloc] init];
    UINavigationController *navI = [[DiDaNavigationController alloc] initWithRootViewController:vcI];
    UINavigationController *navII = [[DiDaNavigationController alloc] initWithRootViewController:vcII];
    UINavigationController *navIII = [[DiDaNavigationController alloc] initWithRootViewController:vcIII];
    UINavigationController *navIV = [[DiDaNavigationController alloc] initWithRootViewController:vcIV];
    UINavigationController *navV = [[DiDaNavigationController alloc] initWithRootViewController:vcV];
    UINavigationController *navVI = [[DiDaNavigationController alloc] initWithRootViewController:vcVI];
//    vcI.hidesBottomBarWhenPushed = NO;
//    vcII.hidesBottomBarWhenPushed = NO;
//    vcIII.hidesBottomBarWhenPushed = NO;
//    vcIV.hidesBottomBarWhenPushed = NO;
//    vcV.hidesBottomBarWhenPushed = NO;
    vcI.title = @"首页";
    vcII.title = @"梦想";
    vcIII.title = @"游记";
    vcIV.title = @"广场";
    vcV.title = @"我";
    
//    UIImage *image = [UIImage imageNamed:@"ios-icon-首页A.png"];
    
    navI.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"首页"
                                                    image:[UIImage imageNamed:@"ios-icon-首页A.png"]
                                            selectedImage:[UIImage imageNamed:@"ios-icon-首页B.png"]];
    
    navII.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"计划" image:[UIImage imageNamed:@"ios-icon-计划A.png"]
                                             selectedImage:[UIImage imageNamed:@"ios-icon-计划B.png"]];
    navIII.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"游记" image:[UIImage imageNamed:@"ios-icon-游记A.png"]
                                              selectedImage:[UIImage imageNamed:@"ios-icon-游记B.png"]];
    navIV.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"广场" image:[UIImage imageNamed:@"ios-icon-广场A.png"]
                                             selectedImage:[UIImage imageNamed:@"ios-icon-广场B.png"]];
    navV.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"我" image:[UIImage imageNamed:@"ios-icon-我的A.png"]
                                            selectedImage:[UIImage imageNamed:@"ios-icon-我的B.png"]];
    navVI.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"我" image:[UIImage imageNamed:@"ios-icon-消息A.png"]
                                            selectedImage:[UIImage imageNamed:@"ios-icon-消息B.png"]];

    
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor], NSForegroundColorAttributeName, nil];
    
    [navI.tabBarItem setTitleTextAttributes:dict forState:UIControlStateNormal];
    [navII.tabBarItem setTitleTextAttributes:dict forState:UIControlStateNormal];
    [navIII.tabBarItem setTitleTextAttributes:dict forState:UIControlStateNormal];
    [navIV.tabBarItem setTitleTextAttributes:dict forState:UIControlStateNormal];
    [navV.tabBarItem setTitleTextAttributes:dict forState:UIControlStateNormal];
    [navVI.tabBarItem setTitleTextAttributes:dict forState:UIControlStateNormal];
    
    [self setViewControllers:@[navI, navII, navVI, navIV, navV] animated:YES];
    self.tabBar.tintColor = DIDA_ORANGE_COLOR;
    self.tabBar.barTintColor = DIDA_NAVIGATIONBAR_COLOR;
    self.tabBar.translucent = YES;
    
    self.selectedIndex = 4;
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
