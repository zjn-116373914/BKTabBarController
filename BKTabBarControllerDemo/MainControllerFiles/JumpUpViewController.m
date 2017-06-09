#import "JumpUpViewController.h"

/**宏定义屏幕长宽以及其他参数**/
#define ScreenWidth   [UIScreen mainScreen].bounds.size.width
#define ScreenHeight  [UIScreen mainScreen].bounds.size.height
#define HeadHeight    20
#define NavigationItemHeight 44
#define TabBarItemHeight     49

@interface JumpUpViewController ()

@end

@implementation JumpUpViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //背景图像-[颜色]和[透明度]设置
    UIImageView *mainBackground = [[UIImageView alloc] init];
    mainBackground.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
    mainBackground.backgroundColor = [UIColor whiteColor];
    mainBackground.userInteractionEnabled = YES;
    mainBackground.alpha = 0.9;
    mainBackground.backgroundColor = [UIColor blackColor];
    [self.view addSubview:mainBackground];
    //----------------------------------------------------------------------------
    
    //背景图像-[颜色]和[透明度]设置
    CGFloat mainBtnWidth = 100;
    CGFloat mainBtnHeight = 50;
    UIButton *mainBtn = [[UIButton alloc] init];
    mainBtn.frame = CGRectMake(ScreenWidth/2 - mainBtnWidth/2, ScreenHeight/2 - mainBtnHeight/2,mainBtnWidth, mainBtnHeight);
    mainBtn.backgroundColor = [UIColor whiteColor];
    [mainBtn setTitle:@"返回" forState:UIControlStateNormal];
    [mainBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [mainBtn addTarget:self action:@selector(mainBtnAction) forControlEvents:UIControlEventTouchUpInside];
    //----------------------------------------------------------------------------
    
    [mainBackground addSubview:mainBtn];
}


- (void)mainBtnAction
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
