//
//  ShoppingCartCell.h
//  refactorEatHome
//
//  Created by Spectator on 16/6/14.
//  Copyright © 2016年 Spectator. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShopCartCellModel.h"

@class ShopCartSelectButton;

#define kCellIdentifier_ShoppingCartCell @"UserInfoIconCell"


@interface ShoppingCartCell : UITableViewCell

@property (nonatomic, strong) ShopCartSelectButton *selectFlagBtn;

@property (nonatomic, strong) ShopCartCellModel *model;

@property (nonatomic, copy) void(^delCurrentCell)(ShoppingCartCell *current);

@property (nonatomic, copy) void(^refreshTotalPrice)();

- (void)del;
@end
