//
//  ViewController.m
//  SBAnimation
//
//  Created by 孙扬 on 2017/1/12.
//  Copyright © 2017年 Programmer Sunny. All rights reserved.
//

#import "ViewController.h"
#import "SpeedoMeterView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view addSubview:({
    
        SpeedoMeterView *sp = [[NSBundle mainBundle] loadNibNamed:@"SpeedoMeterView" owner:self options:nil];
    
        sp;
    })];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
