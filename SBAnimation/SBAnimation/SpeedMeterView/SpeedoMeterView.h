//
//  testView.h
//  test
//
//  Created by HSY on 17/1/11.
//  Copyright © 2017年 SY HUANG. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface SpeedoMeterView : UIView
/** 指针百分比*/
@property (nonatomic,assign)IBInspectable CGFloat pointValue;
/** 虚线百分比*/
@property (nonatomic,assign)IBInspectable CGFloat averageValue;

@end
