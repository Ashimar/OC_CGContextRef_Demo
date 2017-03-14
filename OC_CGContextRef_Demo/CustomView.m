//
//  CustomView.m
//  OC_CGContextRef_Demo
//
//  Created by 郑惠珠 on 2017/3/13.
//  Copyright © 2017年 Ashimar ZHENG. All rights reserved.
//

#import "CustomView.h"

@implementation CustomView
- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
    }
    return self;
}

/*  覆盖drawRect 方法，你可以在此处自定义绘画和动画
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
 */
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    // 1、 声明一个不透明类型Quartz 2D绘画环境，相当于一个画布，你可以在上面任意绘画
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // 绘制文字
    
    /*写文字*/
    // iOS 7之前的文字绘制 drawInRect:withFont:
    CGContextSetRGBFillColor (context,  1, 0, 0, 1.0);//设置填充颜色
    UIFont  *font = [UIFont boldSystemFontOfSize:15.0];//设置
    [@"画圆：" drawInRect:CGRectMake(10, 0, 80, 20) withFont:font];
    
    // iOS 7之后的文字绘制 drawInRect:withAttributes:
    NSDictionary *boldDic = @{NSFontAttributeName:[UIFont boldSystemFontOfSize:15.0],NSForegroundColorAttributeName:[UIColor redColor]};
    NSDictionary *dic = @{NSFontAttributeName:[UIFont systemFontOfSize:15.0],NSForegroundColorAttributeName:[UIColor redColor]};
    NSDictionary *italicDic = @{NSFontAttributeName:[UIFont italicSystemFontOfSize:15.0],NSForegroundColorAttributeName:[UIColor redColor]};
    [@"画圆" drawInRect:CGRectMake(10, 20, 80, 20) withAttributes:dic];
    [@"画线及孤线：" drawInRect:CGRectMake(10, 80, 100, 20) withAttributes:boldDic];
    [@"画矩形：" drawInRect:CGRectMake(10, 120, 80, 20) withAttributes:boldDic];
    [@"画扇形和椭圆：" drawInRect:CGRectMake(10, 160, 110, 20) withAttributes:dic];
    [@"画三角形：" drawInRect:CGRectMake(10, 220, 80, 20) withAttributes:italicDic];
    [@"画圆角矩形：" drawInRect:CGRectMake(10, 260, 100, 20) withAttributes:italicDic];
    [@"画贝塞尔曲线：" drawInRect:CGRectMake(10, 300, 100, 20) withAttributes:dic];
    [@"图片：" drawInRect:CGRectMake(10, 340, 80, 20) withAttributes:dic];
    
    //----------- 画圆
    /*
     typedef CF_ENUM (int32_t, CGPathDrawingMode) {
     kCGPathFill,   填充非零绕数规则
     kCGPathEOFill, 表示用奇偶规则
     kCGPathStroke, 路径
     kCGPathFillStroke, 路径填充
     kCGPathEOFillStroke 表示描线，不是填充
     };

     */
    // 边框圆
    CGContextSetRGBStrokeColor(context, 1, 1, 1, 1.0);  // 画笔线的颜色
    CGContextSetLineWidth(context, 1.0);    // 设置画笔的宽度
    CGContextAddArc(context, 100, 20, 15, 0, 2*M_PI*2, 0);  // 添加一个圆
    
     /* void CGContextAddArc(CGContextRef c,CGFloat x, CGFloat y,CGFloat radius,CGFloat startAngle,CGFloat endAngle, int clockwise)1弧度＝180°/π （≈57.3°） 度＝弧度×180°/π 360°＝360×π/180 ＝2π 弧度
     x,y为圆点坐标，radius半径，startAngle为开始的弧度，endAngle为 结束的弧度，clockwise 0为顺时针，1为逆时针。*/
    
    CGContextDrawPath(context, kCGPathStroke);  // 绘制路径
    
    // 填充圆 ，无边框
    CGContextAddArc(context, 150, 30, 30, 0, 2*M_PI, 0); // 绘制一个圆
    CGContextDrawPath(context, kCGPathFill);    // 绘制填充
    
    //
    UIColor *aColor = [UIColor colorWithRed:1 green:0.0 blue:0 alpha:1.0];
    CGContextSetFillColorWithColor(context, aColor.CGColor); // 设置填充颜色
    CGContextSetLineWidth(context, 3.0);    // 设置线宽
    CGContextAddArc(context, 250, 40, 40, 0, 2*M_PI, 0);    // 绘制一个圆
    CGContextDrawPath(context, kCGPathFillStroke);
    
    
    // ---------- 画线及弧线
    // 画线
    CGPoint aPoints[2]; // 坐标点
    aPoints[0] = CGPointMake(100, 80);  // 坐标1
    aPoints[1] = CGPointMake(130, 80);  // 坐标2
    // CGContextAddLines
    CGContextAddLines(context, aPoints, 2); // 添加线
    CGContextDrawPath(context, kCGPathStroke);  // 根据坐标绘制路径
    
    // 绘制笑脸弧线
    // 左
    CGContextSetRGBStrokeColor(context, 0, 0, 1, 1.0);  //   设置颜色
    CGContextMoveToPoint(context, 140, 80); // 开始坐标p1
    //CGContextAddArcToPoint(CGContextRef c, CGFloat x1, CGFloat y1,CGFloat x2, CGFloat y2, CGFloat radius)
    //x1,y1跟p1形成一条线的坐标p2，x2,y2结束坐标跟p3形成一条线的p3,radius半径,注意, 需要算好半径的长度,
    CGContextAddArcToPoint(context, 148, 68, 156, 80, 10);
    CGContextStrokePath(context);       // 绘制路径
    
    // 右
    CGContextMoveToPoint(context, 160, 80);
    CGContextAddArcToPoint(context, 168, 68, 176, 80, 10);
    CGContextStrokePath(context);   // 绘制路径
    
    // 嘴
    CGContextMoveToPoint(context, 150, 90); // 开始坐标
    CGContextAddArcToPoint(context, 158, 102, 166, 90, 10);
    CGContextStrokePath(context);//绘画路径
    //注，如果还是没弄明白怎么回事，请参考：http://donbe.blog.163.com/blog/static/138048021201052093633776/
    
    //------- 绘制矩形
    CGContextStrokeRect(context, CGRectMake(100, 120, 10, 10)); // 画方框
    CGContextFillRect(context, CGRectMake(120, 120, 10, 10));   // 填充方框
    // 矩形，并填充颜色
    CGContextSetLineWidth(context, 2.0);    // 线宽
    aColor = [UIColor blueColor];   // blue
    CGContextSetFillColorWithColor(context, aColor.CGColor);    // 填充颜色
    aColor = [UIColor yellowColor];
    CGContextSetStrokeColorWithColor(context, aColor.CGColor);  // 线宽颜色
    CGContextAddRect(context, CGRectMake(140, 120, 60, 30));    // 画方框
    CGContextDrawPath(context, kCGPathFillStroke);  //绘画路径
    
    //--------- 矩形，并填充渐变颜色
    //关于颜色参考http://blog.sina.com.cn/s/blog_6ec3c9ce01015v3c.html
    //http://blog.csdn.net/reylen/article/details/8622932
    //第一种填充方式，第一种方式必须导入类库quartcore并#import <QuartzCore/QuartzCore.h>，这个就不属于在context上画，而是将层插入到view层上面。那么这里就设计到Quartz Core 图层编程了。
    CAGradientLayer *gradient1 = [CAGradientLayer layer];
    gradient1.frame = CGRectMake(240, 120, 60, 30);
    gradient1.colors = [NSArray arrayWithObjects:
        (id)[UIColor whiteColor].CGColor,
                        (id)[UIColor grayColor].CGColor,
                        (id)[UIColor blackColor].CGColor,
                        (id)[UIColor yellowColor].CGColor,
                        (id)[UIColor purpleColor].CGColor,
                        (id)[UIColor blueColor].CGColor,
                        (id)[UIColor redColor].CGColor,
                        (id)[UIColor greenColor].CGColor,
                        (id)[UIColor orangeColor].CGColor,
                        (id)[UIColor brownColor].CGColor,
                        nil];
    [self.layer insertSublayer:gradient1 atIndex:0];
    
    // 第二种填充方式
    CGColorSpaceRef rgb = CGColorSpaceCreateDeviceRGB();
    CGFloat colors[] = {
        1,1,1, 1.00,
        1,1,0, 1.00,
        1,0,0, 1.00,
        1,0,1, 1.00,
        0,1,1, 1.00,
        0,1,0, 1.00,
        0,0,1, 1.00,
        0,0,0, 1.00,
    };
    CGGradientRef gradient = CGGradientCreateWithColorComponents(rgb, colors, NULL, sizeof(colors)/(sizeof(colors[0])*4));  // 形成梯形，渐变的效果
    CGColorSpaceRelease(rgb);
    
    // 绘制线性成一个矩形
    // CGContextSaveCGState 与 CGContextRestoreGState 的作用
    /*
     CGContextSaveGState函数的作用是将当前图形状态推入堆栈。之后，您对图形状态所做的修改会影响随后的描画操作，但不影响存储在堆栈中的拷贝。在修改完成后，您可以通过CGContextRestoreGState函数把堆栈顶部的状态弹出，返回到之前的图形状态。这种推入和弹出的方式是回到之前图形状态的快速方法，避免逐个撤消所有的状态修改；这也是将某些状态（比如裁剪路径）恢复到原有设置的唯一方式。
     */
    CGContextSaveGState(context);
    CGContextMoveToPoint(context, 220, 90);
    CGContextAddLineToPoint(context, 240, 90);
    CGContextAddLineToPoint(context, 240, 110);
    CGContextAddLineToPoint(context, 220, 110);
    CGContextClip(context); //  context 裁剪路径，后续操作的路径
    
    CGContextDrawLinearGradient(context, gradient, CGPointMake(220, 90), CGPointMake(240, 110), kCGGradientDrawsAfterEndLocation);
    CGContextRestoreGState(context);    // 恢复到之前的context
    
    // 再写一个看看效果
    CGContextSaveGState(context);
    CGContextMoveToPoint(context, 260, 90);
    CGContextAddLineToPoint(context, 280, 90);
    CGContextAddLineToPoint(context, 280, 100);
    CGContextAddLineToPoint(context, 260, 100);
    CGContextClip(context); // 裁剪路径
    
    CGContextDrawLinearGradient(context, gradient, CGPointMake(260, 90), CGPointMake(260, 100), kCGGradientDrawsAfterEndLocation);
    CGContextRestoreGState(context);    // 恢复到之前的context
    
     //下面再看一个颜色渐变的圆
    CGContextDrawRadialGradient(context, gradient, CGPointMake(300, 100), 0.0, CGPointMake(300, 100), 10, kCGGradientDrawsBeforeStartLocation);
    /*画扇形和椭圆*/
    //画扇形，也就画圆，只不过是设置角度的大小，形成一个扇形
    aColor = [UIColor purpleColor];
    CGContextSetFillColorWithColor(context, aColor.CGColor);    // 填充颜色
    // 以半径为10围绕圆心画指定角度扇形
    CGContextMoveToPoint(context, 160, 190);
    CGContextAddArc(context, 160, 190, 30, -60*M_PI/180, -120*M_PI/180, 1);
    CGContextClosePath(context);
    CGContextDrawPath(context, kCGPathFillStroke);  // 绘制路径
    
    //--------- 画椭圆  CGContextAddEllipseInRect
    CGContextAddEllipseInRect(context, CGRectMake(160, 200, 20, 8)) ; // 椭圆
    CGContextDrawPath(context, kCGPathFillStroke);    // 椭圆
    
    //--------- 画三角形
    // 只要三个点就行跟画一条线方式一样，把三点连接起来
    CGPoint sPoints[3]; // 坐标点
    sPoints[0] = CGPointMake(100, 200); // 坐标点1
    sPoints[1] = CGPointMake(130, 220); // 坐标点2
    sPoints[2] = CGPointMake(130, 160); // 坐标点3
    CGContextAddLines(context, sPoints, 3); // 添加线
    CGContextClosePath(context);        // 封起来
    CGContextDrawPath(context, kCGPathFillStroke);  // 根据坐标绘制路径
    
    //--------- 画圆角矩形
    float fw = 180;
    float fh = 280;
    
    CGContextMoveToPoint(context, fw, fh-20);   // 开始坐标右边开始
    CGContextAddArcToPoint(context, fw, fh, fw-20, fh, 10); // 右下角角度
    CGContextAddArcToPoint(context, 120, fh, 120, fh-20, 10); // 左下角角度
    CGContextAddArcToPoint(context, 120, 250, fw-20, 250, 10); // 左上角
    CGContextAddArcToPoint(context, fw, 250, fw, fh-20, 10); // 右上角
    CGContextClosePath(context);
    CGContextDrawPath(context, kCGPathFillStroke);  // 根据坐标绘制路径
    
    //--------- 画贝塞尔曲线 CGContextAddQuadCurveToPoint
    // 二次曲线
    CGContextMoveToPoint(context, 120, 300);    // 设置path 的起点
    CGContextAddQuadCurveToPoint(context, 190, 310, 120, 390);  // 设置贝塞尔曲线的控制点坐标和终点坐标
    CGContextStrokePath(context);
    
    // 三次曲线函数 CGContextAddCurveToPoint
    CGContextMoveToPoint(context, 200, 300);    // 设置path的起点
    CGContextAddCurveToPoint(context, 250, 280, 250, 400, 280, 300);    // 设置贝塞尔曲线的控制点坐标、控制点坐标和终点
    CGContextStrokePath(context);
    
    
    UIImage *image = [UIImage imageNamed:@"1"];
    [image drawInRect:CGRectMake(60, 340, 40, 40)]; //在坐标中画出图片
    //    [image drawAtPoint:CGPointMake(100, 340)];//保持图片大小在point点开始画图片，可以把注释去掉看看
    CGContextDrawImage(context, CGRectMake(60, 390, 40, 40), image.CGImage);//使用这个使图片上下颠倒了，参考http://blog.csdn.net/koupoo/article/details/8670024
    
    //    CGContextDrawTiledImage(context, CGRectMake(0, 0, 20, 20), image.CGImage);//平铺图
}


@end
