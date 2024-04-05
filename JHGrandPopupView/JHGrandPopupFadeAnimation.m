//
//  JHGrandPopupFadeAnimation.m
//  Pods-JHGrandPopupViewDemo
//
//  Created by xq on 2022/7/16.
//

#import "JHGrandPopupFadeAnimation.h"
#import <UIKit/UIKit.h>

@implementation JHGrandPopupFadeAnimation

- (void)animateInWithPopupView:(JHGrandPopupView * _Nonnull)popupView willAnimate:(void (^ _Nullable)(void))willAnimate didAnimate:(void (^ _Nullable)(void))didAnimate {
    popupView.alpha = 0;
    
    !willAnimate ?: willAnimate();
    [UIView animateWithDuration:self.animateInDuration animations:^{
        popupView.alpha = 1;
    } completion:^(BOOL finished) {
        !didAnimate ?: didAnimate();
    }];
}

- (void)animateOutWithPopupView:(JHGrandPopupView * _Nonnull)popupView willAnimate:(void (^ _Nullable)(void))willAnimate didAnimate:(void (^ _Nullable)(void))didAnimate {
    popupView.alpha = 1;
    
    !willAnimate ?: willAnimate();
    [UIView animateWithDuration:self.animateOutDuration animations:^{
        popupView.alpha = 0;
    } completion:^(BOOL finished) {
        !didAnimate ?: didAnimate();
    }];
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    if (self.animateType == JHGrandPopupAnimateTypeAnimateIn) {
        [self handleInAnimateWithTransition:transitionContext];
    } else {
        [self handleOutAnimateWithTransition:transitionContext];
    }
}

- (void)handleInAnimateWithTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
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

- (void)handleOutAnimateWithTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration animations:^{
        fromVC.view.alpha = 0;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:finished];
    }];
}

@end
