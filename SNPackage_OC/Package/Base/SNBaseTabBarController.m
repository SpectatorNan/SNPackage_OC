//
//  SNBaseTabBarController.m
//  refactorEatHome
//
//  Created by Spectator on 16/5/26.
//  Copyright © 2016年 Spectator. All rights reserved.
//

#import "SNBaseTabBarController.h"

#import "SNBaseNavigationController.h"
#import "Root_UserViewController.h"
#import "Root_MarketViewController.h"
#import "Root_ShopCartViewController.h"
#import "Root_RecommendViewController.h"
#import "TabarSelectedIndexRecord.h"

@interface SNBaseTabBarController ()


@end

@implementation SNBaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUp];
}

// tabbar  添加子控制器
- (void)setUp {
    
    Root_RecommendViewController *fav = [[Root_RecommendViewController alloc] init];
    UINavigationController *favNavi = [[SNBaseNavigationController alloc] initWithRootViewController:fav];
    
    
    Root_MarketViewController *market = [[Root_MarketViewController alloc] init];
    UINavigationController *marketNavi = [[SNBaseNavigationController alloc] initWithRootViewController:market];
    
    Root_ShopCartViewController *cart = [[Root_ShopCartViewController alloc] init];
    UINavigationController *cartNavi = [[SNBaseNavigationController alloc] initWithRootViewController:cart];
    
    Root_UserViewController *user = [[Root_UserViewController alloc] init];
    UINavigationController *userNavi = [[SNBaseNavigationController alloc] initWithRootViewController:user];
    
    
    /**
     * 以下两行代码目的在于手动设置让TabBarItem只显示图标，不显示文字，并让图标垂直居中。
     * 等效于在`-setUpTabBarItemsAttributesForController`方法中不传`CYLTabBarItemTitle`字段。
     * 更推荐后一种做法。
     */
    //        tabBarController.imageInsets = UIEdgeInsetsMake(4.5, 0, -4.5, 0);
    //        tabBarController.titlePositionAdjustment = UIOffsetMake(0, MAXFLOAT);
    
    // 在`-setViewControllers:`之前设置TabBar的属性，设置TabBarItem的属性，包括 title、Image、selectedImage。
    [self setUpTabBarItemsAttributesForController:self];
    
    
    [self setViewControllers:@[
                                           favNavi,
                                           marketNavi,
                                           cartNavi,
                                           userNavi
                                           ]];
    
    [self customizeTabBarAppearance:self];
    
    
}


/**
 *  在`-setViewControllers:`之前设置TabBar的属性，设置TabBarItem的属性，包括 title、Image、selectedImage。
 */
- (void)setUpTabBarItemsAttributesForController:(CYLTabBarController *)tabBarController {
    
    NSDictionary *dict1 = @{
                            CYLTabBarItemTitle : @"推荐",
                            CYLTabBarItemImage : @"is_tuijian",
                            CYLTabBarItemSelectedImage : @"is_tuijianxz",
                            };
    NSDictionary *dict2 = @{
                            CYLTabBarItemTitle : @"集市",
                            CYLTabBarItemImage : @"is_jishi",
                            CYLTabBarItemSelectedImage : @"is_jishixz",
                            };
    NSDictionary *dict3 = @{
                            CYLTabBarItemTitle : @"菜篮子",
                            CYLTabBarItemImage : @"is_gouwuche",
                            CYLTabBarItemSelectedImage : @"is_gouwuchexz",
                            };
    NSDictionary *dict4 = @{
                            CYLTabBarItemTitle : @"我的",
                            CYLTabBarItemImage : @"is_wode",
                            CYLTabBarItemSelectedImage : @"is_wodexz"
                            };
    NSArray *tabBarItemsAttributes = @[
                                       dict1,
                                       dict2,
                                       dict3,
                                       dict4
                                       ];
    tabBarController.tabBarItemsAttributes = tabBarItemsAttributes;
}


/**
 *  更多TabBar自定义设置：比如：tabBarItem 的选中和不选中文字和背景图片属性、tabbar 背景图片属性
 */
