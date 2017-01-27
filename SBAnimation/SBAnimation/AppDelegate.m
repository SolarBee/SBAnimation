//
//  AppDelegate.m
//  SBAnimation
//
//  Created by Programmer Sunny on 2017/1/12.
//  Copyright © 2017年 Programmer Sunny. All rights reserved.
//
//  This source code is licensed under the MIT-style license found in the
//  LICENSE file in the root directory of this source tree.
//

#import "AppDelegate.h"
#import <AVOSCloud/AVOSCloud.h>
#import "SBTestModel.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)leancloudIssue {
    [AVOSCloud setApplicationId:@"d6tROsGF4TuPOPru6KtSVKu2-gzGzoHsz" clientKey:@"wBKtYEFSTi5DIeUYKvuiDQej"];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self leancloudIssue];
  
    

    
    
    
    
    
    [SBTestModel getDataFromLeanCloudWithCompletationBlock:^(NSArray *array, NSError *error) {
        NSLog(@"%@===%@",array,error);
    }];

    return YES;
}



@end
