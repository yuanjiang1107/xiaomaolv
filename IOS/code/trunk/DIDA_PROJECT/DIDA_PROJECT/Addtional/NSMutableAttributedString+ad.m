//
//  NSMutableAttributedString.m
//  DIDA_PROJECT
//
//  Created by 袁江 on 14/11/17.
//  Copyright (c) 2014年 luojilab.com. All rights reserved.
//

#import "NSMutableAttributedString+ad.h"

@implementation NSMutableAttributedString(ad)

+(NSMutableAttributedString*)crowdfundingStrWidth:(NSString*)prefix
                                     crowdfunding:(NSString*)crowdfunding
                                           suffix:(NSString*)suffix{
    
    NSNumberFormatter* numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setFormatterBehavior: NSNumberFormatterBehavior10_4];
    [numberFormatter setNumberStyle: NSNumberFormatterDecimalStyle];
    NSString *numberString = [numberFormatter stringFromNumber: [NSNumber numberWithInteger: crowdfunding.integerValue]];
    NSString *fullstr = [NSString stringWithFormat:@"%@¥%@%@", prefix, numberString, suffix];
    NSRange  range = NSMakeRange(prefix.length, numberString.length + 1);
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:fullstr];
    [str addAttribute:NSForegroundColorAttributeName value:DIDA_ORANGE_COLOR range:range];
    [str addAttribute:NSBackgroundColorAttributeName value:[UIColor greenColor] range:range];

    [str addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:25.0f] range:range];
    
    return str;

}

@end
