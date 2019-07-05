//
//  ViewController3.m
//  CustomTabbar
//
//  Created by ari on 2018/5/31.
//  Copyright © 2018年 ZKXT. All rights reserved.
//

#import "ViewController3.h"
#import <ZKSDK/ZKSDK.h>

@interface ViewController3 ()

@end

@implementation ViewController3

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    GeofenceView *view = [[GeofenceView alloc]initWithData:nil DviceId:@512412];
    [self.view addSubview:view];
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
