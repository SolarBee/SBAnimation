//
//  PSProductCell.h
//  ShopCartAnimation   GitHub: https://github.com/SolarBee/SBAnimation
//
//  Created by ProgramerSunny on 16/9/6.
//  Copyright © 2016年 ProgramerSunny. All rights reserved.
//
//  This source code is licensed under the MIT-style license found in the
//  LICENSE file in the root directory of this source tree.
//

#import <UIKit/UIKit.h>

@interface PSProductCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIButton *addToShopCartButton;


@property (nonatomic ,copy)dispatch_block_t animationBlock;
+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
