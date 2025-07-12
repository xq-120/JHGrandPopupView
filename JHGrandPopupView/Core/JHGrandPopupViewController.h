//
//  JHBaseAlertViewController.h
//  Pods-JHGrandPopupViewDemo
//
//  Created by xuequan on 2020/9/13.
//

#import <UIKit/UIKit.h>
#import "JHGrandPopupDefine.h"

NS_ASSUME_NONNULL_BEGIN

// 弹窗为UIViewController
@interface JHGrandPopupViewController : UIViewController

/// 是否正在显示。默认实现为是否被添加到window上。
@property (nonatomic, assign, readonly) BOOL isShowing;

/// 优先级设置。默认0。
@property (nonatomic, assign) NSInteger priority;

/// 标识id
@property (nonatomic, copy) NSString *identify;

/// 由inViewController present 弹窗。
@property (nonatomic, weak, nullable) UIViewController *inViewController;

/// 蒙层视图
@property (nonatomic, strong, readonly) UIView *backView;

/// 点击蒙层时是否关闭弹窗
@property (nonatomic, assign) BOOL shouldDismissOnTouchBackView;

@property (nonatomic, copy) void (^ _Nullable onTouchBackViewActionBlk)(void);

/// 子类的所有子视图建议都添加在contentView上。
/// 在设置从左到右，从上到下的约束后，contentView的size是自适应的。
@property (nonatomic, readonly, strong) UIView * _Nonnull contentView;

/// 弹窗动画。默认为Fade,可自定义。
@property (nonatomic, strong) id<JHGrandPopupViewControllerAnimationProtocol> animator;

- (instancetype)init;

- (instancetype)initWithCoder:(NSCoder *)coder NS_UNAVAILABLE;

/// animated:YES
- (void)showIn:(nullable UIViewController *)viewController completion:(void (^ _Nullable)(void))completion;

- (void)showIn:(nullable UIViewController *)viewController animated:(BOOL)animated completion:(void (^ _Nullable)(void))completion;

/// 在指定viewController上弹出弹窗。
/// - Parameters:
///   - viewController: presenting viewController,传nil则使用当前顶层控制器。
///   - isWrap:弹窗控制器是否包裹在Navigation Controller里
///   - animated: 是否动画
///   - completion: 显示完成回调
- (void)showIn:(nullable UIViewController *)viewController
isWrapInNavigationController:(BOOL)isWrap
      animated:(BOOL)animated
    completion:(void (^ _Nullable)(void))completion;

/// animated:YES
- (void)hiddenWithCompletion:(void (^ _Nullable)(void))completion;

/// 关闭弹窗
/// - Parameters:
///   - animated: 是否动画
///   - completion: 关闭完成回调
- (void)hiddenWithAnimated:(BOOL)animated completion:(void (^ _Nullable)(void))completion;

@end

NS_ASSUME_NONNULL_END
