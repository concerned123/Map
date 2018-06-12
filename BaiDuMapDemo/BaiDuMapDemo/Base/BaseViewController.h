//
//  BaseViewController.h
//  BaiDuMapDemo
//
//  Created by apple on 2018/6/12.
//  Copyright © 2018年 tanyun. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "BaseLoadingView.h"

@interface BaseViewController : UIViewController

#pragma mark - 导航栏视图
@property (nonatomic, strong) UIView *navigationView;                   /**< 自定义导航栏视图 */
@property (nonatomic, strong) UILabel *nav_titleLabel;                  /**< 导航栏标题 */
@property (nonatomic, strong) UIButton *nav_leftButton;                 /**< 导航栏左侧按钮 */
@property (nonatomic, strong) UIButton *nav_rightButton;                /**< 导航栏右侧按钮 */
@property (nonatomic, strong) UIButton *nav_backButton;                 /**< 导航栏返回按钮 */
@property (nonatomic, strong) UIImageView *nav_bottomLine;              /**< 导航栏底部的分割线 */
@property (nonatomic, strong) UILabel *nav_backLabel;                   /**< 返回按钮的文字 */

@property (nonatomic, strong) BaseLoadingView *loadingView;             /**< 加载视图 */

@property (nonatomic, assign) BOOL isRefresh;                           /**< 是否需要刷新，控制器首次进入时，需要刷新 */

/**< 设置导航栏标题 */
- (void)setNavigationTitle:(NSString *)title;
/** 设置导航栏左侧按钮 */
- (void)setNavigationLeftButtonTitle:(NSString *)title;
/** 设置导航栏右侧按钮 */
- (void)setNavigationRightButtonTitle:(NSString *)title;
/** 设置导航栏返回按钮的文字 */
- (void)setNavigationLeftBackTitle:(NSString *)title;

/** 返回上级界面 */
- (void)popViewController:(UIButton *)btn;
/** 导航栏左侧按钮 */
- (void)leftButtonAction:(UIButton *)btn;
/** 导航栏右侧按钮 */
- (void)rightButtonAction:(UIButton *)btn;

/** 显示加载视图 */
- (void)showLoading;
/** 隐藏加载视图 */
- (void)hideLoading;
/** 重新加载 子类实现 */
- (void)reloadAction;

#pragma mark - Empty
/** 显示空视图 */
- (void)showEmptyView;
/** 隐藏空视图 */
- (void)hideEmptyView;

/** 处理错误信息 */
- (void)handleTheErrorMessage:(NSError *)error;

@end
