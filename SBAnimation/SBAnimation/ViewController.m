//
//  ViewController.m
//  SBAnimation
//
//  Created by Programmer Sunny on 2017/1/12.
//  Copyright © 2017年 Programmer Sunny. All rights reserved.
//
//  This source code is licensed under the MIT-style license found in the
//  LICENSE file in the root directory of this source tree.
//

#import "ViewController.h"
#import "SBTestCell.h"
#import "SBTestModel.h"

@interface ViewController ()<UITableViewDelegate , UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic ,strong) NSArray <SBTestModel *> *dataSource;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"SBAnimation";
    _tableView.tableFooterView = [UIView new];
    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)]) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SBTestCell *cell = [SBTestCell cellWithTableView:tableView];
    cell.item = self.dataSource[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Class clz = NSClassFromString(self.dataSource[indexPath.row].textControllerName);
    UIViewController *vc = [[clz alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (NSArray *)dataSource {
    if (_dataSource == nil) {
        NSArray *animationNameArray = @[@"仪表盘",
                                        @"购物车抛物线",
                                        @"列表空数据展示"];
        NSArray *authorNameArray = @[@"猫咪瞎跳",
                                     @"Programer Sunny",
                                     @"Programer Sunny"
                                     ];
        NSArray *animationGifUrlArray = @[@"http://ojno1pj4x.bkt.clouddn.com/91B9BB1D47A45C3FD69A20FB5813C31F.jpg",
                                          @"shopcart_doggy",
                                          @"shopcart_doggy"];
        NSArray *testDemoControllerArray = @[@"SpeedMeterTestViewController",
                                             @"ShopCartAnimationController",
                                             @""];
        
        NSMutableArray *dataSourceArray = [NSMutableArray array];
        for (NSInteger i = 0; i < animationNameArray.count ; i ++) {
            SBTestModel *model = [[SBTestModel alloc] init];
            model.animationName = animationNameArray[i];
            model.animationGifUrl = animationGifUrlArray[i];
            model.authorName = authorNameArray[i];
            model.textControllerName = testDemoControllerArray[i];
            [dataSourceArray addObject:model];
        }
        _dataSource = dataSourceArray;
    }
    return _dataSource;
}
@end
