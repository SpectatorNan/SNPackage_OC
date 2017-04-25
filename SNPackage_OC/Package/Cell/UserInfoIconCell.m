//
//  UserInfoIconCell.m
//  refactorEatHome
//
//  Created by Spectator on 16/5/27.
//  Copyright © 2016年 Spectator. All rights reserved.
//

#import "UserInfoIconCell.h"


@interface UserInfoIconCell ()

@property (strong, nonatomic) UIImageView *iconView;

@property (strong, nonatomic) UILabel *titleL;

@end

@implementation UserInfoIconCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        [self setUp];
    }
    
    return self;
}

- (void)setUp {
    
    if (!_iconView) {
        _iconView = [[UIImageView alloc] init];
        
        [self.contentView addSubview:_iconView];
        
        [_iconView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.width.mas_equalTo(kScaleFrom_iPhone5_DesginWidth(32));
            make.centerY.equalTo(self.contentView.mas_centerY);
            make.left.equalTo(@15);
        }];
    }
    
    if (!_titleL) {
        _titleL = [[UILabel alloc] init];
        
        _titleL.textAlignment = NSTextAlignmentLeft;
        _titleL.font = UIFONT_UnAdapter_Size(15);
        _titleL.textColor = [UIColor rgb:0x222222];
    
        [self.contentView addSubview:_titleL];
        
        [_titleL mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.contentView.mas_centerY);
            make.left.equalTo(_iconView.mas_right).offset(15);
            make.right.equalTo(@-15);
            make.height.mas_equalTo(20);
        }];
    }
    
}

- (void)setTitle:(NSString *)title icon:(NSString *)iconName{
    _titleL.text = title;
    _iconView.image = [UIImage imageNamed:iconName];
    
}

@end
