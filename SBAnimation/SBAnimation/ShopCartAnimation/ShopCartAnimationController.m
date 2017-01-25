//
//  ShopCartAnimationController.m
//  ShopCartAnimation   GitHub: https://github.com/SolarBee/SBAnimation
//
//  Created by ProgramerSunny on 16/9/6.
//  Copyright © 2016年 ProgramerSunny. All rights reserved.
//
//  This source code is licensed under the MIT-style license found in the
//  LICENSE file in the root directory of this source tree.
//
#import "ShopCartAnimationController.h"
#import "ShopCartAnimation.h"
#import "PSProductCell.h"

@interface ShopCartAnimationController () <ShopCartAnimationDelegate, UITableViewDelegate, UITableViewDataSource>

@property (nonatomic ,strong) UIView *redView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIView *shopCartBottonView;
@property (weak, nonatomic) IBOutlet UIButton *shopcartButton;
@end

@implementation ShopCartAnimationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.rowHeight = 100;
    [ShopCartAnimation sharedAnimation].delegate = self;
    self.title = @"购物车抛物线";
    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)]) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
}

#pragma mark - UITableViewDelegate & UITableViewDataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PSProductCell *cell = [PSProductCell cellWithTableView:tableView];
    __weak typeof(self) weakSelf = self;
    __weak __typeof(&*cell)weakCell =cell;
    cell.animationBlock = ^(){
        CGRect parentRectA = [weakCell convertRect:weakCell.addToShopCartButton.frame toView:weakSelf.view];
        CGRect parentRectB = [weakSelf.shopCartBottonView convertRect:weakSelf.shopcartButton.frame toView:weakSelf.view];
            [weakSelf.view addSubview:weakSelf.redView];
            [[ShopCartAnimation sharedAnimation] throwObject:weakSelf.redView from:parentRectA.origin to:CGPointMake(parentRectB.origin.x, parentRectB.origin.y - 20) isHome:NO];
    };
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

#pragma mark - 设置购物车动画
- (void)animationDidFinish {
    [self.redView removeFromSuperview];
    [UIView animateWithDuration:0.1 animations:^{
        self.shopcartButton.transform = CGAffineTransformMakeScale(0.8, 0.8);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.1 animations:^{
            self.shopcartButton.transform = CGAffineTransformMakeScale(1, 1);
        } completion:^(BOOL finished) {
        }];
    }];
}

- (UIView *)redView {
    if (!_redView) {
        _redView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
        _redView.backgroundColor = [UIColor colorWithRed:255.0/255.0 green:115.0/255.0 blue:40.0/255.0 alpha:1.0];
        _redView.layer.cornerRadius = 10;
    }
    return _redView;
}
@end
