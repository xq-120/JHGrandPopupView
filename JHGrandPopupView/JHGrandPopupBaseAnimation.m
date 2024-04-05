//
//  JHGrandPopupBaseAnimation.m
//  JHGrandPopupView
//
//  Created by 薛权 on 2024/4/5.
//

#import "JHGrandPopupBaseAnimation.h"

@implementation JHGrandPopupBaseAnimation

- (instancetype)init {
    return [self initWithAnimateType:JHGrandPopupAnimateTypeAnimateIn];
}

- (instancetype)initWithAnimateType:(JHGrandPopupAnimateType)animateType {
    self = [super init];
    if (self) {
        _animateInDuration = 0.35;
        _animateOutDuration = 0.25;
        _animateType = animateType;
    }
    return self;
}

- (void)animateInWithPopupView:(JHGrandPopupView * _Nonnull)popupView willAnimate:(void (^ _Nullable)(void))willAnimate didAnimate:(void (^ _Nullable)(void))didAnimate {
    
}

- (void)animateOutWithPopupView:(JHGrandPopupView * _Nonnull)popupView willAnimate:(void (^ _Nullable)(void))willAnimate didAnimate:(void (^ _Nullable)(void))didAnimate {
    
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return self.animateType == JHGrandPopupAnimateTypeAnimateIn ? self.animateInDuration : self.animateOutDuration;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    
}

@end
