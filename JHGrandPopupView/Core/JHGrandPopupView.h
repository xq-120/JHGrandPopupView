//
//  JHGrandPopupView.h
//  Pods-JHGrandPopupViewDemo
//
//  Created by xuequan on 2022/7/15.
//

#import <UIKit/UIKit.h>
#import "JHGrandPopupDefine.h"

NS_ASSUME_NONNULL_BEGIN

// 弹窗为UIView
@interface JHGrandPopupView : UIView

/// 是否正在显示。默认实现为是否被添加到window上。
@property (nonatomic, assign, readonly) BOOL isShowing;

/// 优先级设置。默认0。
@property (nonatomic, assign) NSInteger priority;

/// 标识id
@property (nonatomic, copy) NSString *identify;

/// 弹窗的父视图
@property (nonatomic, weak, nullable) UIView *inView;

/// 蒙层视图
@property (nonatomic, strong, readonly) UIView *backView;

/// 点击蒙层时是否关闭弹窗
@property (nonatomic, assign) BOOL shouldDismissOnTouchBackView;

@property (nonatomic, copy) void (^ _Nullable onTouchBackViewActionBlk)(void);

/// 子类的所有子视图建议都添加在contentView上。
/// 在设置从左到右，从上到下的约束后，contentView的size是自适应的。
@property (nonatomic, readonly, strong) UIView * _Nonnull contentView;

/// 弹窗动画。默认为Fade,可自定义。
@property (nonatomic, strong) id<JHGrandPopupViewAnimationProtocol> animator;

/// 初始化方法
///
/// 弹窗大小指定为frame。
- (nonnull instancetype)initWithFrame:(CGRect)frame NS_DESIGNATED_INITIALIZER;

- (instancetype)initWithCoder:(NSCoder *)coder NS_UNAVAILABLE;

/// 弹出弹窗。
/// 该弹窗会被添加在主window上。
/// param completion 显示完成回调
- (void)showWithCompletion:(void (^ _Nullable)(void))completion;

/// animated:YES
- (void)showIn:(UIView * _Nullable)view completion:(void (^ _Nullable)(void))completion;

/// 在指定view上弹出弹窗。
/// - Parameters:
///   - view: 父视图.传nil,该弹窗会被添加在app 主window上。
///   - animated: 是否动画
///   - completion: 显示完成回调
- (void)showIn:(UIView * _Nullable)view animated:(BOOL)animated completion:(void (^ _Nullable)(void))completion;

/// animated:YES
- (void)hiddenWithCompletion:(void (^ _Nullable)(void))completion;

/// 关闭弹窗
/// - Parameters:
///   - animated: 是否动画
///   - completion: 关闭完成回调
- (void)hiddenWithAnimated:(BOOL)animated completion:(void (^ _Nullable)(void))completion;

@end

NS_ASSUME_NONNULL_END
