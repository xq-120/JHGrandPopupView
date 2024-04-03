//
//  JKBaseAlertViewController.m
//  JKPresentationController
//
//  Created by xuequan on 2020/9/13.
//

#import "JHBaseAlertViewController.h"

@interface JHBaseAlertViewController ()<UIViewControllerTransitioningDelegate>

@property (nonatomic, strong) UIButton *backView;
@property (nonatomic, readwrite, strong) UIView *contentView;

@end

@implementation JHBaseAlertViewController

- (UIColor *)jk_backViewBgColor {
    return self.backViewBgColor ?: [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
}

- (instancetype)init {
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        self.shouldDismissOnTouchBackView = NO;
        self.transitioningDelegate = self;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor clearColor];
    self.backView.backgroundColor = [UIColor clearColor];
    
    [self.view addSubview:self.backView];
    [self.view addSubview:self.contentView];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    self.backView.frame = self.view.frame;
}

- (CGRect)finalFrameForContentView {
    return self.contentView.frame;
}

- (void)backViewDidClicked:(UIButton *)sender {
    if (self.shouldDismissOnTouchBackView) {
        __weak typeof(self) weakSelf = self;
//        [self jk_hideWithAnimated:YES completion:^{
//            __strong typeof(self) strongSelf = weakSelf;
//            if (strongSelf == nil) {
//                return;
//            }
//            if (strongSelf.dismissOnTouchBackViewBlk) {
//                strongSelf.dismissOnTouchBackViewBlk();
//            }
//        }];
    }
}

- (UIButton *)backView {
    if (_backView == nil) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn addTarget:self action:@selector(backViewDidClicked:) forControlEvents:UIControlEventTouchUpInside];
        _backView = btn;
    }
    return  _backView;
}

- (UIView *)contentView {
    if (_contentView == nil) {
        UIView *view = [UIView new];
        view.backgroundColor = [UIColor whiteColor];
        _contentView = view;
    }
    return _contentView;
}

@end
