//
//  DismissAnimation.m
//  DIDA_PROJECT
//
//  Created by 袁江 on 14/12/10.
//  Copyright (c) 2014年 luojilab.com. All rights reserved.
//

#import "DismissAnimation.h"

@implementation DismissAnimation


- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext
{
    return 0.3f;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    // 1. Get controllers from transition context
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIViewController *fromVc = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    // 2. Set init frame for toVC
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    CGRect finalFrame = [transitionContext finalFrameForViewController:toVC];
//    toVC.view.frame = CGRectOffset(finalFrame, 0, screenBounds.size.height);
    
    // 3. Add toVC's view to containerView
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:toVC.view];
    [containerView  addSubview:fromVc.view];
    
    UIView *testView = [[UIView alloc] initWithFrame:fromVc.view.bounds];
//    [containerView addSubview:testView];
    
    testView.backgroundColor = [UIColor greenColor];
    
    // 4. Do animate now
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    
    [UIView animateWithDuration:duration
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         fromVc.view.alpha = 0.0;
                     } completion:^(BOOL finished) {
                         [transitionContext completeTransition:YES];
                     }];
    
//    [UIView animateWithDuration:duration
//                          delay:0.0
//         usingSpringWithDamping:0.6
//          initialSpringVelocity:0.0
//                        options:UIViewAnimationOptionCurveLinear
//                     animations:^{
//                         fromVc.view.frame = CGRectMake(100, 100, 100, 100);
//                     } completion:^(BOOL finished) {
//                         // 5. Tell context that we completed.
//                         [transitionContext completeTransition:YES];
//                     }];
}



@end
