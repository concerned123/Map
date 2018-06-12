//
//  BaseLoadingView.m
//  BaiDuMapDemo
//
//  Created by apple on 2018/6/12.
//  Copyright © 2018年 tanyun. All rights reserved.
//

#import "BaseLoadingView.h"

static const NSInteger kSubLayerCount = 3;
static const CGFloat kAnimationDuration = 0.9;
static const CGFloat kSubLayerWidth = 8;
static const CGFloat kSubLayerSpace = 4;
static const CGFloat kSubLayerHeiht = 26;

@interface BaseLoadingView ()

@property (nonatomic, strong) CAReplicatorLayer *containerLayer;

@end

@implementation BaseLoadingView

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - 初始化
- (instancetype)init {
    if (self = [super init]) {
        [self initSubviews];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(beginAnimation) name:UIApplicationWillEnterForegroundNotification object:nil];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initSubviews];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(beginAnimation) name:UIApplicationWillEnterForegroundNotification object:nil];
    }
    return self;
}

#pragma mark - 布局视图
- (void)initSubviews {
    _containerLayer = [CAReplicatorLayer layer];
    _containerLayer.masksToBounds = YES;
    _containerLayer.instanceCount = kSubLayerCount;
    _containerLayer.instanceDelay = kAnimationDuration / _containerLayer.instanceCount;
    _containerLayer.instanceTransform = CATransform3DMakeTranslation(kSubLayerWidth + kSubLayerSpace, 0, 0);
    [self.layer addSublayer:_containerLayer];
}

- (void)willMoveToSuperview:(UIView *)newSuperview {
    [super willMoveToSuperview:newSuperview];
    
    CGFloat width = kSubLayerWidth * kSubLayerCount + (kSubLayerCount - 1) * kSubLayerSpace;
    
    CGSize size = self.frame.size;
    _containerLayer.frame = CGRectMake((size.width - width)/2.0, (size.height - kSubLayerHeiht)/2.0, width, kSubLayerHeiht);
}

#pragma mark - 开始动画
- (void)beginAnimation {
    CALayer *subLayer1 = [CALayer layer];
    subLayer1.backgroundColor = [UIColor colorWithRed:0 green:206/255.0 blue:209/255.0 alpha:1].CGColor;
    subLayer1.frame = CGRectMake(0, kSubLayerHeiht - 6, kSubLayerWidth, kSubLayerHeiht);
    subLayer1.cornerRadius = 2;
    [_containerLayer addSublayer:subLayer1];
    CABasicAnimation *animation1 = [CABasicAnimation animationWithKeyPath:@"position.y"];
    animation1.fromValue = @(kSubLayerHeiht * 1.5 - 6);
    animation1.toValue = @(kSubLayerHeiht * 0.5);
    animation1.repeatCount = HUGE;
    animation1.duration = kAnimationDuration;
    animation1.autoreverses = YES;
    [subLayer1 addAnimation:animation1 forKey:nil];
}

@end
