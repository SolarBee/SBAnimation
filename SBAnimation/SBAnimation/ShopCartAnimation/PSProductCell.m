//
//  PSProductCell.m
//  ShopCartAnimation   GitHub: https://github.com/SolarBee/SBAnimation
//
//  Created by ProgramerSunny on 16/9/6.
//  Copyright © 2016年 ProgramerSunny. All rights reserved.
//
//  This source code is licensed under the MIT-style license found in the
//  LICENSE file in the root directory of this source tree.
//
#import "PSProductCell.h"

@implementation PSProductCell

+ (instancetype)cellWithTableView:(UITableView *)tableView {
    static NSString *identifier = @"PSProductCell";
    
    PSProductCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:identifier owner:nil options:nil] firstObject];
    }
    return cell;
}

- (IBAction)addToShopCartButtonClicked:(id)sender {
    if (self.animationBlock) {
        self.animationBlock();
    }
}
@end
