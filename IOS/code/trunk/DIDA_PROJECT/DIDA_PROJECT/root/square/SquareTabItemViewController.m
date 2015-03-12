//
//  SquareTabItemViewController.m
//  DIDA_PROJECT
//
//  Created by 袁江 on 14-9-25.
//  Copyright (c) 2014年 luojilab.com. All rights reserved.
//

#import "SquareTabItemViewController.h"
#import "SqCollectionViewCell.h"
#import "UserDetailViewController.h"
#import "DiDaSegmentControl.h"


@interface SquareTabItemViewController ()<UICollectionViewDataSource, UICollectionViewDelegate>

@property(nonatomic, strong)UICollectionView *collectionView;

@end

@implementation SquareTabItemViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    [self loadContent];
}

- (void)loadContent{
    
    
    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    
    flowLayout.headerReferenceSize = CGSizeMake(self.view.width, 43);
    CGRect rect = CGRectMake(10, 0, self.view.bounds.size.width - 19, self.view.height);
    self.collectionView  = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.collectionView registerClass:[SqCollectionViewCell class] forCellWithReuseIdentifier:@"sqCell"];
    [self.collectionView registerClass:[UICollectionReusableView class]
       forSupplementaryViewOfKind:UICollectionElementKindSectionHeader
              withReuseIdentifier:@"UICollectionReusableView"];
    self.collectionView.showsVerticalScrollIndicator = NO;
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.backgroundColor = DIDA_BACKGROUND_COLOR;
    [self.view addSubview:self.collectionView];
    self.view.backgroundColor  = DIDA_BACKGROUND_COLOR;
}


-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    CGRect rect = CGRectMake(10, 0, self.view.bounds.size.width - 19, self.view.height);
    self.collectionView.frame = rect;
    
}

//设置分区
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 1;
}


//每个分区上的元素个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 24;
}


//设置元素内容
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identify = @"sqCell";
    SqCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
    cell.backgroundColor = [UIColor redColor];
    if (!cell) {
        
    }
    return cell;
}

//设置元素的的大小框
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    UIEdgeInsets top = {10,10,10,10};
    return top;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat width = (collectionView.width - 40) / 3;
    //NSLog(@"%f",(kDeviceHeight-88-49)/4.0);
    return CGSizeMake(width, width);
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%@",indexPath);
    UserDetailViewController *vc = [[UserDetailViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
    [collectionView  deselectItemAtIndexPath:indexPath animated:YES];
}

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    UICollectionReusableView *view =  [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                                                                         withReuseIdentifier:@"UICollectionReusableView" forIndexPath:indexPath];
    if (![view viewWithTag:1111]) {
        NSArray *arr = [NSArray arrayWithObjects:@"只看筹款中", @"只看女生", @"只看男生", nil];
        DiDaSegmentControl *control = [[DiDaSegmentControl alloc] initWithTitle:arr
                                                                  currentIndex:-1
                                                                  eventCallBack:^(BOOL selected , NSInteger selectedIndex) {
            
        }];
        control.frame = CGRectMake(0, 10, collectionView.width - 1, 30);
        [view addSubview:control];
        control.tag = 1111;
    }
    return view;
}

@end
