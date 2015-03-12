//
//  DiDaImagesViewController.m
//  DIDA_PROJECT
//
//  Created by 袁江 on 14/12/5.
//  Copyright (c) 2014年 luojilab.com. All rights reserved.
//

#import "DiDaImagesViewController.h"
#import "PageItemViewController.h"


@interface DiDaImagesViewController ()<UIPageViewControllerDataSource, UIPageViewControllerDelegate>

@end

@implementation DiDaImagesViewController

-(instancetype)init{
    self = [super initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    if (self) {
        self.edgesForExtendedLayout = UIRectEdgeTop;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.delegate = self;
    self.dataSource = self;
    
    PageItemViewController *vc = [[PageItemViewController alloc] init];
    vc.view.backgroundColor = [UIColor blueColor];
    
    [self setViewControllers:@[vc] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:^(BOOL finished) {
        
    }];
    // Do any additional setup after loading the view.
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController{
    PageItemViewController *vc = [[PageItemViewController alloc] init];
    return vc;
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController{
    PageItemViewController *vc = [[PageItemViewController alloc] init];
    return vc;
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
