//
//  EHUserZoneCell.h
//  refactorEatHome
//
//  Created by Spectator on 16/8/10.
//  Copyright © 2016年 Spectator. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kEHUserZoneCell_Identifier @"EHUserZoneCell"

@class EHUserZoneCellModel;
@interface EHUserZoneCell : UITableViewCell

@property (nonatomic, strong) EHUserZoneCellModel *model;

@end
