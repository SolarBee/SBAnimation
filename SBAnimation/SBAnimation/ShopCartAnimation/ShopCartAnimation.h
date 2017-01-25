//
//  ShopCartAnimation.h
//  ShopCartAnimation   GitHub: https://github.com/SolarBee/SBAnimation
//
//  Created by ProgramerSunny on 16/9/6.
//  Copyright © 2016年 ProgramerSunny. All rights reserved.
//
//  This source code is licensed under the MIT-style license found in the
//  LICENSE file in the root directory of this source tree.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@protocol ShopCartAnimationDelegate;

@interface ShopCartAnimation : NSObject<CAAnimationDelegate>


@property (nonatomic ,weak) id <ShopCartAnimationDelegate>delegate;
@property (nonatomic ,strong) UIView *showingView;

+ (ShopCartAnimation *)sharedAnimation;

/**
 将某个view或者layer从起点抛到终点

 @param obj 被抛的物体
 @param start 起点坐标
 @param end 终点坐标
 */
- (void)throwObject:(UIView *)obj from:(CGPoint)start to:(CGPoint)end isHome:(BOOL)isHome;

@end

@protocol ShopCartAnimationDelegate <NSObject>

/**
 抛物线结束的回调
 */
- (void)animationDidFinish;

@end
