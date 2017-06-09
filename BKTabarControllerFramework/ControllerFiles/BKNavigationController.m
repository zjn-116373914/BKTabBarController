#import "BKNavigationController.h"

@interface BKNavigationController ()

@end

@implementation BKNavigationController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if(self.viewControllers.count >0)
    {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    [super pushViewController:viewController animated:animated];
}



@end
