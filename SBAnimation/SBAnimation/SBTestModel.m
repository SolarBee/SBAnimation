//
//  SBTestModel.m
//  SBAnimation
//
//  Created by Programmer Sunny on 2017/1/12.
//  Copyright © 2017年 Programmer Sunny. All rights reserved.
//
//  This source code is licensed under the MIT-style license found in the
//  LICENSE file in the root directory of this source tree.
//

#import "SBTestModel.h"
#import <AVOSCloud/AVOSCloud.h>

@implementation SBTestModel

 
    
+ (void)getDataFromLeanCloudWithCompletationBlock:(CompletationBlock)block {
    AVQuery *query = [AVQuery queryWithClassName:@"SBAnimationModel"];
    query.limit = 20;
    
//    [query whereKey:@"" equalTo:@""];
    
    [query findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
        block(objects ,error);
    }];
}


@end
