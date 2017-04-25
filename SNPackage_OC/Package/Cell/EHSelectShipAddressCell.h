//
//  EHSelectShipAddressCell.h
//  refactorEatHome
//
//  Created by Spectator on 2017/2/7.
//  Copyright © 2017年 Spectator. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kCellIdentifier_SelectShipAddressCell @"selectShipAddressCell"
@class ShipAddressCellModel;
@interface EHSelectShipAddressCell : UITableViewCell
+ (instancetype)selectShipAddressCellWithTableView:(UITableView *)tableView;
@property (nonatomic, strong) ShipAddressCellModel *address;
@end
