//
//  TableOfContentsView.h
//  DIDA_PROJECT
//
//  Created by 袁江 on 14/10/27.
//  Copyright (c) 2014年 luojilab.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ContentViewToolBarDelegate <NSObject>

-(void)contentViewToolBarDidSelectedItem:(NSInteger)index;

-(void)contentViewDidFold;

@end


@interface ContentViewToolBar : UIView

@property(nonatomic, weak)id<ContentViewToolBarDelegate> delegate;

-(void)fold;

@end
