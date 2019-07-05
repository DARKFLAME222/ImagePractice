//
//  ViewController1.m
//  CustomTabbar
//
//  Created by ari on 2018/5/31.
//  Copyright © 2018年 ZKXT. All rights reserved.
//

#import "ViewController1.h"
#import <ZKSDK/ZKSDK.h>
@interface ViewController1 ()

@end

@implementation ViewController1
- (void)viewDidLoad {
    [super viewDidLoad];
    LocationView *locationView = [[LocationView alloc]init];
    locationView.DeviceId = @512412;
    [locationView startTrcaking];
    [self.view addSubview:locationView];
    // Do any additional setup after loading the view.
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
//    LocationView *di = [self.view viewWithTag:1];
//    [di releaseTimer];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
