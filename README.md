# BKTabBarController
本框架是一个TabBarController底部菜单中心控制器.本框架在原UI TabBarController基本上添加了中心控制按钮,除了切换控制器外,中心控制按钮还能提供其他操作.

实例:


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

