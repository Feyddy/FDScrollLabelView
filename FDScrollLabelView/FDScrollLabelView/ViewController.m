//
//  ViewController.m
//  FDScrollLabelView
//
//  Created by t3 on 2017/4/18.
//  Copyright © 2017年 feyddy. All rights reserved.
//

#import "ViewController.h"
#import "HSScrollLoopView.h"

#define MainScreenWidth    [UIScreen mainScreen].bounds.size.width
#define MainScreenHeight   [UIScreen mainScreen].bounds.size.height

@interface ViewController ()<HSScrollLoopViewDelegate>
{
    HSScrollLoopView *scView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    scView = [[HSScrollLoopView alloc] initWithFrame:CGRectMake(0, 70, MainScreenWidth, 30)];
    scView.delegate = self;
    [scView scrollLoopViewWithtext:@"Welcome to my blogSite: www.feyddy.com"];
    [self.view addSubview:scView];
    
}

- (void)scrollLoopViewCloseButtonAction:(HSScrollLoopView *)scrollLoopView {
    [scView removeFromSuperview];
    [scView stopTimer];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
