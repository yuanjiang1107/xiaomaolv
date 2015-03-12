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
@property(nonatomic, strong)NSString *imageUrl;


@end

@implementation PageItemViewController

-(instancetype)initWithImageUrl:(NSString*)imageUrl{
    self = [super init];
    if (self) {
        self.imageUrl = imageUrl;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    self.imageView.centerX = self.view.width / 2;
    self.imageView.centerY = self.view.height / 2;
    
    block_self;
    [self.imageView  sd_setImageWithURL:[NSURL URLWithString:self.imageUrl] placeholderImage:nil
                              completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                                  CGFloat width = image.size.width;
                                  CGFloat height = image.size.height;
                                  if (image.size.width > bself.view.width) {
                                      width = bself.view.width;
                                  }
                                  if (image.size.width > bself.view.width) {
                                      height = bself.view.height;
                                  }
                                  CGFloat coefficientH = width / image.size.width  ;
                                  CGFloat coefficientV = height / image.size.height ;
                                  CGFloat coefficient;
                                  coefficient = (coefficientH < coefficientV) ? coefficientH : coefficientV;
                                
                                  CGRect rect = CGRectMake(0, 0,image.size.width * coefficient, image.size.height * coefficient);
                                  
                                  [UIView animateWithDuration:0.5 animations:^{
                                      bself.imageView.frame = rect;
                                      bself.imageView.centerX = self.view.width / 2;
                                      bself.imageView.centerY = self.view.height / 2;
                                      
                                  }];
                              }];
    [self.view addSubview:self.imageView];
    self.imageView.backgroundColor = [UIColor greenColor];
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
