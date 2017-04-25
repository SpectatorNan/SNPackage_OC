//
//  RecommendMainCell.h
//  refactorEatHome
//
//  Created by Spectator on 16/5/30.
//  Copyright © 2016年 Spectator. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kCellIdentifier_RecommendCell @"RecommendCell"

@class RecommendCellModel;
@interface RecommendMainCell : UITableViewCell

@property (nonatomic, strong) RecommendCellModel *model;

+ (instancetype)recommendCellWithTableView:(UITableView *)tableView;


@end
