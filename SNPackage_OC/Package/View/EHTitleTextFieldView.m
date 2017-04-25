//
//  EHTitleTextFieldView.m
//  refactorEatHome
//
//  Created by Spectator on 16/6/24.
//  Copyright © 2016年 Spectator. All rights reserved.
//

#import "EHTitleTextFieldView.h"

@implementation EHTitleTextFieldView

- (void)eh_setupViews {
    
    UILabel *titleLabel = [[UILabel alloc] init];
    [self addSubview:titleLabel];
    
    self.titleLabel = titleLabel;
    titleLabel.textColor = UICOLOR_BLACK;
    
    UITextField *contentField = [[UITextField alloc] init];
    [self addSubview:contentField];
    self.contentField = contentField;
    
    
    UIView *lineView = [UIView new];
    [self addSubview:lineView];
    
    lineView.backgroundColor = UICOLOR_GRAY;
    
    
    
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.mas_centerY);
        make.left.equalTo(@10);
        make.width.mas_equalTo(kScaleFrom_iPhone5_DesginWidth(80));
    }];
    
    
    [contentField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(titleLabel.mas_right).offset(10);
        make.top.equalTo(titleLabel.mas_top);
        make.right.equalTo(@-10);
    }];
    
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(contentField);
        make.top.equalTo(contentField.mas_bottom);
        make.height.mas_equalTo(0.5);
    }];
}



@end
