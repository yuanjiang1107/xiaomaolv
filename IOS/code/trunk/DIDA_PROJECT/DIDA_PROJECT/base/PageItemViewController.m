//
//  PageItemViewController.m
//  DIDA_PROJECT
//
//  Created by 袁江 on 14/12/5.
//  Copyright (c) 2014年 luojilab.com. All rights reserved.
//

#import "PageItemViewController.h"
#import "UIImageView+WebCache.h"

@interface PageItemViewController ()

@property(nonatomic, strong)UIImageView *imageView;

@end

@implementation PageItemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, 20)];
    self.imageView.backgroundColor = [UIColor greenColor];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(10, self.view.height - 20, self.view.width - 20, 20)];
    view.backgroundColor = [UIColor redColor];
//    
//    [self.imageView  sd_setImageWithURL:[NSURL URLWithString:@"http://99touxiang.com/public/upload/nvsheng/237/2_111109140942_41.jpg"] placeholderImage:nil
//                              completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
//                                  
//                              }];
    [self.view addSubview:self.imageView];
    [self.view addSubview:view];
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
