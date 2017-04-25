//
//  TitleDescLabelView.m
//  refactorEatHome
//
//  Created by Spectator on 16/7/21.
//  Copyright © 2016年 Spectator. All rights reserved.
//

#import "TitleDescLabelView.h"

@implementation TitleDescLabelView

- (void)eh_setupViews {
    
    UILabel *titleLabel = [UILabel new];
    [self addSubview:titleLabel];
    self.titleLabel = titleLabel;
    
    UILabel *descLabel = [UILabel new];
    [self addSubview:descLabel];
    self.descLabel = descLabel;
}


- (void)eh_layout {
 
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.mas_centerY);
        make.left.equalTo(self.mas_left).offset(10);
    }];
    
    [self.descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.mas_centerY);
        make.right.equalTo(self.mas_right).offset(-10);
    }];
    
}
@end
