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
@property (nonatomic ,strong) NSMutableArray <SBTestModel *> *dataSource;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"SBAnimation";
    self.dataSource = [NSMutableArray array];
    [self getData];
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
    
- (void)getData {
    __weak typeof(self) weakSelf = self;
    [SBTestModel getDataFromLeanCloudWithCompletationBlock:^(NSArray *array, NSError *error) {
        if(!error && array.count > 0){
            for (NSInteger i = 0; i < array.count; i ++) {
                SBTestModel *model = [[SBTestModel alloc] init];
                model.authorName = [array[i] objectForKey:@"authorName"];
                model.animationGifUrl = [array[i] objectForKey:@"animationGifUrl"];
                model.animationName = [array[i] objectForKey:@"animationName"];
                model.authorName = [array[i] objectForKey:@"authorName"];
                [weakSelf.dataSource addObject:model];
            }
            [weakSelf.tableView reloadData];
        }
    }];
}

@end
