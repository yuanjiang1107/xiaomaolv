//
//  DataCheckUtil.m
//  djApp
//
//  Created by liu cf on 12-10-23.
//  Copyright (c) 2012年 dajie.com. All rights reserved.
//

#import "DataCheckUtil.h"

@implementation DataCheckUtil
+(BOOL)containOnlyDigit: (NSString*) string
{
    NSString *regex = @"^[0-9]+$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    
    if ([predicate evaluateWithObject:string] == YES) {
        return YES;
    }
    return NO;
}

+(NSString*)cutPhoneNum:(NSString*)string{
    
    NSString* resultStr = [string trimText];
    NSRange range;
    range = [resultStr rangeOfString:@"@"];
    if (range.length > 0) {
        return resultStr;
    }
    
    range = [resultStr rangeOfString:@"+86"];
    if (range.length > 0 || range.location == 0) {
        return [resultStr stringByReplacingCharactersInRange:range withString:@""];
        
    }else {
        range = [resultStr rangeOfString:@"86"];
        if (range.length > 0 && range.location == 0) {
            return [resultStr stringByReplacingCharactersInRange:range withString:@""];
        }
    }
    return resultStr;
}

+(BOOL)isPhoneNum: (NSString*) string
{
    NSString* regex = @"^[1][358]\\d{9}$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL is = [predicate evaluateWithObject:string];
    return is;
    
//    if ([DataCheckUtil containOnlyDigit:string] && string.length == 11) {
//        return YES;
//    }
//    return NO;
}

//电子邮箱校验
+(BOOL)checkEmail:(NSString *)emailStr
{
    NSString *regex = @"[A-Z0-9a-z._-]+@[A-Za-z0-9._-]+\\.[A-Za-z]{2,4}";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [predicate evaluateWithObject:emailStr];
}

+ (int)wordCount:(NSString*)str
{
    int i,n=[str length],l=0,a=0,b=0;
    unichar c;
    for(i=0;i<n;i++){
        c=[str characterAtIndex:i];
        if(isblank(c)){
            b++;
        }else if(isascii(c)){
            a++;
        }else{
            l++;
        }
    }
    if(a==0 && l==0) return 0;
    return l+(int)ceilf((float)(a+b)/2.0);
}

+ (BOOL)isAllCheseWords:(NSString *)str
{
    if (str == nil || [str length] == 0) {
        return NO;
    }

    for (int i = 0; i < [str length]; i++) {
        unichar c = [str characterAtIndex:i];
        if (!(c >= 0x4e00 && c < 0x9fff)) {
            return NO;
        }
    }
    return YES;
}

+(BOOL)checkPassword:(NSString*)str{
    for (int i = 0; i < [str length]; i++) {
        unichar c = [str characterAtIndex:i];
        if ((c >= 0x4e00 && c < 0x9fff)) {
            return NO;
        }
    }
    return YES;
}

+ (BOOL)string:(NSString*)string lengthBetween:(NSInteger)min andMax:(NSInteger)max
{
    if (string.length >= min && string.length <= max) {
        return YES;
    }
    else {
        return NO;
    }
}
/*
 *  统计字数的方法：一个汉字占一个字数，两个字母或数字占一个字字数
 */
+(NSUInteger) unicodeLengthOfString: (NSString *) text {
    NSUInteger asciiLength = 0;
    
    for (NSUInteger i = 0; i < text.length; i++) {
        
        
        unichar uc = [text characterAtIndex: i];
        
        asciiLength += isascii(uc) ? 1 : 2;
    }
    
    NSUInteger unicodeLength = asciiLength / 2;
    
    if(asciiLength % 2) {
        unicodeLength++;
    }
    
    return unicodeLength;
}


+ (BOOL)stringContainsEmoji:(NSString *)string
{
    __block BOOL returnValue = NO;
    [string enumerateSubstringsInRange:NSMakeRange(0, [string length]) options:NSStringEnumerationByComposedCharacterSequences usingBlock:
     ^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
         
         const unichar hs = [substring characterAtIndex:0];
         // surrogate pair
         if (0xd800 <= hs && hs <= 0xdbff) {
             if (substring.length > 1) {
                 const unichar ls = [substring characterAtIndex:1];
                 const int uc = ((hs - 0xd800) * 0x400) + (ls - 0xdc00) + 0x10000;
                 if (0x1d000 <= uc && uc <= 0x1f77f) {
                     returnValue = YES;
                 }
             }
         } else if (substring.length > 1) {
             const unichar ls = [substring characterAtIndex:1];
             if (ls == 0x20e3) {
                 returnValue = YES;
             }
             
         } else {
             // non surrogate
             if (0x2100 <= hs && hs <= 0x27ff) {
                 returnValue = YES;
             } else if (0x2B05 <= hs && hs <= 0x2b07) {
                 returnValue = YES;
             } else if (0x2934 <= hs && hs <= 0x2935) {
                 returnValue = YES;
             } else if (0x3297 <= hs && hs <= 0x3299) {
                 returnValue = YES;
             } else if (hs == 0xa9 || hs == 0xae || hs == 0x303d || hs == 0x3030 || hs == 0x2b55 || hs == 0x2b1c || hs == 0x2b1b || hs == 0x2b50) {
                 returnValue = YES;
             }
         }
     }];
    
    return returnValue;
}
@end
