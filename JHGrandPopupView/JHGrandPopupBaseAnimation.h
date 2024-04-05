//
//  JHGrandPopupBaseAnimation.h
//  JHGrandPopupView
//
//  Created by 薛权 on 2024/4/5.
//

#import <Foundation/Foundation.h>
#import "JHGrandPopupView.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, JHGrandPopupAnimateType) {
    JHGrandPopupAnimateTypeAnimateIn = 0,
    JHGrandPopupAnimateTypeAnimateOut = 1,
};

@interface JHGrandPopupBaseAnimation : NSObject <JHGrandPopupAnimationProtocol, UIViewControllerAnimatedTransitioning>

@property (nonatomic, assign) CGFloat animateInDuration;

@property (nonatomic, assign) CGFloat animateOutDuration;

@property (nonatomic, assign) JHGrandPopupAnimateType animateType;

- (instancetype)initWithAnimateType:(JHGrandPopupAnimateType)animateType;

@end

NS_ASSUME_NONNULL_END
