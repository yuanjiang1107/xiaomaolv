//
//  PageItemViewController.h
//  DIDA_PROJECT
//
//  Created by 袁江 on 14/12/5.
//  Copyright (c) 2014年 luojilab.com. All rights reserved.
//

#import "DidaViewController.h"
#import "DiDaImagesViewController.h"

@interface PageItemViewController : DidaViewController<DiDaImagesViewControllerPageViewContollerProtocol>

-(instancetype)initWithImageUrl:(NSString*)imageUrl;

@property(nonatomic, assign)NSInteger pageIndex;

@end
