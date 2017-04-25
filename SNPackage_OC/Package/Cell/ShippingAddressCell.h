//
//  ShippingAddressCell.h
//  refactorEatHome
//
//  Created by Spectator on 16/6/17.
//  Copyright © 2016年 Spectator. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ShipAddressCellModel;

#define kCellIdentifier_ShipAddressCell @"ShipAddressCell"

@interface ShippingAddressCell : UITableViewCell

typedef void(^click)();

@property (nonatomic, strong) ShipAddressCellModel *model;

@property (nonatomic, copy) click clickEditBtn;

@property (nonatomic, copy) click clickDeleteBtn;

@property (nonatomic, copy) click clickDefaultBtn;


@end