- (void)customizeTabBarAppearance:(CYLTabBarController *)tabBarController {
    
    // Customize UITabBar height
    // 自定义 TabBar 高度
    // tabBarController.tabBarHeight = 40.f;
    
    // set the text color for unselected state
    // 普通状态下的文字属性
    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
    normalAttrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    normalAttrs[NSFontAttributeName] =  [UIFont fontWithName:@"AvenirNext-Bold" size:12];
    
    // set the text color for selected state
    // 选中状态下的文字属性
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSForegroundColorAttributeName] = UICOLOR_ORANGE_NAVI;
    selectedAttrs[NSFontAttributeName] =  [UIFont fontWithName:@"AvenirNext-Bold" size:12];
    // set the text Attributes
    // 设置文字属性
    UITabBarItem *tabBar = [UITabBarItem appearance];
    [tabBar setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
    [tabBar setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
    
    // Set the dark color to selected tab (the dimmed background)
    // TabBarItem选中后的背景颜色
    // [self customizeTabBarSelectionIndicatorImage];
    
    // update TabBar when TabBarItem width did update
    // If your app need support UIDeviceOrientationLandscapeLeft or UIDeviceOrientationLandscapeRight，
    // remove the comment '//'
    // 如果你的App需要支持横竖屏，请使用该方法移除注释 '//'
    // [self updateTabBarCustomizationWhenTabBarItemWidthDidUpdate];
    
    // set the bar shadow image
    // This shadow image attribute is ignored if the tab bar does not also have a custom background image.So at least set somthing.
    [[UITabBar appearance] setBackgroundImage:[[UIImage alloc] init]];
    [[UITabBar appearance] setBackgroundColor:[UIColor whiteColor]];
    //    [[UITabBar appearance] setShadowImage:[UIImage imageNamed:@"tapbar_top_line"]];
    
    // set the bar background image
    // 设置背景图片
    // UITabBar *tabBarAppearance = [UITabBar appearance];
    // [tabBarAppearance setBackgroundImage:[UIImage imageNamed:@"tabbar_background"]];
    
    // remove the bar system shadow image
    // 去除 TabBar 自带的顶部阴影
    // [[UITabBar appearance] setShadowImage:[[UIImage alloc] init]];
}

- (void)updateTabBarCustomizationWhenTabBarItemWidthDidUpdate {
    void (^deviceOrientationDidChangeBlock)(NSNotification *) = ^(NSNotification *notification) {
        UIDeviceOrientation orientation = [[UIDevice currentDevice] orientation];
        if ((orientation == UIDeviceOrientationLandscapeLeft) || (orientation == UIDeviceOrientationLandscapeRight)) {
            SNLog(@"Landscape Left or Right !");
        } else if (orientation == UIDeviceOrientationPortrait){
            SNLog(@"Landscape portrait!");
        }
        [self customizeTabBarSelectionIndicatorImage];
    };
    [[NSNotificationCenter defaultCenter] addObserverForName:CYLTabBarItemWidthDidChangeNotification
                                                      object:nil
                                                       queue:[NSOperationQueue mainQueue]
                                                  usingBlock:deviceOrientationDidChangeBlock];
}

- (void)customizeTabBarSelectionIndicatorImage {
    ///Get initialized TabBar Height if exists, otherwise get Default TabBar Height.
    UITabBarController *tabBarController = [self cyl_tabBarController] ?: [[UITabBarController alloc] init];
    CGFloat tabBarHeight = tabBarController.tabBar.frame.size.height;
    CGSize selectionIndicatorImageSize = CGSizeMake(CYLTabBarItemWidth, tabBarHeight);
    //Get initialized TabBar if exists.
    UITabBar *tabBar = [self cyl_tabBarController].tabBar ?: [UITabBar appearance];
    [tabBar setSelectionIndicatorImage:
     [[self class] imageWithColor:[UIColor redColor]
                             size:selectionIndicatorImageSize]];
}

// 生成纯色的图片
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size {
    if (!color || size.width <= 0 || size.height <= 0) return nil;
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width + 1, size.height);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

//删除通知
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}



@end