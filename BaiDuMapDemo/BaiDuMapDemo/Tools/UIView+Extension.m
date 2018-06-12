//
//  UIView+Extension.m
//  PointLegend
//
//  Created by leon guo on 15/9/10.
//  Copyright (c) 2015年 CenturyGalaxyNetworkDevelopment. All rights reserved.
//


#import "UIView+Extension.h"

@implementation UIView (Extension)

- (void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)x
{
    return self.frame.origin.x;
}

- (CGFloat)y
{
    return self.frame.origin.y;
}

- (void)setCenterX:(CGFloat)centerX
{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

- (CGFloat)centerX
{
    return self.center.x;
}

- (void)setCenterY:(CGFloat)centerY
{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

- (CGFloat)centerY
{
    return self.center.y;
}

- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)height
{
    return self.frame.size.height;
}

- (CGFloat)width
{
    return self.frame.size.width;
}

- (void)setSize:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGSize)size
{
    return self.frame.size;
}

- (void)setOrigin:(CGPoint)origin
{
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGPoint)origin
{
    return self.frame.origin;
}

- (CGFloat)right {
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setRight:(CGFloat)right {
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}

- (CGFloat)bottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setBottom:(CGFloat)bottom {
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}

- (UIViewController *)viewcontroller
{
    UIResponder *rsp = self;
    while (![rsp isKindOfClass:[UIViewController class]]) {
        rsp = rsp.nextResponder;
    }
    return (UIViewController *)rsp;
}

#pragma mark - UIView的扩展
- (CGFloat)v_height {
    return self.frame.size.height;
}

- (CGFloat)v_width {
    return self.frame.size.width;
}

- (CGFloat)v_x {
    return self.frame.origin.x;
}

- (CGFloat)v_y {
    return self.frame.origin.y;
}

- (CGSize)v_size {
    return self.frame.size;
}

- (CGPoint)v_origin {
    return self.frame.origin;
}

- (CGFloat)v_centerX {
    return self.center.x;
}

- (CGFloat)v_centerY {
    return self.center.y;
}

- (CGFloat)v_left {
    return CGRectGetMinX(self.frame);
}

- (CGFloat)v_top {
    return CGRectGetMinY(self.frame);
}

- (CGFloat)v_bottom {
    return CGRectGetMaxY(self.frame);
}

- (CGFloat)v_right {
    return CGRectGetMaxX(self.frame);
}

- (void)setV_x:(CGFloat)x {
    self.frame = CGRectMake(x, self.frame.origin.y, self.frame.size.width, self.frame.size.height);
}

- (void)setV_left:(CGFloat)left {
    self.v_x = left;
}

- (void)setV_y:(CGFloat)y {
    self.frame = CGRectMake(self.frame.origin.x, y, self.frame.size.width, self.frame.size.height);
}

- (void)setV_top:(CGFloat)top {
    self.v_y = top;
}

- (void)setV_bottom:(CGFloat)bottom {
    self.frame = CGRectMake(self.frame.origin.x, bottom - self.frame.size.height, self.frame.size.width, self.frame.size.height);
}
- (void)setV_right:(CGFloat)right {
    self.frame = CGRectMake(right - self.frame.size.width, self.frame.origin.y, self.frame.size.width, self.frame.size.height);
}

// height
- (void)setV_height:(CGFloat)height {
    CGRect newFrame = CGRectMake(self.v_x, self.v_y, self.v_width, height);
    self.frame = newFrame;
}

- (void)heightEqualToView:(UIView *)view {
    self.v_height = view.v_height;
}

// width
- (void)setV_width:(CGFloat)width {
    CGRect newFrame = CGRectMake(self.v_x, self.v_y, width, self.v_height);
    self.frame = newFrame;
}

- (void)widthEqualToView:(UIView *)view {
    self.v_width = view.v_width;
}

// size
- (void)setV_size:(CGSize)size {
    self.frame = CGRectMake(self.v_x, self.v_y, size.width, size.height);
}

- (void)sizeEqualToView:(UIView *)view {
    self.frame = CGRectMake(self.v_x, self.v_y, view.v_width, view.v_height);
}

// center
- (void)setV_centerX:(CGFloat)centerX {
    CGPoint center = CGPointMake(self.v_centerX, self.v_centerY);
    center.x = centerX;
    self.center = center;
}

- (void)setV_centerY:(CGFloat)centerY {
    CGPoint center = CGPointMake(self.v_centerX, self.v_centerY);
    center.y = centerY;
    self.center = center;
}

- (void)centerXEqualToView:(UIView *)view {
    UIView *superView = view.superview ? view.superview : view;
    CGPoint viewCenterPoint = [superView convertPoint:view.center toView:self.topSuperView];
    CGPoint centerPoint = [self.topSuperView convertPoint:viewCenterPoint toView:self.superview];
    self.v_centerX = centerPoint.x;
}

- (void)centerYEqualToView:(UIView *)view {
    UIView *superView = view.superview ? view.superview : view;
    CGPoint viewCenterPoint = [superView convertPoint:view.center toView:self.topSuperView];
    CGPoint centerPoint = [self.topSuperView convertPoint:viewCenterPoint toView:self.superview];
    self.v_centerY = centerPoint.y;
}

- (void)centerEqualToView:(UIView *)view {
    UIView *superView = view.superview ? view.superview : view;
    CGPoint viewCenterPoint = [superView convertPoint:view.center toView:self.topSuperView];
    CGPoint centerPoint = [self.topSuperView convertPoint:viewCenterPoint toView:self.superview];
    self.v_centerX = centerPoint.x;
    self.v_centerY = centerPoint.y;
}

- (UIView *)topSuperView
{
    UIView *topSuperView = self.superview;
    
    if (topSuperView == nil) {
        topSuperView = self;
    } else {
        while (topSuperView.superview) {
            topSuperView = topSuperView.superview;
        }
    }
    
    return topSuperView;
}

#pragma mark - 视图布局，适用于UILabel
- (void)layoutForFrame:(CGRect)frame text:(NSString *)text {
    if ([self isKindOfClass:[UILabel class]]) {
        UILabel *label = (UILabel *)self;
        CGSize size = [Tools calculateTextSize:text maxSize:CGSizeMake(frame.size.width, frame.size.height) font:label.font];
        label.frame = CGRectMake(frame.origin.x, frame.origin.y, size.width, size.height);
        label.text = text;
    }
}

- (void)layoutForFrame:(CGRect)frame {
    if ([self isKindOfClass:[UILabel class]]) {
        UILabel *label = (UILabel *)self;
        CGSize size = [Tools calculateTextSize:label.text maxSize:CGSizeMake(frame.size.width, frame.size.height) font:label.font];
        label.frame = CGRectMake(frame.origin.x, frame.origin.y, size.width, size.height);
    }
}

@end
