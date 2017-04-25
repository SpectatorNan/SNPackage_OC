//
//  UserInfoIconCell.h
//  refactorEatHome
//
//  Created by Spectator on 16/5/27.
//  Copyright © 2016年 Spectator. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "refactorEatHome-swift.h"

#define kCellIdentifier_UserInfoIconCell @"UserInfoIconCell"

@interface UserInfoIconCell : UITableViewCell


- (void)setTitle:(NSString *)title icon:(NSString *)iconName;
@end
