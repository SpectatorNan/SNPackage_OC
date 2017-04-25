//
//  SNBaseNavigationController.h
//  refactorEatHome
//
//  Created by Spectator on 16/5/26.
//  Copyright © 2016年 Spectator. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EHNavigationCustomDelegate.h"

@interface SNBaseNavigationController : UINavigationController<EHNavigationCustomDelegate>

@property (nonatomic, weak) id<EHNavigationCustomDelegate> backDelegate;

@end
