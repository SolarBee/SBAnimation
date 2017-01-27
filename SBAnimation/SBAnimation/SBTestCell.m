//
//  SBTestCell.m
//  SBAnimation
//
//  Created by Programmer Sunny on 2017/1/12.
//  Copyright © 2017年 Programmer Sunny. All rights reserved.
//
//  This source code is licensed under the MIT-style license found in the
//  LICENSE file in the root directory of this source tree.
//

#import "SBTestCell.h"
#import "SBTestModel.h"
#import <YYWebImage/YYWebImage.h>

@interface SBTestCell ()

@property (weak, nonatomic) IBOutlet UILabel *animationNameLabel;

@property (weak, nonatomic) IBOutlet UILabel *authorNameLabel;

@property (weak, nonatomic) IBOutlet YYAnimatedImageView *gifImageView;
@end

@implementation SBTestCell

+ (instancetype)cellWithTableView:(UITableView *)tableView {
    static NSString *identifier = @"SBTestCell";
    SBTestCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:identifier owner:nil options:nil] firstObject];
    }
    return cell;
}

- (void)setItem:(SBTestModel *)item {
    _item = item;
    self.animationNameLabel.text = item.animationName;
    self.authorNameLabel.text = item.authorName;
    if ([item.animationGifUrl containsString:@"."]) {
        [self.gifImageView yy_setImageWithURL:[NSURL URLWithString:item.animationGifUrl]
                                  placeholder:nil
                                      options:YYWebImageOptionProgressiveBlur | YYWebImageOptionSetImageWithFadeAnimation
                                      manager:nil
                                     progress:nil
                                    transform:nil
                                   completion:nil];
    } else {
        self.gifImageView.image = [UIImage imageNamed:item.animationGifUrl];
    }

}
@end
