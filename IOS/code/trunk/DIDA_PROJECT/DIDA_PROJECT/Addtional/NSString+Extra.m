//
//  NSString+Extra.m
//  Roosher
//
//  Created by Levin on 10-9-27.
//  Copyright 2010 Roosher inc. All rights reserved.
//

#import "NSString+Extra.h"


@implementation NSString (Extra)


+ (NSString*)stringWithNewUUID {
    // Create a new UUID
    CFUUIDRef uuidObj = CFUUIDCreate(nil);
    CFStringRef uuidString = CFUUIDCreateString(nil, uuidObj);
    NSString *result = (__bridge_transfer NSString *)CFStringCreateCopy(NULL, uuidString);
    CFRelease(uuidObj);
    CFRelease(uuidString);
    return result;
}

- (NSString *)URLEncodedString {
    NSString *result = (__bridge_transfer NSString *)CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                                           (__bridge CFStringRef)self,
                                                                           NULL,
																		   CFSTR("!*'();:@&=+$,/?%#[]"),
                                                                           kCFStringEncodingUTF8);
	return result;
}

- (NSString*)URLDecodedString {
	NSString *result = (__bridge_transfer NSString *)CFURLCreateStringByReplacingPercentEscapesUsingEncoding(kCFAllocatorDefault, (__bridge CFStringRef)self, CFSTR(""), kCFStringEncodingUTF8);
	return result;	
}

- (NSString*)stringByTrimmingBoth {
    NSString *trimmed = [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    return trimmed;
}

- (NSString*)stringByTrimmingLeadingWhitespace {
    NSInteger i = 0;
    
    while ([[NSCharacterSet whitespaceCharacterSet] characterIsMember:[self characterAtIndex:i]]) {
        i++;
    }
    return [self substringFromIndex:i];
}

+ (NSString*)formatYearMonthDayHourMinute:(NSTimeInterval)interval
{
    NSLog(@"interval:%f", interval);
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    [formatter setDateFormat: @"MM-dd HH:mm"];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:interval];
    return [formatter stringFromDate:date];
}

+ (NSString*)formatYearMonth:(NSTimeInterval)interval
{
    if (interval == 0) {
        return @"";
    }
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    [formatter setDateFormat: @"yyyy.MM"];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:interval];
    return [formatter stringFromDate:date];
}

+ (NSString*)formatYearMonthCN:(NSTimeInterval)interval
{
    if (interval == 0) {
        return @"";
    }
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    [formatter setDateFormat: @"yyyy年M月"];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:interval];
    return [formatter stringFromDate:date];
}

+ (NSString*)formatYearMonthDay:(NSTimeInterval)interval
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    [formatter setDateFormat: @"yyyy-MM-dd"];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:interval];
    return [formatter stringFromDate:date];
}

+ (NSString*)formatDay:(NSTimeInterval)interval
{
    if (interval == 0) {
        return @"";
    }
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    [formatter setDateFormat: @"dd"];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:interval];
    return [formatter stringFromDate:date];
}

+ (NSString*)formatHourMinute:(NSTimeInterval)interval
{
    if (interval == 0) {
        return @"";
    }
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    [formatter setDateFormat: @"HH:mm"];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:interval];
    return [formatter stringFromDate:date];
}

- (CGFloat)measureTextHeight:(UIFont *)desFont desWidth:(CGFloat)desWidth
{
    if (self.length < 1) {
        return 10.0f;
    }
    
    CGFloat result = 0.0f;

    CGSize textSize = CGSizeMake(desWidth, 100000.0f);
    CGSize size = [self sizeWithFont:desFont
                   constrainedToSize:textSize
                       lineBreakMode:NSLineBreakByWordWrapping];
    result = size.height;	// at least one row

    return result;
}
- (CGFloat)measureTextHeight:(UIFont *)desFont desWidth:(CGFloat)desWidth maxHeight:(CGFloat)height
{
    if (self.length < 1) {
        return 10.0f;
    }
    
    CGFloat result = 0.0f;
    
    CGSize textSize = CGSizeMake(desWidth, height);
    CGSize size = [self sizeWithFont:desFont
                   constrainedToSize:textSize
                       lineBreakMode:NSLineBreakByWordWrapping];
    result = size.height;	// at least one row
    return result;
}
- (NSString*)trimText
{
    if (self.length > 0) {
        NSCharacterSet* set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
        NSString* text = [self stringByTrimmingCharactersInSet:set];
        return text;
    }
    else {
        return self;
    }
}


- (NSString *)stringRemoveZhongTags
{
	@autoreleasepool {
//        NSString *pattern = @"(?<!=\")\\b((http|https):\\/\\/[\\w\\-_]+(\\.[\\w\\-_]+)+([\\w\\-\\.,@?^=%%&amp;:/~\\+#]*[\\w\\-\\@?^=%%&amp;/~\\+#])?)";
//        NSString *pattern = @"<(\S*?)[^>]*>.*?</\1>|<.*? />";
        // 去掉img
//        NSString *pattern = @"\\[img\\].*?\\[/img\\]";
        NSString *pattern = @"\\[img\\].*?\\[/img\\]";
        NSRegularExpression *regex1 = [NSRegularExpression regularExpressionWithPattern:pattern
                                                                                options:0
                                                                                  error:nil];
        NSString *modifiedString = [regex1 stringByReplacingMatchesInString:self
                                                                   options:0
                                                                     range:NSMakeRange(0, [self length])
                                                              withTemplate:@""];
//        pattern = @"\\[color=#.*?\\[/color\\]";
//        NSRegularExpression *regex2 = [NSRegularExpression regularExpressionWithPattern:pattern
//                                                                                options:0
//                                                                                  error:nil];
//        modifiedString = [regex2 stringByReplacingMatchesInString:modifiedString
//                                                          options:0
//                                                            range:NSMakeRange(0, [modifiedString length])
//                                                     withTemplate:@""];
        
        pattern = @"\\[.*?\\]";
        NSRegularExpression *regex3 = [NSRegularExpression regularExpressionWithPattern:pattern
                                                                                options:0
                                                                                  error:nil];
        modifiedString = [regex3 stringByReplacingMatchesInString:modifiedString
                                                          options:0
                                                            range:NSMakeRange(0, [modifiedString length])
                                                     withTemplate:@""];
        return modifiedString;
    }
}



@end
