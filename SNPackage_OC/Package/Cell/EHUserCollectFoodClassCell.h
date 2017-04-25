//
//  EHUserCollectFoodClassCell.h
//  refactorEatHome
//
//  Created by Spectator on 16/9/6.
//  Copyright © 2016年 Spectator. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kCellIdentifier_CollectFoodClassCell @"foodclassCell"
@class EHUserCollectSubFoodModel;
@interface EHUserCollectFoodClassCell : UITableViewCell

+ (instancetype)foodClassCellWithTableView:(UITableView *)tableView;

@property (nonatomic, strong) EHUserCollectSubFoodModel *model;

@end
