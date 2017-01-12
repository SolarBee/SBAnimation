//
//  SBTestModel.h
//  SBAnimation
//
//  Created by Programmer Sunny on 2017/1/12.
//  Copyright © 2017年 Programmer Sunny. All rights reserved.
//
//  This source code is licensed under the MIT-style license found in the
//  LICENSE file in the root directory of this source tree.
//

#import <Foundation/Foundation.h>

@interface SBTestModel : NSObject

// 动画名称
@property (nonatomic ,copy) NSString *animationName;
// 动画缩略图
@property (nonatomic ,copy) NSString *animationGifUrl;
// 作者名字
@property (nonatomic ,copy) NSString *authorName;
// demo演示controller
@property (nonatomic ,copy) NSString *textControllerName;
@end
