//
//  SearchViewController.h
//  DIDA_PROJECT
//
//  Created by 袁江 on 14-9-26.
//  Copyright (c) 2014年 luojilab.com. All rights reserved.
//

#import "DiDaTableViewController.h"


typedef enum {
    SearchTypeDream,
    SearchTypeSomeone,
    SearchTypeTravel
}SearchType;

@protocol SearchViewControllerDelegate <NSObject>

-(void)dismissMe;

@end

@interface SearchViewController : DiDaTableViewController

@property(nonatomic, assign) SearchType searchType;

@property(nonatomic, weak) id<SearchViewControllerDelegate> delegate;

@end
