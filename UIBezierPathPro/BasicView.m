//
//  BasicView.m
//  UIBezierPathPro
//
//  Created by 王会洲 on 16/12/21.
//  Copyright © 2016年 王会洲. All rights reserved.
//

#import "BasicView.h"

@implementation BasicView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor lightGrayColor];
    }
    return self;
}


-(void)drawRect:(CGRect)rect {
    // 画折线
    // 1: 获取数据上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    // 2: 画笔
    UIBezierPath * path = [[UIBezierPath alloc] init];
    // 3: 设置折线的起始点
    CGPoint startA = CGPointMake(0, 150);
    // 4: 画起始点
    [path moveToPoint:startA];
    
    // 画中间线
    [path addLineToPoint:CGPointMake(24, 120)];
    [path addLineToPoint:CGPointMake(45, 40)];
    [path addLineToPoint:CGPointMake(60,90)];
    [path addLineToPoint:CGPointMake(85,25)];
    [path addLineToPoint:CGPointMake(100,10)];
    [path addLineToPoint:CGPointMake(125,80)];
    [path addLineToPoint:CGPointMake(140,100)];
    [path addLineToPoint:CGPointMake(165,19)];
    [path addLineToPoint:CGPointMake(280,150)];
     // 连线1
    //    [path stroke];
    // 连线2
    CGContextAddPath(ctx, path.CGPath);
    CGContextSetLineWidth(ctx, 2);
    [[UIColor yellowColor] set];
    CGContextStrokePath(ctx);
    // 颜色填充
    CGContextAddPath(ctx, path.CGPath);
    CGContextSetRGBFillColor(ctx,215.0/255.0, 236.0/255.0, 177.0/255.0, 1.0);
    CGContextFillPath(ctx);
}

@end
