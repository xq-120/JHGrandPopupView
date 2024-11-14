//
//  JHGrandPopupBaseAnimation.m
//  JHGrandPopupView
//
//  Created by xuequan on 2024/4/5.
//

#import "JHGrandPopupBaseInAnimation.h"

@implementation JHGrandPopupBaseInAnimation

- (instancetype)init {
    self = [super init];
    if (self) {
        _animateDuration = 0.35;
    }
    return self;
}

- (void)animateWithPopupView:(JHGrandPopupView *)popupView completion:(void (^)(void))completion {
    
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return self.animateDuration;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    
}

@end