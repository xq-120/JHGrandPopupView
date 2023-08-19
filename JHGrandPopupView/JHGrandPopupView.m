//
//  JHGrandPopupView.m
//  Pods-JHGrandPopupViewDemo
//
//  Created by xq on 2022/7/15.
//

#import "JHGrandPopupView.h"
#import "JHGrandPopupFadeAnimation.h"
#import "JHGrandPopupPresentAnimation.h"

@interface JHGrandPopupView ()

@property (nonatomic, strong) UIButton *backView;
@property (nonatomic, readwrite, strong) UIView * _Nonnull contentView;

@end

@implementation JHGrandPopupView

- (instancetype)init {
    return [self initWithFrame:CGRectZero];
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self _commonInit];
    }
    return self;
}

- (void)_commonInit {
    self.backgroundColor = [UIColor clearColor];
    _backViewBackgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.6];
    _shouldDismissOnTouchBackView = NO;
    self.backView.backgroundColor = self.backViewBackgroundColor;
    [self.backView addTarget:self action:@selector(backViewDidClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.backView];
    [self addSubview:self.contentView];
    
    self.backView.translatesAutoresizingMaskIntoConstraints = false;
    [NSLayoutConstraint constraintWithItem:self.backView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeading multiplier:1 constant:0].active = true;
    [NSLayoutConstraint constraintWithItem:self.backView attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTrailing multiplier:1 constant:0].active = true;
    [NSLayoutConstraint constraintWithItem:self.backView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1 constant:0].active = true;
    [NSLayoutConstraint constraintWithItem:self.backView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1 constant:0].active = true;
}

- (id<JHGrandPopupAnimationProtocol>)animator {
    id <JHGrandPopupAnimationProtocol> animatorObj = nil;
    switch (self.animationType) {
        case JHGrandPopupViewAnimationTypeFade:
            animatorObj = JHGrandPopupFadeAnimation.new;
            break;
        case JHGrandPopupViewAnimationTypePresent:
            animatorObj = JHGrandPopupPresentAnimation.new;
            break;
        default:
            break;
    }
    return animatorObj;
}

- (void)showWithCompletion:(void (^)(void))completion {
    [self showIn:nil completion:completion];
}

- (void)showIn:(UIView *)view completion:(void (^)(void))completion {
    [self showIn:view animated:YES completion:completion];
}

- (void)showIn:(UIView *)view animated:(BOOL)animated completion:(void (^)(void))completion {
    if (view == nil) {
        view = UIApplication.sharedApplication.delegate.window;
    }
    if (CGRectEqualToRect(self.frame, CGRectZero)) {
        self.frame = CGRectMake(0, 0, view.frame.size.width, view.frame.size.height);
    }
    [view addSubview:self];
    
    if (!animated) {
        completion == nil ? nil : completion();
        return;
    }
    id <JHGrandPopupAnimationProtocol> animatorObj = [self animator];
    [animatorObj animateInWithPopupView:self willAnimate:nil didAnimate:completion];
}

- (void)dismissWithCompletion:(void (^)(void))completion {
    [self dismissWithAnimated:YES completion:completion];
}

- (void)dismissWithAnimated:(BOOL)animated completion:(void (^)(void))completion {
    if (!animated) {
        [self removeFromSuperview];
        if (completion) {
            completion();
        }
        return;
    }
    id <JHGrandPopupAnimationProtocol> animatorObj = [self animator];
    [animatorObj animateOutWithPopupView:self willAnimate:nil didAnimate:^{
        [self removeFromSuperview];
        if (completion) {
            completion();
        }
    }];
}

- (void)backViewDidClicked:(id)sender {
    if (self.shouldDismissOnTouchBackView) {
        [self dismissWithCompletion:self.onTouchBackViewActionBlk];
    }
}

- (UIButton *)backView {
    if (_backView == nil) {
        _backView = [UIButton buttonWithType:UIButtonTypeCustom];
    }
    return _backView;
}

- (UIView *)contentView {
    if (_contentView == nil) {
        _contentView = [[UIView alloc] initWithFrame:CGRectZero];
        _contentView.backgroundColor = UIColor.whiteColor;
    }
    return _contentView;
}

@end
