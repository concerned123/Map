//
//  BaseViewController.m
//  BaiDuMapDemo
//
//  Created by apple on 2018/6/12.
//  Copyright © 2018年 tanyun. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)dealloc {
    NSLog(@"%@--控制器释放", self);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    //加载自定义导航栏视图
    [self loadNavigation];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    //隐藏自带导航栏
    self.navigationController.navigationBarHidden = YES;
    
    if (self.navigationController.viewControllers.count > 1) {
        self.nav_backButton.hidden = NO;
        self.hidesBottomBarWhenPushed = YES;
    }
    
    [self.view bringSubviewToFront:self.navigationView];
}

#pragma mark - 设置导航栏
- (void)loadNavigation {
    [self.view addSubview:self.navigationView];
    [self.navigationView addSubview:self.nav_titleLabel];
    [self.navigationView addSubview:self.nav_leftButton];
    [self.navigationView addSubview:self.nav_rightButton];
    [self.navigationView addSubview:self.nav_backLabel];
    [self.navigationView addSubview:self.nav_backButton];
    [self.navigationView addSubview:self.nav_bottomLine];
    
    self.nav_leftButton.hidden = YES;
    self.nav_rightButton.hidden = YES;
    self.nav_backButton.hidden = YES;
    self.nav_bottomLine.hidden = YES;
}

//设置导航栏标题
- (void)setNavigationTitle:(NSString *)title {
    self.nav_titleLabel.text = title;
    self.nav_titleLabel.font = [UIFont boldSystemFontOfSize:18];
    self.nav_titleLabel.textColor = [UIColor whiteColor];
    
    if (title) {
        CGSize size = [Tools boundingAllRectWithSize:title font:[UIFont boldSystemFontOfSize:18] size:CGSizeMake(SCREEN_WIDTH, CGFLOAT_MAX)];
        //标题的最大长度 = 总长度 - 左右两侧按钮的宽度
        CGFloat startX = (self.nav_backButton.v_right + 15);
        self.nav_titleLabel.frame = CGRectMake(startX, NAV_HEIGHT - size.height - 13, SCREEN_WIDTH - startX * 2, size.height);
    }
    [self.view bringSubviewToFront:self.navigationView];
}

//设置导航栏左侧按钮
- (void)setNavigationLeftButtonTitle:(NSString *)title {
    self.nav_leftButton.hidden = NO;
    [self.nav_leftButton setTitle:title forState:(UIControlStateNormal)];
    [self.nav_leftButton setTitleColor:[UIColor blueColor] forState:(UIControlStateNormal)];
    CGSize size = [Tools sizeForText:title fontSize:17 size:CGSizeMake(SCREEN_WIDTH, CGFLOAT_MAX)];
    self.nav_leftButton.frame = CGRectMake(8, 32, size.width, 24);
    self.nav_leftButton.touchAreaInsets = UIEdgeInsetsMake(10, 8, 10, 8);
}

//设置导航栏右侧按钮
- (void)setNavigationRightButtonTitle:(NSString *)title {
    self.nav_rightButton.hidden = NO;
    [self.nav_rightButton setTitle:title forState:(UIControlStateNormal)];
    [self.nav_rightButton setTitleColor:[UIColor blueColor] forState:(UIControlStateNormal)];
    CGSize size = [Tools sizeForText:title fontSize:17 size:CGSizeMake(SCREEN_WIDTH, CGFLOAT_MAX)];
    self.nav_rightButton.frame = CGRectMake(SCREEN_WIDTH - 8 - size.width, NAV_HEIGHT - size.height - 13, size.width, size.height);
    self.nav_rightButton.touchAreaInsets = UIEdgeInsetsMake(10, 8, 10, 8);
}

//设置导航栏返回按钮的文字
- (void)setNavigationLeftBackTitle:(NSString *)title {
    [self.nav_backLabel layoutForFrame:CGRectMake(37.5, 0, 100, CGFLOAT_MAX) text:title];
    [self.nav_backLabel setV_centerY:self.nav_backButton.v_centerY];
    self.nav_backButton.touchAreaInsets = UIEdgeInsetsMake(33.5, 8.5, 10, self.nav_backLabel.v_right - self.nav_backButton.v_right);
}

#pragma mark - 导航栏视图操作事件
// 返回上级界面
- (void)popViewController:(UIButton *)btn {
    [self.navigationController popViewControllerAnimated:YES];
}

