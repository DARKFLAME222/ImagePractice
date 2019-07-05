//
//  DrawViewController.m
//  CustomTabbar
//
//  Created by ari on 2018/6/28.
//  Copyright © 2018年 ZKXT. All rights reserved.
//

#import "DrawViewController.h"
#import "DrawView.h"
#import "HandleImage.h"
@interface DrawViewController ()

@property (nonatomic) UIImageView *wipeImageV;

@end

@implementation DrawViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    HandleImage *draw = [[HandleImage alloc]init];
//    draw.frame = self.view.bounds;
//    draw.backgroundColor = [UIColor whiteColor];
//    [self.view addSubview:draw];

//    UIButton *btn = [UIButton buttonWithType:(UIButtonTypeCustom)];
//    btn.frame = CGRectMake(10, 20, 30, 30);
//    btn.backgroundColor = [UIColor redColor];
//    [btn addTarget:self action:@selector(cut) forControlEvents:(UIControlEventTouchUpInside)];
//    [self.view addSubview:btn];
    
    UIImageView *imIv = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"mask"]];
    imIv.frame = self.view.bounds;
    [self.view addSubview:imIv];
    
    self.wipeImageV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"screen"]];
    self.wipeImageV.frame = self.view.bounds;
    [self.view addSubview:self.wipeImageV];
    self.wipeImageV.userInteractionEnabled = YES;
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(wipePanGestureEvent:)];
    [self.wipeImageV addGestureRecognizer:pan];
}
-(void)cut{//截屏
    [HandleImage pq_cutScreenWithView:self.view successBlock:^(UIImage * _Nullable image, NSData * _Nullable imagedata) {
        UIImageView *IV = [[UIImageView alloc]initWithImage:image];
        IV.frame = CGRectMake(120, 100, 300, 500);
        [self.view addSubview:IV];

    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

- (void)wipePanGestureEvent:(UIPanGestureRecognizer * )pan{//擦除
    //计算位置
    CGPoint nowPoint = [pan locationInView:self.wipeImageV];
    CGFloat offsetX = nowPoint.x - 10;
    CGFloat offsetY = nowPoint.y - 10;
    CGRect clipRect = CGRectMake(offsetX, offsetY, 20, 20);
    
    //开启上下文
    UIGraphicsBeginImageContextWithOptions(self.wipeImageV.bounds.size, NO, 1);
    //获取当前的上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    //把图片绘制上去
    [self.wipeImageV.layer renderInContext:ctx];
    
    //把这一块设置为透明
    CGContextClearRect(ctx, clipRect);
    
    //获取新的图片
    UIImage * newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    //关闭上下文
    UIGraphicsEndImageContext();
    
    //重新赋值图片
    self.wipeImageV.image = newImage;
    
}


@end
