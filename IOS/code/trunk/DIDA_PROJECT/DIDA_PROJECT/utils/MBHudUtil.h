//
//  MBHudUtil.h
//  djApp
//
//  Created by libin.tian on 1/6/14.
//  Copyright (c) 2014 dajie.com. All rights reserved.
//

#import <Foundation/Foundation.h>


#define Http_ErrorMsgDisplay_Interval 1.5f

@interface LoadingView : UIView

@property (nonatomic, strong) UIImageView* loadingImage;
@property (nonatomic, strong) CABasicAnimation* rotationAnimation;

- (void)startAnimating;

@end


@interface MBHudUtil : NSObject

+ (void)showActivityView:(NSString *)text
                  inView:(UIView *)view;

+ (void)hideActivityView:(UIView *)view;

+ (void)showFinishActivityView:(NSString *)text;

+ (void)showFinishActivityView:(NSString *)text
                        inView:(UIView *)view;

+ (void)showFinishActivityView:(NSString *)text
                      interval:(NSTimeInterval)time;

+ (void)showFinishActivityView:(NSString *)text
                      interval:(NSTimeInterval)time
                        inView:(UIView *)view;

+ (void)showFailedActivityView:(NSString *)text;

+ (void)showFailedActivityView:(NSString *)text
                        inView:(UIView *)view;

+ (void)showFailedActivityView:(NSString *)text
                      interval:(NSTimeInterval)time;

+ (void)showFailedActivityView:(NSString *)text
                      interval:(NSTimeInterval)time
                        inView:(UIView *)view;


+ (void)showAlert:(NSString*)msg;

@end
