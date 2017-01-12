//
//  SBTestCell.h
//  SBAnimation
//
//  Created by Programmer Sunny on 2017/1/12.
//  Copyright © 2017年 Programmer Sunny. All rights reserved.
//
//  This source code is licensed under the MIT-style license found in the
//  LICENSE file in the root directory of this source tree.
//

#import <UIKit/UIKit.h>

@class SBTestModel;

@interface SBTestCell : UITableViewCell

@property (nonatomic ,strong) SBTestModel *item;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
