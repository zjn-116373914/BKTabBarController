#import <UIKit/UIKit.h>

typedef void(^BlockOfTabBarView)(void);

@interface BKTabBarView : UITabBar

@property (nonatomic, copy) BlockOfTabBarView blockToCenterButtonAction;

@end
