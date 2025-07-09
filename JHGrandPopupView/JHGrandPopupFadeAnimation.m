//
//  JHGrandPopupFadeAnimation.m
//  Pods-JHGrandPopupViewDemo
//
//  Created by xuequan on 2022/7/16.
//

#import "JHGrandPopupFadeAnimation.h"
#import <UIKit/UIKit.h>

@implementation JHGrandPopupFadeAnimation

- (void)animateInWithPopupView:(JHGrandPopupView * _Nonnull)popupView completion:(void (^ _Nullable)(void))completion {
    popupView.alpha = 0;
    popupView.contentView.transform = CGAffineTransformMakeScale(0.6f, 0.6f);
    [UIView animateWithDuration:self.animateInDuration delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        popupView.alpha = 1;
        popupView.contentView.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        !completion ?: completion();
    }];
}

- (void)animateOutWithPopupView:(JHGrandPopupView * _Nonnull)popupView completion:(void (^ _Nullable)(void))completion {
    popupView.alpha = 1;
    popupView.contentView.transform = CGAffineTransformIdentity;
    [UIView animateWithDuration:self.animateOutDuration delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        popupView.alpha = 0;
        popupView.contentView.transform = CGAffineTransformMakeScale(0.6f, 0.6f);
    } completion:^(BOOL finished) {
        !completion ?: completion();
    }];
}

- (void)animateInWithTransitionContext:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    CGRect finalFrame = [transitionContext finalFrameForViewController:toVC];
    toVC.view.frame = finalFrame;
    toVC.view.alpha = 0;
    
    UIView *containerView = transitionContext.containerView;
    [containerView addSubview:toVC.view];
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration animations:^{
        toVC.view.alpha = 1;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:finished];
    }];
}

- (void)animateOutWithTransitionContext:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration animations:^{
        fromVC.view.alpha = 0;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:finished];
    }];
}

@end
