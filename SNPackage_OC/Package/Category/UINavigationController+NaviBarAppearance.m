//
//  UINavigationController+NaviBarAppearance.m
//  refactorEatHome
//
//  Created by Spectator on 16/7/22.
//  Copyright © 2016年 Spectator. All rights reserved.
//

#import "UINavigationController+NaviBarAppearance.h"
#import "UIImage+Color.h"

@implementation UINavigationController (NaviBarAppearance)

- (void)setNaviBarAppearance:(BOOL)appear {
    
    if (appear) {
        
//        NSDictionary *dic = @{
//                              NSForegroundColorAttributeName:UICOLOR_WHITE
//                              };
        self.navigationBar.barTintColor = UICOLOR_ORANGE_NAVI;
        self.navigationBar.tintColor = UICOLOR_WHITE;
        self.navigationBar.translucent = NO;
        [self.navigationBar setBackgroundImage: imageWithColor(UICOLOR_ORANGE_NAVI) forBarMetrics:UIBarMetricsDefault];
//        [self showHairLine];
//        self.navigationBar.titleTextAttributes = dic;
//        self.navigationItem.title = @"显示";
        
    } else {
//        NSDictionary *dic = @{
//                              NSForegroundColorAttributeName:UICOLOR_WHITE
//                              };
        self.navigationBar.barTintColor = nil;
        self.navigationBar.tintColor = nil;
        self.navigationBar.translucent = YES;
        [self.navigationBar setBackgroundImage: imageWithColor([UIColor clearColor]) forBarMetrics:UIBarMetricsDefault];
//        [self hideHairLine];
//        self.navigationItem.title = @"不显示";
//        self.navigationBar.titleTextAttributes = dic;
    }
}

- (void)hideHairLine {
    
    for (UIView *view in self.navigationBar.subviews) {
        if ([NSStringFromClass([view class]) isEqualToString:@"_UINavigationBarBackground"]) {
            view.hidden = YES;;
        }
    }
}

- (void)showHairLine {
    
    for (UIView *view in self.navigationBar.subviews) {
        if ([NSStringFromClass([view class]) isEqualToString:@"_UINavigationBarBackground"]) {
            view.hidden = NO;
        }
    }
}

@end
