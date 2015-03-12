//
//  NSDictionary+Safe.h
//  djApp
//
//  Created by tianlibin on 3/22/14.
//  Copyright (c) 2014 dajie.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Safe)

- (NSNumber*)numberForKey:(NSString*)key;
- (NSString*)stringForKey:(NSString*)key;
- (NSDictionary*)dicForKey:(NSString*)key;
- (NSArray*)arrayForKey:(NSString*)key;

- (NSNumber*)numberForKey:(NSString*)key defaultValue:(NSNumber*)value;
- (NSString*)stringForKey:(NSString*)key defaultValue:(NSString*)value;
- (NSDictionary*)dicForKey:(NSString*)key defaultValue:(NSDictionary*)value;
- (NSArray*)arrayForKey:(NSString*)key defaultValue:(NSArray*)value;



@end
