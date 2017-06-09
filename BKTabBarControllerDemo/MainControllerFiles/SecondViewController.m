//
//  SecondViewController.m
//  BKAutoPageScrollViewDemo
//
//  Created by 张加宁 on 2017/5/26.
//  Copyright © 2017年 BlackKnife. All rights reserved.
//

#import "SecondViewController.h"

/**宏定义屏幕长宽以及其他参数**/
#define ScreenWidth   [UIScreen mainScreen].bounds.size.width
#define ScreenHeight  [UIScreen mainScreen].bounds.size.height
#define HeadHeight    20
#define NavigationItemHeight 44
#define TabBarItemHeight     49


@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blueColor];
    
    UIImageView *backgroundImageView = [[UIImageView alloc] init];
    backgroundImageView.frame = CGRectMake(0, HeadHeight + NavigationItemHeight, ScreenWidth, ScreenHeight - HeadHeight - NavigationItemHeight);
    [backgroundImageView setImage:[UIImage imageNamed:@"ImageOfTheElderScrolls02"]];
    [self.view addSubview:backgroundImageView];
    
    CGFloat mainBtnWidth = 100;
    CGFloat mainBtnHeight = 50;
    CGFloat mainBtnX = ScreenWidth/2 - mainBtnWidth/2;
    CGFloat mainBtnY = ScreenHeight/2 - mainBtnHeight/2;
    UIButton *mainBtn = [[UIButton alloc] init];
    mainBtn.frame = CGRectMake(mainBtnX, mainBtnY, mainBtnWidth, mainBtnHeight);
    [mainBtn setTitle:@"跳转" forState:UIControlStateNormal];
    mainBtn.titleLabel.font = [UIFont systemFontOfSize:40];
    [mainBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [mainBtn addTarget:self action:@selector(mainBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:mainBtn];
    
}


- (void)mainBtnAction
{
    UIViewController *nextViewCtl = [[UIViewController alloc] init];
    nextViewCtl.title = @"[消息]第二控制器";
    nextViewCtl.view.backgroundColor = [UIColor blueColor];
    UIImageView *backgroundImageView = [[UIImageView alloc] init];
    backgroundImageView.frame = CGRectMake(0, HeadHeight + NavigationItemHeight, ScreenWidth, ScreenHeight - HeadHeight - NavigationItemHeight);
    [backgroundImageView setImage:[UIImage imageNamed:@"ImageOfTheElderScrolls06"]];
    [nextViewCtl.view addSubview:backgroundImageView];
    
    [self.navigationController pushViewController:nextViewCtl animated:YES];
}


@end
