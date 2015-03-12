////
////  DreamDetailViewController.m
////  DIDA_PROJECT
////
////  Created by 袁江 on 14-10-23.
////  Copyright (c) 2014年 luojilab.com. All rights reserved.
////
//
//#import "DreamDetailViewController.h"
//#import "UIView+AutoLayout.h"
//#import "RTLabel.h"
//#import "TableOfContentsView.h"
//
//#define contentTableViewTag  11011011
//
//@interface DreamDetailViewController ()
//@property(nonatomic, strong)UIScrollView *scrollView;
//@property(nonatomic, strong)UILabel *titleLb;
//@property(nonatomic, strong)UIButton *button;
//
//@property(nonatomic, strong)RTLabel *rtLab;
//
//@property(nonatomic, strong)UILabel *lab1;
//
//
//
//
//@property(nonatomic, strong)UIButton *contentsTableButton;
//
//
//@end
//
//@implementation DreamDetailViewController
//
//-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
//    self =  [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//    self.hidesBottomBarWhenPushed = YES;
//    return self;
//}
//
//- (void)viewDidLoad {
//    [super viewDidLoad];
//    self.scrollView = [UIScrollView new];
//    [self.view addSubview:self.scrollView];
//    [self.scrollView setTranslatesAutoresizingMaskIntoConstraints:NO];
//    self.titleLb = [UILabel new];
//    [self.titleLb setTranslatesAutoresizingMaskIntoConstraints:NO];
//    [self.view addSubview:self.titleLb];
//    self.titleLb.text = @"xxxxxxxxxfafaf";
//    self.button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    [self.button setTranslatesAutoresizingMaskIntoConstraints:NO];
//    [self.view addSubview:self.button];
//    [self.button setTitle:@"button" forState:UIControlStateNormal];
//    // Do any additional setup after loading the view.
//    
//
//    
//    [self.scrollView addSubview:self.titleLb];
//    [self.scrollView addSubview:self.button];
//    
//    
//    self.contentsTableButton = [ViewCreatorHelper createAutoLayoutButton:nil
//                                                              normaImage:nil
//                                                          highlitedImage:nil
//                                                            disableImage:nil
//                                                                  target:self
//                                                                  action:@selector(contentsTableButtonEvent:)];
//    self.contentsTableButton.backgroundColor = [UIColor redColor];
//    [self.view addSubview:self.contentsTableButton];
//    
//    [self addConstraint];
//    
//    
//}
//
//-(void)addConstraint{
//    UIImageView *imageView;
//    NSDictionary *viewsDictionary;
//    
//    self.scrollView.backgroundColor = [UIColor blueColor];
//    // Create the scroll view and the image view.
//    imageView = [[UIImageView alloc] init];
//    
//    // Add an image to the image view.
//    imageView.backgroundColor = [UIColor greenColor];
//
//    
//    // Add the image view to the scroll view.
//    [self.scrollView addSubview:imageView];
//    // Set the translatesAutoresizingMaskIntoConstraints to NO so that the views autoresizing mask is not translated into auto layout constraints.
//    self.scrollView.translatesAutoresizingMaskIntoConstraints  = NO;
//    imageView.translatesAutoresizingMaskIntoConstraints = NO;
//    
//    // Set the constraints for the scroll view and the image view.
//    viewsDictionary = NSDictionaryOfVariableBindings(_scrollView, imageView);
//    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_scrollView]|" options:0 metrics: 0 views:viewsDictionary]];
//    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_scrollView]|" options:0 metrics: 0 views:viewsDictionary]];
//    [self.scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[imageView]|" options:0 metrics: 0 views:viewsDictionary]];
//    [self.scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[imageView]|" options:0 metrics: 0 views:viewsDictionary]];
//    
//    
//    
//    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:_titleLb
//                                                         attribute:NSLayoutAttributeTop
//                                                         relatedBy:NSLayoutRelationEqual
//                                                            toItem:self.scrollView
//                                                         attribute:NSLayoutAttributeTopMargin
//                                                        multiplier:1.0
//                                                          constant:0]];
//    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:_titleLb
//                                                         attribute:NSLayoutAttributeLeading
//                                                         relatedBy:NSLayoutRelationEqual
//                                                            toItem:self.scrollView
//                                                         attribute:NSLayoutAttributeLeading
//                                                        multiplier:1.0
//                                                          constant:0]];
//    
//    
//    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:_button
//                                                               attribute:NSLayoutAttributeTop
//                                                               relatedBy:NSLayoutRelationEqual
//                                                                  toItem:_titleLb
//                                                               attribute:NSLayoutAttributeBottom
//                                                              multiplier:1.0
//                                                                constant:700]];
//    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:_button
//                                                                attribute:NSLayoutAttributeLeading
//                                                                relatedBy:NSLayoutRelationEqual
//                                                                   toItem:self.scrollView
//                                                                attribute:NSLayoutAttributeLeading
//                                                               multiplier:1.0
//                                                                 constant:0]];
//
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_scrollView
//                                                         attribute:NSLayoutAttributeBottom
//                                                         relatedBy:NSLayoutRelationEqual
//                                                            toItem:_button
//                                                         attribute:NSLayoutAttributeBottom
//                                                        multiplier:1.0
//                                                           constant:0]];
//    
//    
//    
//    _lab1 = [UILabel new];
//    _lab1.text = @"觉得垃圾啊记得啦DJ阿风老大";
//    _lab1.translatesAutoresizingMaskIntoConstraints = NO;
//    _lab1.numberOfLines = 0;
//    [self.scrollView addSubview:_lab1];
//    
//    
//    
//    self.rtLab = [[RTLabel alloc] initWithFrame:CGRectMake(0, 0, 320, 10)];
//    [self.rtLab setParagraphReplacement:@""];
//    self.rtLab.text = @"clickable link - <a href='http://store.apple.com'>link to apple store</a> <a href='http://www.google.com'>link to google</a> <a href='http://www.yahoo.com'>link to yahoo</a> <a href='https://github.com/honcheng/RTLabel'>link to RTLabel in GitHub</a> <a href='http://www.wiki.com'>link to wiki.com website</a>" ;
//    self.rtLab.translatesAutoresizingMaskIntoConstraints = NO;
//    [self.scrollView addSubview:self.rtLab];
//    
//    
//    
//    
//    UILabel *lab2 = [UILabel new];
//    lab2.text = @"基督教啊来得及";
//    lab2.translatesAutoresizingMaskIntoConstraints = NO;
//    [self.scrollView addSubview:lab2];
//    
//    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    [button setTitle:@"buttonxxx" forState:UIControlStateNormal];
//    button.translatesAutoresizingMaskIntoConstraints = NO;
//    [self.scrollView addSubview:button];
//    
//    
////    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:lab1
////                                                         attribute:NSLayoutAttributeLeading
////                                                         relatedBy:NSLayoutRelationEqual
////                                                            toItem:self.scrollView
////                                                         attribute:NSLayoutAttributeLeading
////                                                        multiplier:1.0
////                                                           constant:10]];
////    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:lab1
////                                                         attribute:NSLayoutAttributeTop
////                                                         relatedBy:NSLayoutRelationEqual
////                                                            toItem:self.scrollView
////                                                         attribute:NSLayoutAttributeBottom
////                                                        multiplier:1.0
////                                                           constant:-100]];
//    
////    NSArray *views = [NSArray arrayWithObjects:_lab1, lab2, button, nil];
////    NSArray *constraints = [views autoAlignViewsToEdge:ALEdgeLeading];
////    [views autoDistributeViewsAlongAxis:ALAxisVertical
////                                              withFixedSpacing:10.0
////                                                     alignment:NSLayoutFormatAlignAllLeft];
////    
////    [self.scrollView addConstraints:constraints];
//    
//    
////    [lab1 autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(10, 10, 0, 0)];
//    
//    _lab1.backgroundColor = [UIColor redColor];
//    lab2.backgroundColor = [UIColor yellowColor];
//    button.backgroundColor = [UIColor purpleColor];
//    
//    [_lab1 autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:10];
//    [_lab1 autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:100];
//    [_lab1 autoSetDimension:ALDimensionWidth toSize:100 relation:NSLayoutRelationEqual];
//    
//    [_rtLab autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_lab1 withOffset:0];
//    
//    CGSize optimumSize = [self.rtLab optimumSize];
//    CGRect frame = [self.rtLab frame];
//    frame.size.height = (int)optimumSize.height+5; // +5 to fix height issue, this should be automatically fixed in iOS5
//
//    [_rtLab autoSetDimension:ALDimensionWidth toSize:optimumSize.width + 50];
//    [_rtLab autoSetDimension:ALDimensionHeight toSize:optimumSize.height];
//    
//    [lab2 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_rtLab withOffset:0];
//    [button autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:lab2 withOffset:0];
//    [button autoSetDimension:ALDimensionHeight toSize:40];
//    [self.scrollView addConstraints:[@[_lab1,_rtLab, lab2, button] autoAlignViewsToEdge:ALEdgeLeading]];
//    
//    [button addTarget:self action:@selector(buttonEvent:) forControlEvents:UIControlEventTouchUpInside];
//    
//    
//    
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.contentsTableButton
//                                                         attribute:NSLayoutAttributeTrailing
//                                                         relatedBy:NSLayoutRelationEqual
//                                                            toItem:self.view
//                                                         attribute:NSLayoutAttributeTrailing
//                                                        multiplier:1.0
//                                                           constant:-10]];
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.contentsTableButton
//                                                         attribute:NSLayoutAttributeBottom
//                                                         relatedBy:NSLayoutRelationEqual
//                                                            toItem:self.view
//                                                         attribute:NSLayoutAttributeBottom
//                                                        multiplier:1.0
//                                                          constant:-30]];
//    [self.contentsTableButton autoSetDimensionsToSize:CGSizeMake(40, 40)];
//    
//}
//
//-(void)contentsTableButtonEvent:(UIButton*)sender{
//    if (sender.tag == 0) {
//        [self showContentTable];
//        sender.tag = 1;
//    }else{
//        [self hiddenContentTable];
//        sender.tag = 0;
//    }
//}
//
//-(void)showContentTable{
//    TableOfContentsView *view = [TableOfContentsView new];
//    view.frame = CGRectMake(0, 0, 100, 400);
//    view.layer.cornerRadius = 5;
//    view.clipsToBounds = YES;
//    view.tag = contentTableViewTag;
//    
//    view.left = self.view.width;
//    view.bottom = self.contentsTableButton.top;
//    
//    [UIView animateKeyframesWithDuration:0.4
//                                   delay:0.01
//                                 options:UIViewKeyframeAnimationOptionCalculationModeLinear
//                              animations:^{
//                                  view.right = self.view.width;
//                              } completion:^(BOOL finished) {
//                                  
//                              }];
//    
//    [self.view addSubview:view];
//}
//
//-(void)hiddenContentTable{
//    UIView *view = [self.view viewWithTag:contentTableViewTag];
//    
//    [UIView animateKeyframesWithDuration:0.4
//                                   delay:0.01
//                                 options:UIViewKeyframeAnimationOptionCalculationModeLinear
//                              animations:^{
//                                  view.left = self.view.width;
//                              } completion:^(BOOL finished) {
//                                  [view removeFromSuperview];
//                              }];
//
//}
//
//
//
//-(void)buttonEvent:(id)sender{
//    self.lab1.text = @"xxxxxxxpdpppppppppppppppppppppppppppppppp";
//}
//
//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}
//
//-(void)viewDidLayoutSubviews{
//    
//
//    
//    [super viewDidLayoutSubviews];
//    
//}
///*
//#pragma mark - Navigation
//
//// In a storyboard-based application, you will often want to do a little preparation before navigation
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    // Get the new view controller using [segue destinationViewController].
//    // Pass the selected object to the new view controller.
//}
//*/
//
//@end
