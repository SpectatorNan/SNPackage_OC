//
//  TitileImageView.m
//  refactorEatHome
//
//  Created by Spectator on 16/7/21.
//  Copyright © 2016年 Spectator. All rights reserved.
//

#import "TitileImageView.h"
#import "UITapImageView.h"
#import "UIImageView+WebCache.h"

@interface TitileImageView ()



@end

@implementation TitileImageView

- (void)eh_setupViews {
    
    UILabel *title = [UILabel new];
    [self addSubview:title];
    self.titleLabel = title;
    
    UITapImageView *faceImg = [UITapImageView new];
    [self addSubview:faceImg];
    self.faceImg = faceImg;
    
}

- (void)eh_layout {
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.mas_centerY);
        make.left.equalTo(self.mas_left).offset(10);
    }];
    
    [self.faceImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.mas_centerY);
        make.right.equalTo(self.mas_right).offset(-10);
        make.top.equalTo(self.mas_top).offset(5);
        make.bottom.equalTo(self.mas_bottom).offset(-5);
        make.width.equalTo(self.faceImg.mas_height);
    }];
}

- (void)setTitle:(NSString *)title imageUrlString:(NSString *)image {
    
    self.titleLabel.text = title;
    [self.faceImg sd_setImageWithURL:[NSURL URLWithString:image] placeholderImage:[UIImage imageNamed:@"UserFace"]];
}

@end
