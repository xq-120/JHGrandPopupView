//
//  JHGrandPopupPresentAnimation.m
//  Pods-JHGrandPopupViewDemo
//
//  Created by xq on 2022/7/16.
//

#import "JHGrandPopupPresentAnimation.h"
#import <UIKit/UIKit.h>
#import "JHGrandPopupViewController.h"

@implementation JHGrandPopupPresentAnimation

- (void)animateInWithPopupView:(JHGrandPopupView * _Nonnull)popupView willAnimate:(void (^ _Nullable)(void))willAnimate didAnimate:(void (^ _Nullable)(void))didAnimate {
    [popupView layoutIfNeeded];
    
    CGRect fromFrame = popupView.contentView.frame;
    fromFrame.origin.y = popupView.frame.size.height + popupView.contentView.frame.size.height;
    popupView.contentView.frame = fromFrame;
    
    CGRect toFrame = popupView.contentView.frame;
    toFrame.origin.y = popupView.frame.size.height - popupView.contentView.frame.size.height;
    
    popupView.alpha = 0;
    !willAnimate ?: willAnimate();
    [UIView animateWithDuration:self.animateInDuration animations:^{
        popupView.alpha = 1;
        popupView.contentView.frame = toFrame;
    } completion:^(BOOL finished) {
        !didAnimate ?: didAnimate();
    }];
}

- (void)animateOutWithPopupView:(JHGrandPopupView * _Nonnull)popupView willAnimate:(void (^ _Nullable)(void))willAnimate didAnimate:(void (^ _Nullable)(void))didAnimate {
    CGRect toFrame = popupView.contentView.frame;
    toFrame.origin.y = popupView.frame.size.height + popupView.contentView.frame.size.height;

    !willAnimate ?: willAnimate();
    [UIView animateWithDuration:self.animateOutDuration animations:^{
        popupView.alpha = 0;
        popupView.contentView.frame = toFrame;
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
    JHGrandPopupViewController *contentVC = nil;
    if ([toVC isKindOfClass:JHGrandPopupViewController.class]) {
        contentVC = (JHGrandPopupViewController *)toVC;
    } else if ([toVC isKindOfClass:UINavigationController.class]) {
        contentVC = [(UINavigationController *)toVC viewControllers].firstObject;
    }
    if (![contentVC isKindOfClass:JHGrandPopupViewController.class]) {
        return;
    }
    
    CGRect finalFrame = [transitionContext finalFrameForViewController:toVC];
    toVC.view.frame = finalFrame;
    UIView *containerView = transitionContext.containerView;
    [containerView addSubview:toVC.view];
    
    [contentVC.view layoutIfNeeded];
    CGRect contentViewFrame = contentVC.contentView.frame;
    contentVC.contentView.frame = CGRectMake(contentViewFrame.origin.x, contentViewFrame.origin.y + contentViewFrame.size.height, contentViewFrame.size.width, contentViewFrame.size.height);
    contentVC.backView.alpha = 0;
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration animations:^{
        contentVC.backView.alpha = 1;
        contentVC.contentView.frame = contentViewFrame;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:finished];
    }];
}

- (void)handleOutAnimateWithTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    JHGrandPopupViewController *contentVC = nil;
    if ([fromVC isKindOfClass:JHGrandPopupViewController.class]) {
        contentVC = (JHGrandPopupViewController *)fromVC;
    } else if ([fromVC isKindOfClass:UINavigationController.class]) {
        contentVC = [(UINavigationController *)fromVC viewControllers].firstObject;
    }
    if (![contentVC isKindOfClass:JHGrandPopupViewController.class]) {
        return;
    }
    
    CGRect contentViewFrame = contentVC.contentView.frame;
    contentVC.backView.alpha = 1;
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration animations:^{
        contentVC.backView.alpha = 0;
        contentVC.contentView.frame = CGRectMake(contentViewFrame.origin.x, contentViewFrame.origin.y + contentViewFrame.size.height, contentViewFrame.size.width, contentViewFrame.size.height);
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:finished];
    }];
}

@end
