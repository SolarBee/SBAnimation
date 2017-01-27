//
//  SYTaoBaoAnimationFromViewController.m
//  SBAnimation
//
//  Created by Programmer Sunny on 2017/1/27.
//  Copyright © 2017年 Programmer Sunny. All rights reserved.
//
//  This source code is licensed under the MIT-style license found in the
//  LICENSE file in the root directory of this source tree.
//

#import "SYTaoBaoAnimationFromViewController.h"
#import "SYTaoBaoAnimationToViewController.h"

@interface SYTaoBaoAnimationFromViewController ()

@property (nonatomic ,strong) UIImageView *imageView;

@end

@implementation SYTaoBaoAnimationFromViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"SYTaoBaoAnimation.jpg"]];
    [self.view addSubview:imageView];
    imageView.frame = self.view.frame;
    _imageView = imageView;

}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    SYTaoBaoAnimationToViewController *toVC = [SYTaoBaoAnimationToViewController new];
    toVC.Ps_backgroundImage = convertViewToImage(self.navigationController.view);
    [self presentViewController:toVC animated:NO completion:nil];
}



@end
