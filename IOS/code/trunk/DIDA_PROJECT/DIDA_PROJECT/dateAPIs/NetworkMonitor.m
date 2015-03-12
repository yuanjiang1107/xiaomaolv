//
//  NetworkMonitor.m
//  ThreeHundred
//
//  Created by skye on 1/4/12.
//  Copyright (c) 2012 dajie.com. All rights reserved.
//

#import "NetworkMonitor.h"

@interface NetworkMonitor(Private)

- (void) reachabilityCheck;
- (void) reachabilityDoubleCheck;
- (void) reachabilityChanged: (NSNotification *)note;
- (BOOL) updateInterfaceWithReachability: (Reachability *)curReach;

@end

@implementation NetworkMonitor

@synthesize networkStatus = _networkStatus;

static NetworkMonitor * _sharedInstance = nil;

+ (NetworkMonitor *)sharedInstance
{
	if ( _sharedInstance == nil ) {
		_sharedInstance = [[NetworkMonitor alloc] init];
	}
	return _sharedInstance;
}

+ (NetworkStatus)status
{
    return [[Reachability reachabilityForInternetConnection] currentReachabilityStatus];
}

- (void)start
{    
    networkReachable = YES;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector: @selector(reachabilityChanged:) name: kReachabilityChangedNotification object: nil];
    
    internetReach = [Reachability reachabilityForInternetConnection];
    networkReachable = [self updateInterfaceWithReachability:internetReach];
    [self reachable];
    [internetReach startNotifier];
}

- (BOOL)reachable
{
    if (!networkReachable && _showingAlert == nil) {
        NSString *statusString = NSLocalizedString(@"No working Internet connection is found.\r\nIf WiFi is enable, try disabling WiFi or try another WiFi hotspot.", @"");
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"No Internet!", @"")
                                                        message:statusString
                                                       delegate:self 
                                              cancelButtonTitle:nil 
                                              otherButtonTitles:@"OK", nil];   
        _showingAlert = alert;
        [alert show];
    }
    return networkReachable;
}

- (BOOL)updateInterfaceWithReachability:(Reachability *)curReach
{
    NSString *statusString = @"";
    BOOL reachable = NO;
    self.networkStatus = [curReach currentReachabilityStatus];
    switch (self.networkStatus) {
        case NotReachable: {
            statusString = @"Access Not Available";
            reachable = NO;
            break;
        }
        case ReachableViaWWAN: {
            statusString = @"Reachable WWAN";
            reachable = YES;
            break;
        }
        case ReachableViaWiFi: {
            statusString = @"Reachable WiFi";
            reachable = YES;
            break;
        }
    }
#ifdef DEBUG    
    NSLog(@"network status : %@ %@", [curReach description], statusString);
#endif
    return reachable;
}

- (void) reachabilityChanged: (NSNotification *)note
{
	Reachability *curReach = [note object];
	NSParameterAssert([curReach isKindOfClass: [Reachability class]]);
	networkReachable = [self updateInterfaceWithReachability: curReach];
    [self reachable];
    
    if (networkReachable) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"NetworkReachable" object:nil];        
    }
}

#pragma mark - 商品接口

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    _showingAlert = nil;
}

@end
