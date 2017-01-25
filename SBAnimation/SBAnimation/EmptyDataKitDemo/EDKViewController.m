//
//  EDKViewController.m
//  SBAnimation
//
//  Created by 孙扬 on 2017/1/26.
//  Copyright © 2017年 Programmer Sunny. All rights reserved.
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
    self.tableView.rowHeight = 100;
    __weak typeof(self) weakSelf = self;
    EmptyDataKit *kit = [[EmptyDataKit alloc] initWithEdk_Image:[UIImage imageNamed:@"shopcart_doggy"] edk_Message:@"对不起没有数据" edk_reloadHandler:^{
        [weakSelf getData];
    }];
    
    kit.edk_error_image = [UIImage imageNamed:@"network_error"];
    kit.edk_error_message = @"哈哈哈，网络挂啦";
    self.tableView.emptyKit = kit;
    
    
    UIBarButtonItem *errorItem = [[UIBarButtonItem alloc] initWithTitle:@"错误" style:UIBarButtonItemStyleDone target:self action:@selector(networkError)];
    
    UIBarButtonItem *deleteItem = [[UIBarButtonItem alloc] initWithTitle:@"删除" style:UIBarButtonItemStyleDone target:self action:@selector(networkError)];
    
    UIBarButtonItem *addItem = [[UIBarButtonItem alloc] initWithTitle:@"加载" style:UIBarButtonItemStyleDone target:self action:@selector(networkError)];
    
    self.navigationItem.leftBarButtonItems = @[addItem ,deleteItem];
    self.navigationItem.rightBarButtonItem = errorItem;
}

- (void)getData{
    for (NSInteger i = 0; i < 20; i ++) {
        [self.dataSource addObject:@1];
    }
    [self.tableView reloadData];
}

- (void)networkError {
    [self.dataSource removeAllObjects];
    self.tableView.emptyKit.edk_type = EDK_Error;
}

- (void)deleteData {
    [self.dataSource removeAllObjects];
    self.tableView.emptyKit.edk_type = EDK_Empty;
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
