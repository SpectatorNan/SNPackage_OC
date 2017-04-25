//
//  EHEmptyDefaultAddressView.m
//  refactorEatHome
//
//  Created by Spectator on 16/8/5.
//  Copyright © 2016年 Spectator. All rights reserved.
//

#import "EHEmptyDefaultAddressView.h"

@interface EHEmptyDefaultAddressView ()

@property (nonatomic, copy) void(^tapAction)(id);
@end

@implementation EHEmptyDefaultAddressView

- (void)eh_setupViews {
    
    self.backgroundColor = UICOLOR_WHITE_LIGHTORANGE;
    
    UILabel *label = [UILabel new];
    label.font = UIFONT_UnAdapter_Size(16);
    label.text = @"请添加地址 ~ ~ ~";
    label.textColor = UICOLOR_GRAY;
    
    [self addSubview:label];
    
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.mas_centerY);
        make.centerX.equalTo(self.mas_centerX);
    }];
}



@end
