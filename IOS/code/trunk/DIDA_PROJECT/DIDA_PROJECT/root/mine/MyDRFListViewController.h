//
//  MyDRFListViewController.h
//  DIDA_PROJECT
//
//  Created by 袁江 on 14/11/28.
//  Copyright (c) 2014年 luojilab.com. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "DiDaTableViewController.h"


typedef enum {
    MyDRFListSelectedTypeDream,
//    MyDRFListSelectedTypeTravels,
    MyDRFListSelectedTypeFeed
}MyDRFListSelectedType;


typedef NSInteger MyDRFListSubtype;

@interface MyDRFListViewController : DiDaTableViewController

-(instancetype)initWithSelectedType:(MyDRFListSelectedType)type;

@end
