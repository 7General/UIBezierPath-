//
//  MainViewController.m
//  UIBezierPathPro
//
//  Created by 王会洲 on 16/12/21.
//  Copyright © 2016年 王会洲. All rights reserved.
//

#import "MainViewController.h"
#import "BasicView.h"
#import "CartogrameView.h"

@interface MainViewController ()
{
    CALayer *_tempLayer;//数据展示的折线图层
}

/**初始化*/
@property (nonatomic, strong) BasicView * basicViewSteup;
/**动画画折线图*/
@property (nonatomic, strong) CartogrameView * CartViewSteup;
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /**画折线图*/
    //self.basicViewSteup = [[BasicView alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, 400)];
    //[self.view addSubview:self.basicViewSteup];
    
    self.CartViewSteup = [[CartogrameView alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, 400)];
    [self.view addSubview:self.CartViewSteup];
    /**动画绘制线路*/
    [self drawBrokenLine];
}


- (void)drawBrokenLine{
    
    NSArray *numberArr = @[@-10,@0,@10,@20,@30,@40,@20,@30,@0,@30,@40,@-10,@20,@0,];
    
    CGFloat originY = 0;
    CGFloat originX = 0;//第一条竖线的横坐标
    CGFloat height = self.CartViewSteup.bounds.size.height;//表格的总高度
    CGFloat width = (self.view.bounds.size.width)/13;//两竖线之间的间距
    CGFloat space = height / 50;//每°代表的高度
    UIColor *roomColor = [UIColor redColor];
    
    _tempLayer = [CALayer layer];
    _tempLayer.position = CGPointMake(self.CartViewSteup.bounds.size.width/2, self.CartViewSteup.bounds.size.height/2);
    _tempLayer.bounds = CGRectMake(0, 0,self.CartViewSteup.bounds.size.width, self.CartViewSteup.bounds.size.height);
    _tempLayer.backgroundColor = [UIColor clearColor].CGColor;
    [self.CartViewSteup.layer addSublayer:_tempLayer];
    
    UIBezierPath *roomPath= [UIBezierPath bezierPath];
    CAShapeLayer *roomLine = [[CAShapeLayer alloc] init];
    // 填充色
    roomLine.strokeColor = roomColor.CGColor;
    // 区域填充
    roomLine.fillColor = [UIColor clearColor].CGColor;
    roomLine.lineWidth = 1;
    [_tempLayer addSublayer:roomLine];
    
    BOOL firstOfRoom = YES;
    for (int i = 0; i < 14; i ++) {
        int value = [numberArr[i] intValue];
        CGPoint roomCenter = CGPointMake(originX + width * i, originY+height-space*(value+10));
        [self drawCirile:roomCenter layer:_tempLayer color:roomColor];
        if (firstOfRoom){
            [roomPath moveToPoint:roomCenter];
            firstOfRoom = NO;
        }else{
            [roomPath addLineToPoint:roomCenter];
        }
    }
    roomLine.path = roomPath.CGPath;
    
    //折线的绘制动画
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.fromValue = @(0.0);
    animation.toValue = @(1.0);
    animation.duration = 2.0;
    [roomLine addAnimation:animation forKey:nil];
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = NO;
}


- (void)drawCirile:(CGPoint)center layer:(CALayer *)layer color:(UIColor *)color
{
    CALayer *roomCirile = [CALayer layer];
    roomCirile.position = center;
    roomCirile.bounds = CGRectMake(0, 0, 6, 6);
    roomCirile.cornerRadius = 3;
    roomCirile.masksToBounds = YES;
    roomCirile.backgroundColor = color.CGColor;
    [layer addSublayer:roomCirile];
}


@end
