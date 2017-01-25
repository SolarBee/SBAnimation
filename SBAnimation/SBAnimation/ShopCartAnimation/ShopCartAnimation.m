//
//  ShopCartAnimation.m
//  ShopCartAnimation   GitHub: https://github.com/SolarBee/SBAnimation
//
//  Created by ProgramerSunny on 16/9/6.
//  Copyright © 2016年 ProgramerSunny. All rights reserved.
//
//  This source code is licensed under the MIT-style license found in the
//  LICENSE file in the root directory of this source tree.
//

#import "ShopCartAnimation.h"


@implementation ShopCartAnimation

+ (ShopCartAnimation *)sharedAnimation {
    static ShopCartAnimation *animation = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        animation = [[ShopCartAnimation alloc] init];
    });
    return animation;
}

- (void)throwObject:(UIView *)obj from:(CGPoint)start to:(CGPoint)end isHome:(BOOL)isHome{
    
    self.showingView = obj;
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(start.x, start.y)];
    
    if (isHome) {
            [path addQuadCurveToPoint:CGPointMake(end.x+25, end.y+25) controlPoint:CGPointMake(start.x - 10, start.y-80)];
        [self groupAnimation:path];
    }else {
        [path addQuadCurveToPoint:CGPointMake(end.x+25, end.y+25) controlPoint:CGPointMake(start.x - 180, start.y-200)];
        [self groupAnimation:path];
    }
}

#pragma mark - 组合动画
- (void)groupAnimation:(UIBezierPath *)path{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation.path = path.CGPath;
    animation.rotationMode = kCAAnimationRotateAuto;
    
    CABasicAnimation *expandAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    expandAnimation.duration = .5f;
    expandAnimation.fromValue = [NSNumber numberWithFloat:1];
    expandAnimation.toValue = [NSNumber numberWithFloat:1.0f];
    expandAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    
    CABasicAnimation *narrowAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    narrowAnimation.beginTime = 0.5;
    narrowAnimation.fromValue = [NSNumber numberWithFloat:1.0f];
    narrowAnimation.duration = 1.5f;
    narrowAnimation.toValue = [NSNumber numberWithFloat:1.0f];
    narrowAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    
    CAAnimationGroup *groups = [CAAnimationGroup animation];
    groups.animations = @[animation,expandAnimation,narrowAnimation];
    groups.duration = 0.5f;
    groups.removedOnCompletion = NO;
    groups.fillMode = kCAFillModeForwards;
    groups.delegate = self;
    [self.showingView.layer addAnimation:groups forKey:@"group"];
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    if (self.delegate && [self.delegate respondsToSelector:@selector(animationDidFinish)]) {
        [self.delegate performSelector:@selector(animationDidFinish) withObject:nil];
    }
    self.showingView = nil;
}
@end
