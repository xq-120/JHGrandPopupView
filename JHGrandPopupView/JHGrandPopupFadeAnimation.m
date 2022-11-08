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
    [UIView animateWithDuration:0.35 animations:^{
        popupView.alpha = 1;
    } completion:^(BOOL finished) {
        !didAnimate ?: didAnimate();
    }];
}


- (void)animateOutWithPopupView:(JHGrandPopupView * _Nonnull)popupView willAnimate:(void (^ _Nullable)(void))willAnimate didAnimate:(void (^ _Nullable)(void))didAnimate {
    popupView.alpha = 1;
    
    !willAnimate ?: willAnimate();
    [UIView animateWithDuration:0.25 animations:^{
        popupView.alpha = 0;
    } completion:^(BOOL finished) {
        !didAnimate ?: didAnimate();
    }];
}

@end
