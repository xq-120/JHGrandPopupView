//
//  JHGrandPopupPresentAnimation.m
//  Pods-JHGrandPopupViewDemo
//
//  Created by xq on 2022/7/16.
//

#import "JHGrandPopupPresentAnimation.h"
#import <UIKit/UIKit.h>

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

@end
