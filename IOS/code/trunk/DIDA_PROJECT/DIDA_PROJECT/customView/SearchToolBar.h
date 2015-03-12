//
//  SearchToolBar.h
//  DIDA_PROJECT
//
//  Created by 袁江 on 14-9-26.
//  Copyright (c) 2014年 luojilab.com. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^SearchToolBarSelectedBlock)(NSInteger index);

@interface SearchToolBar : UIView

-(instancetype)initWithNames:(NSArray*)names currentIndex:(NSInteger)index selectedBlock:(SearchToolBarSelectedBlock)block;

@end

