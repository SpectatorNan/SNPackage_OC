//
//  SNBaseViewController.m
//  refactorEatHome
//
//  Created by Spectator on 16/5/26.
//  Copyright © 2016年 Spectator. All rights reserved.
//

#import "SNBaseViewController.h"
#import <ReactiveCocoa.h>

@interface SNBaseViewController ()

@end

@implementation SNBaseViewController

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    
    SNBaseViewController *viewController = [super allocWithZone:zone];
    
    @weakify(viewController)
    
    [[viewController rac_signalForSelector:@selector(viewDidLoad)] subscribeNext:^(id x) {
        
        @strongify(viewController)
        
        [viewController eh_addSubviews];
        [viewController eh_responseBlock];
    }];
    
    [[viewController rac_signalForSelector:@selector(viewWillAppear:)] subscribeNext:^(id x) {
        
        @strongify(viewController)
        [viewController eh_layout];
        [viewController eh_getNewData];
    }];
    
    return viewController;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self customeControl];

}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)customeControl {
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    self.view.backgroundColor = [UIColor whiteColor];
    
}
// 第一次加载调用
- (void)eh_addSubviews {}
- (void)eh_responseBlock {}
// 每次界面出现调用
- (void)eh_layout  {}
- (void)eh_getNewData {}

@end
