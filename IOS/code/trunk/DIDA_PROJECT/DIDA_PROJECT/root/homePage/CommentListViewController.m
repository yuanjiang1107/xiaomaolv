//
//  CommentListViewController.m
//  DIDA_PROJECT
//
//  Created by 袁江 on 15/3/10.
//  Copyright (c) 2015年 luojilab.com. All rights reserved.
//

#import "CommentListViewController.h"
#import "CommentListCell.h"


@interface CommentListViewController ()

@end

@implementation CommentListViewController

-(instancetype)initWidth:(CGFloat)width{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 1;
}



-(Class)cellClassForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [CommentListCell class];
}


-(CGFloat)heightForCommentListWidthData:(id)data{
    return 0;
}

-(void)fillData:(id)data{
    [self.tableView reloadData];
}



@end
