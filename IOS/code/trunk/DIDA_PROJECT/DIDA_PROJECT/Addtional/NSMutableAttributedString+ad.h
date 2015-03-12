//
//  NSMutableAttributedString.h
//  DIDA_PROJECT
//
//  Created by 袁江 on 14/11/17.
//  Copyright (c) 2014年 luojilab.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableAttributedString(ad)

+(NSMutableAttributedString*)crowdfundingStrWidth:(NSString*)prefix
                                     crowdfunding:(NSString*)crowdfunding
                                           suffix:(NSString*)suffix;

@end
