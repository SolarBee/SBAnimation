//
//  EDKViewController.m
//  EDKViewController   GitHub: https://github.com/SolarBee/SBAnimation
//
//  Created by ProgramerSunny on 16/9/6.
//  Copyright © 2016年 ProgramerSunny. All rights reserved.
//
//  This source code is licensed under the MIT-style license found in the
//  LICENSE file in the root directory of this source tree.
//

#import "EDKViewController.h"
#import <EmptyDataKit/EmptyDataKit.h>
#import "PSProductCell.h"

@interface EDKViewController ()<UITableViewDataSource ,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic ,strong) NSMutableArray *dataSource;
@end

@implementation EDKViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"EmptyDataKit";
    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)]) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    
    self.tableView.rowHeight = 100;
    self.tableView.tableFooterView = [UIView new];
    __weak typeof(self) weakSelf = self;
    EmptyDataKit *kit = [[EmptyDataKit alloc] initWithEdk_Image:[UIImage imageNamed:@"message_no_data_img"] edk_Message:@"对不起没有数据" edk_reloadHandler:^{
        [weakSelf getData];
    }];
    
    kit.edk_error_image = [UIImage imageNamed:@"network_error"];
    kit.edk_error_message = @"哈哈哈，网络挂啦";
    self.tableView.emptyKit = kit;
    
    UIBarButtonItem *errorItem = [[UIBarButtonItem alloc] initWithTitle:@"错误" style:UIBarButtonItemStyleDone target:self action:@selector(networkError)];
    
    UIBarButtonItem *deleteItem = [[UIBarButtonItem alloc] initWithTitle:@"删除" style:UIBarButtonItemStyleDone target:self action:@selector(deleteData)];
    
    UIBarButtonItem *addItem = [[UIBarButtonItem alloc] initWithTitle:@"加载" style:UIBarButtonItemStyleDone target:self action:@selector(getData)];
    
    self.navigationItem.leftBarButtonItems = @[addItem ,deleteItem];
    self.navigationItem.rightBarButtonItem = errorItem;
}

#pragma mark - Private method
- (void)getData{
    for (NSInteger i = 0; i < 20; i ++) {
        [self.dataSource addObject:@1];
    }
    [self.tableView reloadData];
}

- (void)networkError {
    [self.dataSource removeAllObjects];
    self.tableView.emptyKit.edk_type = EDK_Error;
    [self.tableView reloadData];
}

- (void)deleteData {
    [self.dataSource removeAllObjects];
    self.tableView.emptyKit.edk_type = EDK_Empty;
    [self.tableView reloadData];
}


#pragma mark - UITableViewDelegate & UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PSProductCell *cell = [PSProductCell cellWithTableView:tableView];
    return cell;
}

#pragma mark - Properties
- (NSMutableArray *)dataSource {
    if (_dataSource == nil) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}
@end
