//
//  UIButton+TouchArea.m
//  BaiDuMapDemo
//
//  Created by apple on 2018/6/12.
//  Copyright © 2018年 tanyun. All rights reserved.
//

#import "UIButton+TouchArea.h"
#import <objc/runtime.h>

static char *touchKey;

@implementation UIButton (TouchArea)

#pragma mark - 给UIButton增加额外的点击区域
- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    UIEdgeInsets touchAreaInsets = self.touchAreaInsets;
    CGRect bounds = self.bounds;
    bounds = CGRectMake(bounds.origin.x - touchAreaInsets.left,
                        bounds.origin.y - touchAreaInsets.top,
                        bounds.size.width + touchAreaInsets.left + touchAreaInsets.right,
                        bounds.size.height + touchAreaInsets.top + touchAreaInsets.bottom);
    return CGRectContainsPoint(bounds, point);
}

- (void)setTouchAreaInsets:(UIEdgeInsets)touchAreaInsets {
    objc_setAssociatedObject(self, &touchKey, [NSValue valueWithUIEdgeInsets:touchAreaInsets], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
}

- (UIEdgeInsets)touchAreaInsets {
    NSValue *value = objc_getAssociatedObject(self, &touchKey);
    return [value UIEdgeInsetsValue];
}

@end
