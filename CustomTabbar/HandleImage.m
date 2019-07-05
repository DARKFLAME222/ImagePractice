//
//  HandleImage.m
//  CustomTabbar
//
//  Created by ari on 2018/7/3.
//  Copyright © 2018年 ZKXT. All rights reserved.
//

#import "HandleImage.h"

@implementation HandleImage
-(void)drawRect:(CGRect)rect{
    UIImageView *imgV = [[UIImageView alloc]initWithImage:[self clipCircleImage]];
    imgV.frame = CGRectMake(50, 150, imgV.image.size.width, imgV.image.size.height);
    [self addSubview:imgV];
}
-(UIImage*)baseImage{
    //1.获取图片
    UIImage *image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"t80x80" ofType:@"png"]];
    //2.开启图形上下文
    UIGraphicsBeginImageContext(image.size);
    //3.绘制到图形上下文中
    [image drawInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    //4.从上下文中获取图片
    UIImage * newImage = UIGraphicsGetImageFromCurrentImageContext();
    //5.关闭图形上下文
    UIGraphicsEndImageContext();
    return newImage;

}
- (UIImage *)textwaterImage{
    //1.开启上下文
    UIImage *image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"t80x80" ofType:@"png"]];
    
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
    
    //2.绘制图片
    [image drawInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    
    //添加水印文字
    NSString * str = @"阿玛尼";
    
    //设置字体样式
    NSMutableDictionary * dict = [NSMutableDictionary dictionary];
    //NSFontAttributeName:字体大小
    dict[NSFontAttributeName] = [UIFont systemFontOfSize:14];
    //字体前景色
    dict[NSForegroundColorAttributeName] = [UIColor blueColor];
    //字体背景色
    dict[NSBackgroundColorAttributeName] = [UIColor redColor];
    //字体阴影
    NSShadow * shadow = [[NSShadow alloc]init];
    //阴影偏移量
    shadow.shadowOffset = CGSizeMake(2, 2);
    //阴影颜色
    shadow.shadowColor = [UIColor greenColor];
    //高斯模糊
    shadow.shadowBlurRadius = 5;
    
    dict[NSShadowAttributeName] = shadow;
    //字体间距
    dict[NSKernAttributeName] = @10;
    //绘制到上下文
    //从某一点开始绘制 默认 0 0点
    [str drawAtPoint:CGPointMake(0, 20) withAttributes:dict];
    //3.从上下文中获取新图片
    UIImage * newImage = UIGraphicsGetImageFromCurrentImageContext();
    //4.关闭图形上下文
    UIGraphicsEndImageContext();
    //返回图片
    return newImage;
    
}
- (UIImage*)imagewaterImage{
    //1.获取图片
    UIImage *image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"t80x80" ofType:@"png"]];
    //2.开启上下文
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
    //3.绘制背景图片
    [image drawInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    //绘制水印图片到当前上下文
    UIImage *waterImage = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"t80x80" ofType:@"png"]];

    [waterImage drawInRect:CGRectMake(0, 0, 22, 22)];
    //4.从上下文中获取新图片
    UIImage * newImage = UIGraphicsGetImageFromCurrentImageContext();
    //5.关闭图形上下文
    UIGraphicsEndImageContext();
    //返回图片
    return newImage;
    
}
-(UIImage*)clipCircleImage{
    UIImage *image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"t80x80" ofType:@"png"]];
    //1、开启上下文
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
    CGRect rect = CGRectMake(0, 0, image.size.width, image.size.height);
    CGFloat borderW = 3;
//带边框
//    //2、设置边框
    UIBezierPath * path = [UIBezierPath bezierPathWithOvalInRect:rect];
    [[UIColor purpleColor] setFill];
    [path fill];
//
//    //3、设置裁剪区域
    UIBezierPath * clipPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(rect.origin.x + borderW , rect.origin.x + borderW , rect.size.width - borderW * 2, rect.size.height - borderW *2)];
    
    [clipPath addClip];
    
    
//不带边框
//    //2、设置裁剪区域
//    UIBezierPath * path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
//;
//    [path addClip];
    
    //3、绘制图片
    [image drawAtPoint:CGPointZero];
    
    //4、获取新图片
    UIImage * newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    //5、关闭上下文
    UIGraphicsEndImageContext();
    
    //6、返回新图片
    return newImage;
}

+ (void)pq_cutScreenWithView:(nullable UIView *)view successBlock:(nullable void(^)(UIImage * _Nullable image,NSData * _Nullable imagedata))block{
    //1、开启上下文
    UIGraphicsBeginImageContext(view.bounds.size);
    
    //2.获取当前上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    //3.截屏
    [view.layer renderInContext:ctx];
    
    //4、获取新图片
    UIImage * newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    //5.转化成为Data
    //compressionQuality:表示压缩比 0 - 1的取值范围
    NSData * data = UIImageJPEGRepresentation(newImage, 1);
    //6、关闭上下文
    UIGraphicsEndImageContext();
    
    //7.回调
    block(newImage,data);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
