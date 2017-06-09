#import "BKTabBarView.h"
#import "UIView+Layout.h"

/**宏定义屏幕长宽以及其他参数**/
#define ScreenWidth   [UIScreen mainScreen].bounds.size.width
#define ScreenHeight  [UIScreen mainScreen].bounds.size.height
#define HeadHeight    20
#define NavigationItemHeight 44
#define TabBarItemHeight     49

@interface BKTabBarView()
{
    CGFloat _customBarBtnWidth;
    CGFloat _customBarBtnHeight;
}
@end

@implementation BKTabBarView

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    [self setupTabBarButtonItem];
    
}

//加载TabBarButtonItem所有控件
-(void)setupTabBarButtonItem
{
    NSInteger counOfBarButtonItem = self.items.count;
    NSInteger indexOfCenter;
    
    //判断[子控制器数量]是否为[偶数]
    if((counOfBarButtonItem%2) != 0)
    {
        NSLog(@"子控制器为奇数,UITabBar无法添加[中心按钮]");
        return;
    }
    else
    {
        indexOfCenter = counOfBarButtonItem/2;
    }
    //--------------------------------------------------------------------------------

    
    //移动原控件给[中间腾出空隙]
    _customBarBtnWidth = self.width/(counOfBarButtonItem+1);
    _customBarBtnHeight = self.height;
    int indexOfBarButtonItem = 0;
    for (UIView *customTabBarBtn in self.subviews)
    {
        //从UITabBar所有控件中通过isKindOfClass筛选出UITabBarButton控件
        if(![customTabBarBtn isKindOfClass:NSClassFromString(@"UITabBarButton")])
        {
            continue;
        }
        
        if(indexOfBarButtonItem <indexOfCenter)
        {
            customTabBarBtn.frame = CGRectMake(indexOfBarButtonItem * _customBarBtnWidth, 0, _customBarBtnWidth, _customBarBtnHeight);
        }
        else
        {
            customTabBarBtn.frame = CGRectMake((indexOfBarButtonItem+1) * _customBarBtnWidth, 0, _customBarBtnWidth, _customBarBtnHeight);
        }
        
        
        indexOfBarButtonItem = indexOfBarButtonItem + 1;
    }
    //--------------------------------------------------------------------------------
    
    //加载[中心按钮控件]
    [self setupCenterButton];
}

/**加载[中心按钮控件]**/
- (void)setupCenterButton
{
    UIButton *centerBtn = [[UIButton alloc] init];
    centerBtn.width = _customBarBtnWidth;
    centerBtn.height = _customBarBtnHeight;
    centerBtn.x = self.width/2 - centerBtn.width/2;
    centerBtn.y = 0;
    
    [centerBtn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button"] forState:UIControlStateNormal];
    [centerBtn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
    
    [centerBtn addTarget:self action:@selector(centerBtnAction) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:centerBtn];
}

- (void)centerBtnAction
{
    if(self.blockToCenterButtonAction != NULL)
    {
        self.blockToCenterButtonAction();
    }
    
}


@end
