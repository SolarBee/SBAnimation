//
//  SYTaoBaoToViewController.m
//  SBAnimation
//
//  Created by Programmer Sunny on 2017/1/27.
//  Copyright © 2017年 Programmer Sunny. All rights reserved.
//
//  This source code is licensed under the MIT-style license found in the
//  LICENSE file in the root directory of this source tree.
//

#import "SYTaoBaoAnimationToViewController.h"
#import <BlocksKit/BlocksKit+UIKit.h>
#import "Masonry.h"


#ifndef SCREEN_WIDTH
//屏幕宽度
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#endif

#ifndef SCREEN_HEIGHT
//屏幕高度
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#endif

@interface SYTaoBaoAnimationToViewController ()

@property (nonatomic ,strong) UIImageView *headerImageView;

    
@end

@implementation SYTaoBaoAnimationToViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initInterface];
    // Do any additional setup after loading the view.
}

-(void)initInterface{
    
    self.Ps_scaleOfHeight = .75f;
    UIButton *buyButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.Ps_ContentView addSubview:buyButton];
    buyButton.backgroundColor = [UIColor orangeColor];
    [buyButton setTitle:@"立即购买" forState:UIControlStateNormal];
    [buyButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    buyButton.layer.cornerRadius = 2;
    __weak __typeof(self)weakSelf = self;
    [buyButton mas_makeConstraints:^(MASConstraintMaker *make) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        make.right.mas_equalTo(strongSelf.Ps_ContentView.mas_right).with.offset(- 1);
        make.bottom.mas_equalTo(strongSelf.Ps_ContentView.mas_bottom);
        make.height.mas_equalTo(@50);
        make.width.mas_equalTo(120);
    }];
    
    UIButton *shopCartButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.Ps_ContentView addSubview:shopCartButton];
    shopCartButton.backgroundColor = [UIColor purpleColor];
    [shopCartButton setTitle:@"加入购物车" forState:UIControlStateNormal];
    [shopCartButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    shopCartButton.layer.cornerRadius = 2;
    [shopCartButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(buyButton.mas_left).with.offset(-2);
        make.bottom.mas_equalTo(weakSelf.Ps_ContentView.mas_bottom);
        make.height.mas_equalTo(@50);
        make.width.mas_equalTo(120);
    }];
    
    UIImageView *headerImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"SYTaoBaoAnimation.jpg"]];
    headerImageView.backgroundColor = [UIColor orangeColor];
    [self.Ps_ContentView addSubview:headerImageView];
    headerImageView.layer.borderWidth = 1;
    headerImageView.layer.cornerRadius = 8;
    headerImageView.contentMode = UIViewContentModeScaleAspectFill;
    headerImageView.clipsToBounds = YES;
    [headerImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(@100);
        make.height.mas_equalTo(@100);
        make.centerY.mas_equalTo(self.Ps_ContentView.mas_top).with.offset(20);
        make.centerX.mas_equalTo(self.Ps_ContentView.mas_left).with.offset(70);
    }];
    self.headerImageView = headerImageView;
    [buyButton bk_whenTapped:^{
        [weakSelf ps_dismiss];
    }];
    
    [shopCartButton bk_whenTapped:^{
        [weakSelf shopCartAnimation];
    }];
    
    UILabel *advLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 50)];
    advLabel.numberOfLines = 0;
    [self.Ps_ContentView addSubview:advLabel];
    advLabel.backgroundColor = [UIColor whiteColor];
    advLabel.textAlignment = NSTextAlignmentCenter;
    advLabel.text = @"@author : Programer Sunny\n\n@github:\nhttps://github.com/ProgramerSunny/mydemos";
    advLabel.textColor = [UIColor blackColor];
    advLabel.font = [UIFont systemFontOfSize:20];
    [advLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        make.width.mas_equalTo(@300);
        make.centerX.mas_equalTo(strongSelf.Ps_ContentView.mas_centerX);
        make.centerY.mas_equalTo(strongSelf.Ps_ContentView.mas_centerY);
    }];
}
    
// 加入购物车的动画
- (void)shopCartAnimation {
    UIView *animationView = [self.headerImageView snapshotViewAfterScreenUpdates:NO];
    [self.Ps_ContentView addSubview:animationView];
    
    CABasicAnimation *rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 11.0 ];
    rotationAnimation.duration = 1.0;
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount = 0;
    
    //这个是让旋转动画慢于缩放动画执行
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [animationView.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
    });
    
    [UIView animateWithDuration:1.0 animations:^{
        animationView.frame = CGRectMake(SCREEN_WIDTH - 55, - SCREEN_HEIGHT * (1 - self.Ps_scaleOfHeight) + 30, 0, 0);
    } completion:^(BOOL finished) {
        //动画完成后做的事
        [animationView removeFromSuperview];
        [self ps_dismiss];
    }];
}



@end
