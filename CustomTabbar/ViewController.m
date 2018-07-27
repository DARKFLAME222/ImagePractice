//
//  ViewController.m
//  CustomTabbar
//
//  Created by ari on 2018/5/24.
//  Copyright © 2018年 ZKXT. All rights reserved.
//

#import "ViewController.h"
#import "ViewController1.h"
#import "ViewController2.h"
#import "ViewController3.h"
#import "DrawViewController.h"
#import "LMHttpPost.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:(58)/255.0f green:(166)/255.0f blue:(239)/255.0f alpha:(1)];
    self.navigationController.navigationBar.translucent = NO;
    UIButton *btn1 = [UIButton buttonWithType:(UIButtonTypeCustom)];
    btn1.frame = CGRectMake(30, 70, 60, 30);
    btn1.backgroundColor = [UIColor redColor];
    [btn1 setTitle:@"监控" forState:(UIControlStateNormal)];
    [btn1 addTarget:self action:@selector(tolocation) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:btn1];
    
    UIButton *btn2 = [UIButton buttonWithType:(UIButtonTypeCustom)];
    btn2.frame = CGRectMake(110, 70, 60, 30);
    btn2.backgroundColor = [UIColor redColor];
    [btn2 setTitle:@"轨迹" forState:(UIControlStateNormal)];
    [btn2 addTarget:self action:@selector(tohistory) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:btn2];
    
    UIButton *btn3 = [UIButton buttonWithType:(UIButtonTypeCustom)];
    btn3.frame = CGRectMake(190, 70, 60, 30);
    btn3.backgroundColor = [UIColor redColor];
    [btn3 setTitle:@"围栏" forState:(UIControlStateNormal)];
    [btn3 addTarget:self action:@selector(togeofence) forControlEvents:(UIControlEventTouchUpInside)];
    
    [self.view addSubview:btn3];
    
    UIButton *btn4 = [UIButton buttonWithType:(UIButtonTypeCustom)];
    btn4.frame = CGRectMake(190, 150, 60, 30);
    btn4.backgroundColor = [UIColor redColor];
    [btn4 setTitle:@"画图" forState:(UIControlStateNormal)];
    [btn4 addTarget:self action:@selector(login) forControlEvents:(UIControlEventTouchUpInside)];
    
    [self.view addSubview:btn4];
    
    
    
}
- (void)login{
    DrawViewController *vc = [[DrawViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
-(void)tolocation{
    ViewController1 *vc = [[ViewController1 alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
    
}
-(void)tohistory{
    ViewController2 *vc = [[ViewController2 alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
-(void)togeofence{
    ViewController3 *vc = [[ViewController3 alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
