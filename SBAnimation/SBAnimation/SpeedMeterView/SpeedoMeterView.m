//
//  testView.m
//  test
//
//  Created by HSY on 17/1/11.
//  Copyright © 2017年 SY HUANG. All rights reserved.
//

#define oneGrid M_PI/100 //一刻度

#import "SpeedoMeterView.h"

@interface SpeedoMeterView ()

@property (strong, nonatomic) IBOutlet UIView *view;
@property (weak, nonatomic) IBOutlet UIImageView *pointImageView;
@property (weak, nonatomic) IBOutlet UILabel *averageValueView;
@property (weak, nonatomic) IBOutlet UILabel *averageLabel;

@end

@implementation SpeedoMeterView


- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    
    if (self = [super initWithCoder:aDecoder]) {
        [self setUI];
    }
    return self;
}

- (void)setUI {
    
    [[NSBundle mainBundle]loadNibNamed:NSStringFromClass([self class]) owner:self options:nil];
    [self addSubview:self.view];
}

- (void)setPointValue:(CGFloat)pointValue {
    
    _pointValue = pointValue;
    [self setNeedsDisplay];
}

- (void)setAverageValue:(CGFloat)averageValue {
    
    _averageValue = averageValue;
    self.averageLabel.text = [NSString stringWithFormat:@"平均值%@",@(_averageValue)];
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    // 支点
    CGPoint newAnchorPoint = CGPointMake(1, 0.5);
    [self setAnchorPoint:newAnchorPoint forView:self.averageValueView];
    self.averageValueView.transform = CGAffineTransformRotate(self.averageValueView.transform, oneGrid * self.averageValue);
    [self setAnchorPoint:newAnchorPoint forView:self.pointImageView];
    self.pointImageView.transform = CGAffineTransformRotate(self.pointImageView.transform, oneGrid * self.pointValue);
}

- (void)setAnchorPoint:(CGPoint)anchorPoint forView:(UIView *)view {
    
    CGPoint oldOrigin = view.frame.origin;
    view.layer.anchorPoint = anchorPoint;
    CGPoint newOrigin = view.frame.origin;
    CGPoint transition;
    transition.x = newOrigin.x - oldOrigin.x;
    transition.y = newOrigin.y - oldOrigin.y;
    view.center = CGPointMake (view.center.x - transition.x, view.center.y - transition.y);
}

@end
