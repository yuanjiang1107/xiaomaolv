//
//  MBHudUtil.m
//  djApp
//
//  Created by libin.tian on 1/6/14.
//  Copyright (c) 2014 dajie.com. All rights reserved.
//

#import "MBHudUtil.h"

#import "AppDelegate.h"
#import "MBProgressHUD.h"


@implementation LoadingView


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];

    if (self != nil) {
        
        UIImage* image = [UIImage imageNamed:@"window_loading.png"];
        _loadingImage = [[UIImageView alloc] initWithImage:image];
        [self addSubview:_loadingImage];
        
        _rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
        _rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0 ];
        _rotationAnimation.duration = 1.0f;
        _rotationAnimation.cumulative = YES;
        _rotationAnimation.repeatCount = MAXFLOAT;
        
    }
    
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.loadingImage.centerX = self.width / 2.0f;
    self.loadingImage.centerY = self.height / 2.0f;
}

- (void)startAnimating
{
    [self.loadingImage.layer addAnimation:self.rotationAnimation forKey:@"rotationAnimation"];
}

- (void)dealloc
{
    NSLog(@"");
}

@end

@implementation MBHudUtil

+ (UIView*)defaultView
{
    UIWindow* window = [UIApplication sharedApplication].delegate.window;
    return window;
}

+ (void)showActivityView:(NSString *)text
                  inView:(UIView *)view
{
    if (view == nil) {
        view = [self defaultView];
    }
    UIView *viewExist = nil;
	for (UIView *v in [view subviews]) {
		if ([v isKindOfClass:[MBProgressHUD class]]) {
			viewExist = v;
            break;
		}
	}
    
    MBProgressHUD *HUD = (MBProgressHUD *)viewExist;
    if (HUD == nil) {
        HUD = [MBProgressHUD showHUDAddedTo:view animated:YES];
    }
    HUD.labelText = nil;
    HUD.detailsLabelText = nil;
    
    LoadingView* loading = [[LoadingView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 45.0f, 45.0f)];
    HUD.customView = loading;
    [loading startAnimating];
    HUD.mode = MBProgressHUDModeCustomView;
    
    HUD.backgroundBg = [UIImage imageWithName:@"window_bg.png" size:HUD.size];
}

+ (void)hideActivityView:(UIView *)view
{
    if (view == nil) {
        view = [self defaultView];
    }
    [MBProgressHUD hideHUDForView:view animated:YES];

}

+ (void)showFinishActivityView:(NSString *)text
{
    [self showFinishActivityView:text
                        interval:Http_ErrorMsgDisplay_Interval];
}

+ (void)showFinishActivityView:(NSString *)text
                        inView:(UIView *)view
{
    [self showFinishActivityView:text
                        interval:Http_ErrorMsgDisplay_Interval
                          inView:view];
}


+ (void)showFinishActivityView:(NSString *)text
                      interval:(NSTimeInterval)time
{
    [self showFinishActivityView:text
                        interval:time
                          inView:nil];
}

+ (void)showFinishActivityView:(NSString *)text
                      interval:(NSTimeInterval)time
                        inView:(UIView *)view
{
    if (view == nil) {
        view = [self defaultView];
    }
    UIView *viewExist = nil;
	for (UIView *v in [view subviews]) {
		if ([v isKindOfClass:[MBProgressHUD class]]) {
			viewExist = v;
            break;
		}
	}
    
    MBProgressHUD *HUD = (MBProgressHUD *)viewExist;
    if (HUD == nil) {
        HUD = [MBProgressHUD showHUDAddedTo:view animated:YES];
    }
    HUD.customView = [[UIImageView alloc] initWithImage:[UIImage retina4ImageNamed:@"window_success.png"]];
    HUD.backgroundBg = [UIImage imageWithName:@"window_bg.png" size:HUD.size];
    HUD.mode = MBProgressHUDModeCustomView;
    HUD.labelText = @"";
    HUD.detailsLabelText = text;
    [HUD hide:YES afterDelay:time];
}

+ (void)showFailedActivityView:(NSString *)text
{
    [self showFailedActivityView:text
                        interval:Http_ErrorMsgDisplay_Interval];
}

+ (void)showFailedActivityView:(NSString *)text
                        inView:(UIView *)view
{
    [view  endEditing:YES];
    [self showFailedActivityView:text
                        interval:Http_ErrorMsgDisplay_Interval
                          inView:view];
}

+ (void)showFailedActivityView:(NSString *)text
                      interval:(NSTimeInterval)time
{
    [self showFailedActivityView:text
                        interval:time
                          inView:nil];
}


+ (void)showFailedActivityView:(NSString *)text
                      interval:(NSTimeInterval)time
                        inView:(UIView *)view
{
    if (view == nil) {
        view = [self defaultView];
    }
    UIView *viewExist = nil;
	for (UIView *v in [view subviews]) {
		if ([v isKindOfClass:[MBProgressHUD class]]) {
			viewExist = v;
            break;
		}
	}
    
    MBProgressHUD *HUD = (MBProgressHUD *)viewExist;
    if (HUD == nil) {
        HUD = [MBProgressHUD showHUDAddedTo:view animated:YES];
    }
    HUD.customView = [[UIImageView alloc] initWithImage:[UIImage retina4ImageNamed:@"window_failure.png"]];
    HUD.backgroundBg = [UIImage imageWithName:@"window_bg.png" size:HUD.size];
    HUD.mode = MBProgressHUDModeCustomView;
    HUD.labelText = @"";
    HUD.detailsLabelText = text;
    [HUD hide:YES afterDelay:time];
}



+ (void)showAlert:(NSString*)msg
{
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"提示"
                                                    message:msg
                                                   delegate:nil
                                          cancelButtonTitle:@"确定"
                                          otherButtonTitles:nil, nil];
    [alert show];
}

@end
