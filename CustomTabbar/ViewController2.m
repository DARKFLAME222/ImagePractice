//
//  ViewController2.m
//  CustomTabbar
//
//  Created by ari on 2018/5/31.
//  Copyright © 2018年 ZKXT. All rights reserved.
//

#import "ViewController2.h"
#import <ZKSDK/ZKSDK.h>

@interface ViewController2 ()

@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    HistoryView *hivc = [[HistoryView alloc]initWithDeviceId:@512412];
    [self.view addSubview:hivc];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
