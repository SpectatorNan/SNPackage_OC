//
//  EHUserIconCell.m
//  refactorEatHome
//
//  Created by Spectator on 2017/2/21.
//  Copyright © 2017年 Spectator. All rights reserved.
//

#import "EHUserIconCell.h"
#import "UITapImageView.h"
#import "UIImageView+WebCache.h"

@interface EHUserIconCell ()

@property (nonatomic, strong) UILabel *descLabel;

@property (nonatomic, strong, readwrite) UITapImageView *iconImgV;

@end


@implementation EHUserIconCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self setUp];
    }
    
    return self;
}

- (void)setUp {
    
    self.descLabel = ({
        UILabel *obj = [UILabel new];
        
        obj.lab_font(UIFONT_UnAdapter_Blod(14));
        [self.contentView addSubview:obj];
        
        [obj mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.mas_centerY);
            make.left.equalTo(self.contentView.mas_left).offset(10);
        }];
        
        obj;
    });
    
    self.iconImgV = ({
        UITapImageView *faceImg = [UITapImageView new];
        [self.contentView addSubview:faceImg];
        
        [faceImg mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.centerY.equalTo(self.contentView.mas_centerY);
            make.right.equalTo(self.contentView.mas_right).offset(-10);
            make.top.equalTo(self.contentView.mas_top).offset(5);
            make.bottom.equalTo(self.contentView.mas_bottom).offset(-5);
            make.width.mas_equalTo(40);
            make.width.equalTo(faceImg.mas_height);
        }];
        faceImg;
    });
    
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(kSCREEN_WIDTH);
    }];
    WEAKLY(wself, self)
    [self.iconImgV addTapAction:^(id obj) {
        if (wself.tapImg) {
            wself.tapImg();
        }
    }];
}

- (void)setTitle:(NSString *)title imageUrlString:(NSString *)image {
    
    self.descLabel.text = title;
    [self.iconImgV sd_setImageWithURL:[NSURL URLWithString:image] placeholderImage:[UIImage imageNamed:@"UserFace"]];
}

@end
