//
//  BaseNavViewController.m
//  自定义
//
//  Created by 李李贤军 on 15/7/15.
//  Copyright (c) 2015年 TH. All rights reserved.
//

#import "BaseNavViewController.h"

@interface BaseNavViewController ()

@end

@implementation BaseNavViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    if ([self.navigationBar respondsToSelector:@selector(setBackgroundImage:forBarMetrics:)]) {
        [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"1"] forBarMetrics:UIBarMetricsDefault];
    }
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
@implementation UINavigationBar (custonBackGrund)

-(void)drawRect:(CGRect)rect
{
    UIImage * img  = [UIImage imageNamed:@"1"];
    [img drawInRect:rect];
}

@end
