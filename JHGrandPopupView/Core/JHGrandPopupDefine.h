//
//  JHGrandPopupEnumDefine.h
//  Pods
//
//  Created by uzzi on 2025/7/9.
//

#ifndef JHGrandPopupEnumDefine_h
#define JHGrandPopupEnumDefine_h

typedef NS_ENUM(NSInteger, JHGrandPopupAnimateDirectionType) {
    JHGrandPopupAnimateDirectionIn = 0,
    JHGrandPopupAnimateDirectionOut = 1,
};

@protocol JHGrandPopupViewControllerAnimationProtocol <UIViewControllerAnimatedTransitioning>

@property (nonatomic, assign) JHGrandPopupAnimateDirectionType directionType;

@end

@class JHGrandPopupView;

@protocol JHGrandPopupViewAnimationProtocol

- (void)animateInWithPopupView:(JHGrandPopupView * _Nonnull)popupView completion:(void (^ _Nullable)(void))completion;

- (void)animateOutWithPopupView:(JHGrandPopupView * _Nonnull)popupView completion:(void (^ _Nullable)(void))completion;

@end

#endif /* JHGrandPopupEnumDefine_h */
