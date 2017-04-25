//
//  EHUserIconCell.h
//  refactorEatHome
//
//  Created by Spectator on 2017/2/21.
//  Copyright © 2017年 Spectator. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kCellIdentifier_UserIconCell @"UserIconCell"

@interface EHUserIconCell : UITableViewCell
- (void)setTitle:(NSString *)title imageUrlString:(NSString *)image;
@property (nonatomic, copy) void(^tapImg)();
@property (nonatomic, strong, readonly) UIImageView *iconV;
@end
