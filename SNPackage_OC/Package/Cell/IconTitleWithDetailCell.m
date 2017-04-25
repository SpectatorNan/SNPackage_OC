//
//  IconTitleWithDetailCell.m
//  refactorEatHome
//
//  Created by Spectator on 2017/2/22.
//  Copyright © 2017年 Spectator. All rights reserved.
//

#import "IconTitleWithDetailCell.h"
#import "UIImageView+WebCache.h"

@interface IconTitleWithDetailCell ()

@property (nonatomic, strong) UIImageView *iconView;

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UILabel *subTitleLabel;
@end

@implementation IconTitleWithDetailCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self setUp];
    }
    
    return self;
}

- (void)setUp {
    
    self.iconView = ({
        UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(10, 12, 20, 20)];
        
        [self.contentView addSubview:img];
        
        
        img;
    });
    
    self.titleLabel = ({
        UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(50, 7, 80, 30)];
        [self.contentView addSubview:lab];
        
        lab;
    });
    
    self.subTitleLabel = ({
        UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(kSCREEN_WIDTH-170, 7, 150, 30)];
        [self.contentView addSubview:lab];
        lab.textAlignment = NSTextAlignmentRight;
        
        lab.textColor = UICOLOR_ORANGE_NAVI;
        lab.text = @"未绑定";
        
        lab;
    });
}

- (void)setImgName:(NSString *)imgName title:(NSString *)title subTitle:( NSString * _Nullable )subTitle {
    self.iconView.image = [UIImage imageNamed:imgName];
    self.titleLabel.text = title;
    if (subTitle) {
        [self subTitleText:subTitle];
    }
}

- (void)subTitleText:(NSString *)text {
    self.subTitleLabel.textColor = [UIColor lightGrayColor];
    self.subTitleLabel.text = text;
}

@end
