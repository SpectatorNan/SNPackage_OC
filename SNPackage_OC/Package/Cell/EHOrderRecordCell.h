//
//  EHOrderRecordCell.h
//  refactorEatHome
//
//  Created by Spectator on 16/7/19.
//  Copyright © 2016年 Spectator. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kEHOrderRecordCellIdentifier @"orederRecoredCell"

@interface EHOrderRecordCell : UITableViewCell
+ (instancetype)orderCellWithTableView:(UITableView *)tableView;
- (void)setModelData:(id)model;
@end
