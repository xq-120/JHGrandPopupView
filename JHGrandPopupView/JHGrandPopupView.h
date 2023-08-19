//
//  JHGrandPopupView.h
//  Pods-JHGrandPopupViewDemo
//
//  Created by xq on 2022/7/15.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class JHGrandPopupView;

@protocol JHGrandPopupAnimationProtocol

- (void)animateInWithPopupView:(JHGrandPopupView * _Nonnull)popupView willAnimate:(void (^ _Nullable)(void))willAnimate didAnimate:(void (^ _Nullable)(void))didAnimate;

- (void)animateOutWithPopupView:(JHGrandPopupView * _Nonnull)popupView willAnimate:(void (^ _Nullable)(void))willAnimate didAnimate:(void (^ _Nullable)(void))didAnimate;

@end

typedef NS_ENUM(NSInteger, JHGrandPopupViewAnimationType) {
    JHGrandPopupViewAnimationTypeFade = 0,
    JHGrandPopupViewAnimationTypePresent = 1,
};

@interface JHGrandPopupView : UIView

@property (nonatomic, strong) UIColor * _Nonnull backViewBackgroundColor;

@property (nonatomic, assign) BOOL shouldDismissOnTouchBackView;

@property (nonatomic, copy) void (^ _Nullable onTouchBackViewActionBlk)(void);

/// 子类的所有子视图都应该添加在contentView上。
/// 在设置从左到右，从上到下的约束后，contentView的size是无需指定的。everything is self-adaptive。
@property (nonatomic, readonly, strong) UIView * _Nonnull contentView;

@property (nonatomic, assign) JHGrandPopupViewAnimationType animationType;

/// 初始化方法
///
/// 弹窗大小指定为frame，frame为zero时，弹窗大小为父视图大小。
- (nonnull instancetype)initWithFrame:(CGRect)frame NS_DESIGNATED_INITIALIZER;

- (instancetype)initWithCoder:(NSCoder *)coder NS_UNAVAILABLE;

/// 弹窗出现消失动画。
/// 子类可重写该方法返回一个自定义的动画。
/// returns: 动画执行者
- (id <JHGrandPopupAnimationProtocol> _Nonnull)animator;

/// 弹出弹窗。
/// 该弹窗会被添加在主window上。
/// param completion 显示完成回调
- (void)showWithCompletion:(void (^ _Nullable)(void))completion;

/// animated:YES
- (void)showIn:(UIView * _Nullable)view completion:(void (^ _Nullable)(void))completion;

/// 在指定view上弹出弹窗。传nil,该弹窗会被添加在主window上。
/// - Parameters:
///   - view: 父视图
///   - animated: 是否动画
///   - completion: 显示完成回调
- (void)showIn:(UIView * _Nullable)view animated:(BOOL)animated completion:(void (^ _Nullable)(void))completion;

/// animated:YES
- (void)dismissWithCompletion:(void (^ _Nullable)(void))completion;

/// 关闭弹窗
/// - Parameters:
///   - animated: 是否动画
///   - completion: 关闭完成回调
- (void)dismissWithAnimated:(BOOL)animated completion:(void (^ _Nullable)(void))completion;

@end

NS_ASSUME_NONNULL_END
