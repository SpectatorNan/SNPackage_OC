//
//  SNBaseNavigationController.m
//  refactorEatHome
//
//  Created by Spectator on 16/5/26.
//  Copyright © 2016年 Spectator. All rights reserved.
//

#import "SNBaseNavigationController.h"


@interface SNBaseNavigationController ()

@property (nonatomic, strong) UIBarButtonItem *leftBackItem;

@end

@implementation SNBaseNavigationController

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    } else {
        viewController.hidesBottomBarWhenPushed = NO;
    }
    
    if (self.viewControllers.count > 0) {
        viewController.navigationItem.leftBarButtonItem = self.leftBackItem;
    } else {
        viewController.navigationItem.leftBarButtonItem = nil;
    }

    
    [super pushViewController:viewController animated:animated];
}

// 类方法 背景色和标题
+ (void)naviRootController:(UIViewController *)rootViewController naviTitle:(NSString *)title {
    
    SNBaseNavigationController *navi = [[SNBaseNavigationController alloc] initWithRootViewController:rootViewController];
    
    navi.navigationBar.barTintColor = UICOLOR_ORANGE_NAVI;
    navi.navigationItem.title = title;
}

//  自定义样式
- (instancetype)initWithRootViewController:(UIViewController *)rootViewController {
    
    self = [super initWithRootViewController:rootViewController];
    
//    if (!rootViewController.navigationItem.title) {
//        rootViewController.navigationItem.title = @"七农猪";
//    }

    if (!rootViewController.navigationItem.titleView) {
        UIImageView *naviView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"naviTitle"]];
        rootViewController.navigationItem.titleView = naviView;
    }
    // 设置状态栏颜色
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    
   
    
    //     设置字体属性
    UIColor *color = [UIColor whiteColor];
    NSDictionary *attributes = @{NSForegroundColorAttributeName: color, NSFontAttributeName: [UIFont systemFontOfSize:21]};
    self.navigationBar.titleTextAttributes = attributes;
    
    self.navigationBar.barTintColor = UICOLOR_ORANGE_NAVI;
    
    
    UIButton *leftButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    [leftButton addTarget:self action:@selector(backByPop) forControlEvents:UIControlEventTouchUpInside];
    [leftButton setImage:[UIImage imageNamed:@"Arrow-Left"] forState:UIControlStateNormal];
    UIBarButtonItem *leftBarItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    self.leftBackItem = leftBarItem;
    
    return self;
}

// 返回操作处理
- (void)backByPop {
    
    if ([self.backDelegate respondsToSelector:@selector(navigationBackButtonClicked)]) {
        
        [self.backDelegate navigationBackButtonClicked];
    } else {
        [self popViewControllerAnimated:YES];
    }
}

@end
