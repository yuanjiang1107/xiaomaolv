//
//  CatalogView.h
//  DIDA_PROJECT
//
//  Created by 袁江 on 14/11/19.
//  Copyright (c) 2014年 luojilab.com. All rights reserved.
//

#import <UIKit/UIKit.h>



@protocol CatalogDelegate <NSObject>

-(void)catalogDidSelectedItemWith:(NSInteger)index title:(NSString*)title;

-(void)catalogDidFolded;

@end


@interface CatalogView : UIView

-(instancetype)initWithList:(NSArray*)list;

@property(nonatomic, weak)id<CatalogDelegate> delegate;

@property(nonatomic, strong)NSArray *list;

-(void)fold;

@end
