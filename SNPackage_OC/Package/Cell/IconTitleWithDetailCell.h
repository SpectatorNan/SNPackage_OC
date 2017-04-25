//
//  IconTitleWithDetailCell.h
//  refactorEatHome
//
//  Created by Spectator on 2017/2/22.
//  Copyright © 2017年 Spectator. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kCellIdentifier_IconTitleWithDetailCell @"IconTitleWithDetailCell"
@interface IconTitleWithDetailCell : UITableViewCell
- (void)setImgName:(NSString *_Nonnull)imgName title:(NSString *_Nonnull)title subTitle:( NSString * _Nullable )subTitle;
@end