// 导航栏左侧按钮
- (void)leftButtonAction:(UIButton *)btn {
    
}

// 导航栏右侧按钮
- (void)rightButtonAction:(UIButton *)btn {
    
}

#pragma mark - 加载视图
- (void)showLoading {
    [self.view addSubview:self.loadingView];
    self.loadingView.hidden = NO;
    [self hideFailed];
    [self.view bringSubviewToFront:self.loadingView];
}

- (void)hideLoading {
    //隐藏所有加载视图或者错误提示视图
    self.loadingView.hidden = YES;
    [self hideFailed];
//    [MBProgressHUD hideLoadingFromWindow];
//    [MBProgressHUD hideLoadingFromView:self.view];
}

- (void)showFailed {
    
}

- (void)hideFailed {
    
}

//重新加载
- (void)reloadAction {
    [self hideLoading];
    //子类实现
}

#pragma mark - 空视图
- (void)showEmptyView {
    
}

- (void)hideEmptyView {
    
}

#pragma mark - 处理错误信息
- (void)handleTheErrorMessage:(NSError *)error {
    [self hideLoading];
    
}

#pragma mark - getter
//导航栏视图
- (UIView *)navigationView {
    if (!_navigationView) {
        _navigationView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, NAV_HEIGHT)];
    }
    return _navigationView;
}

//导航栏左侧按钮
- (UIButton *)nav_leftButton {
    if (!_nav_leftButton) {
        _nav_leftButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
        _nav_leftButton.backgroundColor = [UIColor whiteColor];
        _nav_leftButton.titleLabel.font = [UIFont systemFontOfSize:17];
        [_nav_leftButton addTarget:self action:@selector(leftButtonAction:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _nav_leftButton;
}

//导航栏右侧按钮
- (UIButton *)nav_rightButton {
    if (!_nav_rightButton) {
        _nav_rightButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
        _nav_rightButton.titleLabel.font = [UIFont systemFontOfSize:17];
        _nav_rightButton.touchAreaInsets = UIEdgeInsetsMake(15, 15, 13, 15);
        [_nav_rightButton addTarget:self action:@selector(rightButtonAction:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _nav_rightButton;
}

//导航栏标题
- (UILabel *)nav_titleLabel {
    if (!_nav_titleLabel) {
        _nav_titleLabel = [[UILabel alloc] initWithFrame:CGRectMake((SCREEN_WIDTH - 175)/2.0, 22, 175, 44)];
        _nav_titleLabel.textColor = [UIColor whiteColor];
        _nav_titleLabel.font = [UIFont boldSystemFontOfSize:17];
        _nav_titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _nav_titleLabel;
}

//导航栏底部的分割线
- (UIImageView *)nav_bottomLine {
    if (!_nav_bottomLine) {
        _nav_bottomLine = [[UIImageView alloc] initWithFrame:CGRectMake(0, NAV_HEIGHT - 1, SCREEN_WIDTH, 1)];
        //        _nav_bottomLine.backgroundColor =
    }
    return _nav_bottomLine;
}

//导航栏返回按钮 13 * 21
- (UIButton *)nav_backButton {
    if (!_nav_backButton) {
        _nav_backButton = [[UIButton alloc] initWithFrame:CGRectMake(13, NAV_HEIGHT - 17.7 - 13, 17.7, 17.7)];
        [_nav_backButton setImage:[UIImage imageNamed:@"navBack_nor"] forState:(UIControlStateNormal)];
        [_nav_backButton addTarget:self action:@selector(popViewController:) forControlEvents:(UIControlEventTouchUpInside)];
        _nav_backButton.touchAreaInsets = UIEdgeInsetsMake(33.5, 8.5, 10, 30);
    }
    return _nav_backButton;
}

- (UILabel *)nav_backLabel {
    if (!_nav_backLabel) {
        _nav_backLabel = [[UILabel alloc] init];
        _nav_backLabel.textColor = [UIColor whiteColor];
        _nav_backLabel.font = kFont(14);
    }
    return _nav_backLabel;
}

- (BaseLoadingView *)loadingView {
    if (!_loadingView) {
        _loadingView = [[BaseLoadingView alloc] initWithFrame:CGRectMake(0, NAV_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT - NAV_HEIGHT)];
    }
    return _loadingView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
