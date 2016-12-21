//
//  MainViewController.m
//  UIBezierPathPro
//
//  Created by 王会洲 on 16/12/21.
//  Copyright © 2016年 王会洲. All rights reserved.
//

#import "MainViewController.h"
#import "BasicView.h"

@interface MainViewController ()
/**初始化*/
@property (nonatomic, strong) BasicView * basicViewSteup;
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.basicViewSteup = [[BasicView alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, 400)];
    [self.view addSubview:self.basicViewSteup];
}

@end
