//
//  DrawView.m
//  CustomTabbar
//
//  Created by ari on 2018/6/28.
//  Copyright © 2018年 ZKXT. All rights reserved.
//

#import "DrawView.h"

@implementation DrawView
-(void)drawRect:(CGRect)rect{

    [self sibianxing];
    [self circle];
    [self Oval];
    [self text];
    [self image];
    [self diffColorLine];
    [self colorLinearGradient];
}
-(void)sibianxing{
//    1.获取上下文
//    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    //2.描述路径
//    UIBezierPath * path = [UIBezierPath bezierPath];
    UIBezierPath * path = [UIBezierPath bezierPathWithRect:CGRectMake(10, 10, 90, 90)];

//    起点
//    [path moveToPoint:CGPointMake(10, 10)];
//    //终点
//    [path addLineToPoint:CGPointMake(10, 100)];
//    [path addLineToPoint:CGPointMake(100, 100)];
//    [path addLineToPoint:CGPointMake(100, 10)];
//    [path addLineToPoint:CGPointMake(10, 10)];
    
    CGContextAddPath(contextRef, path.CGPath);

    //设置描边颜色
    [[UIColor greenColor]setStroke];
    //显示描边路径
    CGContextStrokePath(contextRef);
    //设置填充颜色
    [[UIColor greenColor]set];
    //显示填充路径
//    CGContextFillPath(contextRef);
    
    //线宽
//    CGContextSetLineWidth(contextRef, 20);


}
-(void)circle{
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    //2.描述路径
    //ArcCenter:中心点
    //radius:半径
    //startAngle：起始角度  画半圆用到, 圆填0
    //endAngle：结束角度
    //clockwise：是否逆时针
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(55, 55) radius:44 startAngle:0 endAngle:M_PI*2 clockwise:NO];
    
    //3.添加路径到上下文
    CGContextAddPath(contextRef, path.CGPath);
    //4.设置颜色
    [[UIColor brownColor]setFill];
    [[UIColor brownColor]setStroke];
    //4.显示上下文 显示一个实心圆
    CGContextFillPath(contextRef);
    //显示一个空心圆，描边
//    CGContextStrokePath(contextRef);
}
-(void)Oval{//椭圆
    //1、获取当前上下文

    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    //2.描述路径 这是画椭圆的方法，大家都知道

    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(110, 10, 200, 40)];
    //3.添加路径到上下文
    CGContextAddPath(contextRef, path.CGPath);
    //4.设置颜色
    [[UIColor redColor] setStroke];
    //4.显示上下文
    CGContextStrokePath(contextRef);

}
-(void)text{
    //1、获取当前上下文
    
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    //2.创建文字
    NSString * str = @"阿玛尼";

    //设置字体样式
    NSMutableDictionary * dict = [NSMutableDictionary dictionary];
    //NSFontAttributeName:字体大小
    dict[NSFontAttributeName] = [UIFont systemFontOfSize:25];
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
    [str drawAtPoint:CGPointMake(130, 20) withAttributes:dict];
    //绘制到上下文
//    [str drawInRect:CGRectMake(110, 10, 200, 40) withAttributes:dict];
    CGContextStrokePath(contextRef);
}
-(void)image{
    //1.获取当前的上下文
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    //2.加载图片
    //这里顺便咯嗦一句：使用imageNamed加载图片是会有缓存的
    //我们这里只需要加载一次就够了，不需要多次加载，所以不应该保存这个缓存
//  UIImage * image = [UIImage imageNamed:@"t80x80"]; //所以可以换一种方式去加载
    UIImage *image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"t80x80" ofType:@"png"]];
    //    //绘制的大小位置
    //    [image drawInRect:rect];
    
    
    //    //从某个点开始绘制
    //    [image drawAtPoint:CGPointMake(0, 0)];
    
    
    //绘制一个多大的图片，并且设置他的混合模式以及透明度
    //Rect：大小位置
    //blendModel：混合模式
    //alpha：透明度
    CGRect rect ;
    rect.origin = CGPointMake(110, 60);
    rect.size = image.size;

    [image drawInRect:rect blendMode:kCGBlendModeNormal alpha:1];
    //从某一点开始绘制图片，并设置混合模式以及透明度
    //point:开始位置
    //blendModel：混合模式
    //alpha：透明度
    //    [image drawAtPoint:CGPointMake(0, 0) blendMode:kCGBlendModeNormal alpha:1];
    
    //添加到上下文
    CGContextFillPath(contextRef);
    
}
-(void)diffColorLine{
    UIBezierPath *path1 = [UIBezierPath bezierPath];
    UIBezierPath *path2 = [UIBezierPath bezierPath];
    UIBezierPath *path3 = [UIBezierPath bezierPath];

    //设置线宽
    path1.lineWidth = 5;
    path2.lineWidth = 5;
    path3.lineWidth = 5;

    //第一条线
    [[UIColor purpleColor]setStroke];
    [path1 moveToPoint:CGPointMake(10, 150)];
    [path1 addLineToPoint:CGPointMake(10, 250)];
    [path1 stroke];

    //第二条线
    [[UIColor orangeColor]setStroke];
    [path2 moveToPoint:CGPointMake(30, 150)];
    [path2 addLineToPoint:CGPointMake(30, 250)];
    [path2 stroke];

    //第三条线
    [[UIColor greenColor]setStroke];
    [path3 moveToPoint:CGPointMake(50, 150)];
    [path3 addLineToPoint:CGPointMake(50, 250)];
    
    //使用描边方式添加到上下文中
    [path3 stroke];

}
-(void)colorLinearGradient{
//    CGContextRef cntx = UIGraphicsGetCurrentContext();
//
//    CGContextMoveToPoint(cntx, 60, 150);
//    CGContextAddLineToPoint(cntx, 260, 150);
//    CGContextSetLineWidth(cntx, 3);
//    CGContextStrokePath(cntx);// 描边

    //4、释放内存
//    CGContextRelease(cntx);
    
    //1、获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    //3、创建一个颜色空间
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    //4、设置颜色的location
    CGFloat locations[] = { 0.0, 1.0 };
    //5、创建一个颜色数组，由于NSArray里面只能存对象，所以需要桥接
    NSArray *colors = @[(__bridge id)[UIColor redColor].CGColor,
                        (__bridge id)[UIColor blueColor].CGColor];
    
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef) colors, locations);
    //释放
    CFRelease(colorSpace);
    //保存一份当前上下文，压栈
    CGContextSaveGState(ctx);
    
    //绘制一个矩形，矩形足够小，也可以是一条线
    CGFloat width = self.frame.size.width;
    CGContextMoveToPoint(ctx, 0, 150);
    CGContextAddLineToPoint(ctx, width, 150);
    CGContextAddLineToPoint(ctx, width, 150);
    CGContextAddLineToPoint(ctx, 0, 150);
    //裁剪
    CGContextEOClip(ctx);
    //绘制渐变
    CGContextDrawLinearGradient(ctx, gradient, CGPointMake(0, 100), CGPointMake(self.frame.size.width, 100), kCGGradientDrawsBeforeStartLocation);
    
    //恢复一份当前的上下文，出栈
    CGContextRestoreGState(ctx);
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
