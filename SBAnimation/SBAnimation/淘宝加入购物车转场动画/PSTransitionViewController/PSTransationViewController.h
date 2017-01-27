//
//  PSTransationViewController.h
//  SBAnimation
//
//  Created by Programmer Sunny on 2016/6/23.
//  Copyright © 2017年 Programmer Sunny. All rights reserved.
//
//  This source code is licensed under the MIT-style license found in the
//  LICENSE file in the root directory of this source tree.
//


#import <UIKit/UIKit.h>


@interface PSTransationViewController : UIViewController

/**
 *  背景的View
 */
@property (nonatomic ,strong)UIImage *Ps_backgroundImage;

/**
 *  这个控制器的容器视图，不要用self.view 用self.PS_ContentView
 */
@property (nonatomic ,strong)UIView *Ps_ContentView;

/**
 *  contentView 高度比例
 */
@property (nonatomic ,assign)CGFloat Ps_scaleOfHeight;

/**
 *  maskView
 */
@property(nonatomic,strong) UIView * Ps_maskView;


/**
 *  重写了dismiss方法
 */
- (void)ps_dismiss;

/**
 *  空间转image
 */
UIImage* convertViewToImage(UIView* v);

@end
