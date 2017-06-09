//
//  MainViewController.m
//  BKTabarControllerDemo
//
//  Created by 张加宁 on 2017/6/8.
//  Copyright © 2017年 BlackKnife. All rights reserved.
//

#import "MainViewController.h"
#import "BKTabBarViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FourthViewController.h"
#import "JumpUpViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (IBAction)mainBtnAction:(UIButton *)sender
{
    FirstViewController * firstViewCtl = [[FirstViewController alloc] init];
    SecondViewController * secondViewCtl = [[SecondViewController alloc] init];
    ThirdViewController * thirdViewCtl = [[ThirdViewController alloc] init];
    FourthViewController * fourthViewCtl = [[FourthViewController alloc] init];
    NSArray *arrayOfViewCtl = @[firstViewCtl, secondViewCtl, thirdViewCtl, fourthViewCtl];
    
    NSArray *arrayOfTitle = @[@"首页", @"消息", @"发现", @"我的"];
    
    NSArray *arrayOfNormalImageName = @[@"tabbar_home",@"tabbar_message_center",@"tabbar_discover",@"tabbar_profile"];
    
    NSArray *arrayOfSelectedImageName  = @[@"tabbar_home_selected", @"tabbar_message_center_selected", @"tabbar_discover_selected", @"tabbar_profile_selected"];
    
    BKTabBarViewController *mainTabBarCtl = [[BKTabBarViewController customTabBarViewController] initWithChildViewControllerArray:arrayOfViewCtl TitleArray:arrayOfTitle ItemNormalImageNameArray:arrayOfNormalImageName ItemSelectedImageNameArray:arrayOfSelectedImageName];
    [mainTabBarCtl loadTabBarViewControllerMainFunction];
    
    __weak typeof(BKTabBarViewController*)weakSelf =mainTabBarCtl;
    weakSelf.mainTabBarView.blockToCenterButtonAction = ^
    {
        JumpUpViewController *additionalViewCtl = [[JumpUpViewController alloc] init];
        additionalViewCtl.modalPresentationStyle=UIModalPresentationOverCurrentContext;
        [mainTabBarCtl presentViewController:additionalViewCtl animated:YES completion:nil];
    };
    
    [self presentViewController:mainTabBarCtl animated:YES completion:nil];
}


@end
