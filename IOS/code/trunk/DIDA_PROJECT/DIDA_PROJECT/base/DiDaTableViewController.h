//
//  DiDaTableViewController.h
//  dida
//
//  Created by 袁江 on 14-9-22.
//  Copyright (c) 2014年 he chao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DidaViewController.h"

@interface DiDaTableViewController : DidaViewController<UITableViewDelegate, UITableViewDataSource,NSFetchedResultsControllerDelegate>

-(instancetype)initWithTableViewType:(UITableViewStyle)style;

@property(nonatomic, strong)NSFetchedResultsController *fetchController;

@property(nonatomic, strong)UITableView *tableView;


-(NSString*)reusableIdentifierWithClass:(Class)class;


/*回调方法*/

-(UITableViewStyle)DiDaTableViewStyle;

-(UITableViewCellSeparatorStyle)DiDaTableViewSeparatorStyle;

-(UITableViewCellStyle)DiDaTableViewCellStyle;

-(UITableViewCellAccessoryType)DiDaTableViewCellAccessoryType;

-(Class)cellClassForRowAtIndexPath:(NSIndexPath*)indexPath;

-(CellPosition)positionForCellAtIndex:(NSIndexPath*)indexPath;


@end
