#import "BKTabBarViewController.h"
#import "BKNavigationController.h"


@interface BKTabBarViewController ()

@property (nonatomic, strong) NSMutableArray *mainChildViewControllerMarr;

@property (nonatomic, strong) NSMutableArray *mainTitleMarr;

@property (nonatomic, strong) NSMutableArray *mainItemNormalImageNameMarr;
@property (nonatomic, strong) NSMutableArray *mainItemSelectedImageNameMarr;

@end

@implementation BKTabBarViewController
#pragma mark - 系统方法
- (instancetype)init
{
    self = [super init];
    if (self)
    {
        self.mainChildViewControllerMarr = [[NSMutableArray alloc] init];
        
        self.mainTitleMarr = [[NSMutableArray alloc] init];
        
        self.mainItemNormalImageNameMarr = [[NSMutableArray alloc] init];
        self.mainItemSelectedImageNameMarr = [[NSMutableArray alloc] init];
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

#pragma mark ---------------------------------------------------------------------------


#pragma mark - [外部开放]方法
/**[初始化]**/
+ (instancetype)customTabBarViewController
{
    return  [[self alloc] init];
}
/**[设置基本参数]**/
- (instancetype)initWithChildViewControllerArray:(NSArray*)childViewControllerArray TitleArray:(NSArray*)titleArray ItemNormalImageNameArray:(NSArray*)normalImageNameArray ItemSelectedImageNameArray:(NSArray*)selectedImageNameArray
{
    self = [super init];
    if (self)
    {
        self.mainChildViewControllerMarr = [NSMutableArray arrayWithArray:childViewControllerArray];
        
        self.mainTitleMarr = [NSMutableArray arrayWithArray:titleArray];
        
        self.mainItemNormalImageNameMarr = [NSMutableArray arrayWithArray:normalImageNameArray];
        self.mainItemSelectedImageNameMarr = [NSMutableArray arrayWithArray:selectedImageNameArray];
    }
    return self;
}


/**[添加单一子控制器]到主控制器中**/
- (void)addChildViewControllerToMainMarr:(UIViewController*)childViewController
{
    [self.mainChildViewControllerMarr addObject:childViewController];
}

/**[添加单一标题]到主控制器中**/
- (void)addTitleToMainMarr:(NSString*)title
{
    [self.mainChildViewControllerMarr addObject:title];
}

/**[添加单一[普通]图像]到主控制器中**/
- (void)addItemNormalImageNameToMainMarr:(NSString*)normalImageName
{
    [self.mainItemNormalImageNameMarr addObject:normalImageName];
}

/**[添加单一[选中]图像]到主控制器中**/
- (void)addItemSelectedImageNameToMainMarr:(NSString*)selectedImageName
{
    [self.mainItemSelectedImageNameMarr addObject:selectedImageName];
}


/**最终加载[主方法]**/
- (void)loadTabBarViewControllerMainFunction
{
    for (int i=0; i<self.mainChildViewControllerMarr.count; i++)
    {
        UIViewController *currentViewCtl = self.mainChildViewControllerMarr[i];
        currentViewCtl.title = self.mainTitleMarr[i];
        BKNavigationController *currentNavCtl = [[BKNavigationController alloc] initWithRootViewController:currentViewCtl];
        
        UIImage *normalImage = [UIImage imageNamed:self.mainItemNormalImageNameMarr[i]];
        currentNavCtl.tabBarItem.image = normalImage;
        
        UIImage *selectedImage = [UIImage imageNamed:self.mainItemSelectedImageNameMarr[i]];
        selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        currentNavCtl.tabBarItem.selectedImage = selectedImage;
        
        [self addChildViewController:currentNavCtl];
    }
    
    self.mainTabBarView = [[BKTabBarView alloc] init];
    [self setValue:self.mainTabBarView forKey:@"tabBar"];
    
   
}

#pragma mark ---------------------------------------------------------------------------




@end
