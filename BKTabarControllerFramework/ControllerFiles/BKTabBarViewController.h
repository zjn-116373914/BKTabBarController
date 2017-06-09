#import <UIKit/UIKit.h>
#import "BKTabBarView.h"

@interface BKTabBarViewController : UITabBarController

/**[TabBar主视图]属性**/
@property (nonatomic, strong) BKTabBarView *mainTabBarView;

/**[初始化]**/
+ (instancetype)customTabBarViewController;
/**[设置基本参数]**/
- (instancetype)initWithChildViewControllerArray:(NSArray*)childViewControllerArray TitleArray:(NSArray*)titleArray ItemNormalImageNameArray:(NSArray*)normalImageNameArray ItemSelectedImageNameArray:(NSArray*)selectedImageNameArray;

/**[添加单一子控制器]到主控制器中**/
- (void)addChildViewControllerToMainMarr:(UIViewController*)childViewController;
/**[添加单一标题]到主控制器中**/
- (void)addTitleToMainMarr:(NSString*)title;
/**[添加单一[普通]图像]到主控制器中**/
- (void)addItemNormalImageNameToMainMarr:(NSString*)normalImageName;
/**[添加单一[选中]图像]到主控制器中**/
- (void)addItemSelectedImageNameToMainMarr:(NSString*)selectedImageName;

/**最终加载[主方法]**/
- (void)loadTabBarViewControllerMainFunction;

@end


