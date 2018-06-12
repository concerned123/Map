//
//  UIView+Extension.h
//  PointLegend
//
//  Created by leon guo on 15/9/10.
//  Copyright (c) 2015年 CenturyGalaxyNetworkDevelopment. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface UIView (Extension)
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) CGPoint origin;
@property (nonatomic, assign) CGFloat bottom;
@property (nonatomic, assign) CGFloat right;
- (UIViewController *)viewcontroller;

- (CGFloat)v_height;
- (CGFloat)v_width;
- (CGFloat)v_x;
- (CGFloat)v_y;
- (CGSize)v_size;
- (CGPoint)v_origin;
- (CGFloat)v_centerX;
- (CGFloat)v_centerY;

- (CGFloat)v_left;
- (CGFloat)v_top;
- (CGFloat)v_bottom;
- (CGFloat)v_right;

- (void)setV_x:(CGFloat)x;
- (void)setV_left:(CGFloat)left;
- (void)setV_y:(CGFloat)y;
- (void)setV_top:(CGFloat)top;
- (void)setV_bottom:(CGFloat)bottom;
- (void)setV_right:(CGFloat)right;

// height
- (void)setV_height:(CGFloat)height;
- (void)heightEqualToView:(UIView *)view;

// width
- (void)setV_width:(CGFloat)width;
- (void)widthEqualToView:(UIView *)view;

// size
- (void)setV_size:(CGSize)size;
- (void)sizeEqualToView:(UIView *)view;

// center
- (void)setV_centerX:(CGFloat)centerX;
- (void)setV_centerY:(CGFloat)centerY;
- (void)centerXEqualToView:(UIView *)view;
- (void)centerYEqualToView:(UIView *)view;
- (void)centerEqualToView:(UIView *)view;

- (UIView *)topSuperView;

/**< 视图布局，适用于UILabel */
- (void)layoutForFrame:(CGRect)frame text:(NSString *)text;
- (void)layoutForFrame:(CGRect)frame;

@end
