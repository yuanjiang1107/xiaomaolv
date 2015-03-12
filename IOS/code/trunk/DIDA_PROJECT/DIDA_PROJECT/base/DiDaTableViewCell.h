//
//  DiDaTableViewCell.h
//  DIDA_PROJECT
//
//  Created by 袁江 on 14-9-26.
//  Copyright (c) 2014年 luojilab.com. All rights reserved.
//

#import <UIKit/UIKit.h>

 NSObject *gCellReference;



typedef enum {
    CellPositionTop = 1,
    CellPositionMid = 1<<1,
    CellPositionBottom = 1<<2
}CellPosition;

#define cellContentLeftInset 10


@interface DiDaTableViewCell : UITableViewCell

+(CGFloat)heightForClassCellWidth:(id)data  position:(CellPosition)position;

-(void)configCellWithData:(id)data position:(CellPosition)position;


CREATE_ASSIGN CellPosition cellPosition;
CREATE_ASSIGN BOOL needSeparator;

-(void)addsubviewToContentView:(NSArray*)array;

-(void)showBg;

@property(nonatomic, assign) BOOL cellForAutoLayout;

@end
