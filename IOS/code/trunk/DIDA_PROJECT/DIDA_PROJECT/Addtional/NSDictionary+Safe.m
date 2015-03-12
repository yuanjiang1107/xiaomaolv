//
//  NSDictionary+Safe.m
//  djApp
//
//  Created by tianlibin on 3/22/14.
//  Copyright (c) 2014 dajie.com. All rights reserved.
//

#import "NSDictionary+Safe.h"

@implementation NSDictionary (Safe)

- (NSNumber*)numberForKey:(NSString*)key
{
    if (key.length > 0) {
        NSNumber* obj = [self objectForKey:key];
        if ([obj isKindOfClass:[NSNumber class]]) {
            return obj;
        }
    }
    return nil;
}

- (NSString*)stringForKey:(NSString*)key
{
    if (key.length > 0) {
        NSString* obj = [self objectForKey:key];
        if ([obj isKindOfClass:[NSString class]]) {
            return obj;
        }
    }
    return nil;
}

- (NSDictionary*)dicForKey:(NSString*)key
{
    if (key.length > 0) {
        NSDictionary* obj = [self objectForKey:key];
        if ([obj isKindOfClass:[NSDictionary class]]) {
            return obj;
        }
    }
    return nil;
}

- (NSArray*)arrayForKey:(NSString*)key
{
    if (key.length > 0) {
        NSArray* obj = [self objectForKey:key];
        if ([obj isKindOfClass:[NSArray class]]) {
            return obj;
        }
    }
    return nil;
}


- (NSNumber*)numberForKey:(NSString*)key defaultValue:(NSNumber*)value
{
    NSNumber* obj = [self numberForKey:key];
    if (obj != nil) {
        return obj;
    }
    else {
        return value;
    }
}

- (NSString*)stringForKey:(NSString*)key defaultValue:(NSString*)value
{
    NSString* obj = [self stringForKey:key];
    if (obj != nil) {
        return obj;
    }
    else {
        return value;
    }
}

- (NSDictionary*)dicForKey:(NSString*)key defaultValue:(NSDictionary*)value
{
    NSDictionary* obj = [self dicForKey:key];
    if (obj != nil) {
        return obj;
    }
    else {
        return value;
    }
}

- (NSArray*)arrayForKey:(NSString*)key defaultValue:(NSArray*)value
{
    NSArray* obj = [self arrayForKey:key];
    if (obj != nil) {
        return obj;
    }
    else {
        return value;
    }
}



@end
