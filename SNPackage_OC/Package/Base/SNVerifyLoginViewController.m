//
//  SNVerifyLoginViewController.m
//  refactorEatHome
//
//  Created by Spectator on 16/5/27.
//  Copyright © 2016年 Spectator. All rights reserved.
//

#import "SNVerifyLoginViewController.h"
#import "User.h"
#import "LoginViewController.h"
#import "TabarSelectedIndexRecord.h"

@interface SNVerifyLoginViewController ()

@end

@implementation SNVerifyLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    

}

- (void)viewWillAppear:(BOOL)animated {
    
    
    
    BOOL status = [User shareUser].isLogin;
    
    if (!status) {
        
        LoginViewController *loginVC = [[LoginViewController alloc] init];
        
        loginVC.comeBack = ^(BOOL loginSuccess) {
          
            if (loginSuccess) {
                
            } else {
                self.tabBarController.selectedIndex = 0;
            }
        };
        GCD_ASYNC_MAINQUEUE(
//        [self.navigationController setNavigationBarHidden:NO animated:YES];
                            [self.navigationController pushViewController:loginVC animated:YES];);
    }
    
   [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
