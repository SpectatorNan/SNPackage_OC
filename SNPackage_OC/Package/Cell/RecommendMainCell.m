//
//  RecommendMainCell.m
//  refactorEatHome
//
//  Created by Spectator on 16/5/30.
//  Copyright © 2016年 Spectator. All rights reserved.
//

#import "RecommendMainCell.h"
#import "RecommendCellModel.h"
#import "UIImageView+WebCache.h"




@interface RecommendMainCell ()

@property (nonatomic, strong) UIImageView *foodImgV;

@property (nonatomic, strong) UILabel *foodNameLab;

@property (nonatomic, strong) UILabel *foodRepLab;

@property (nonatomic, strong) UILabel *foodTimeLab;

@property (nonatomic, strong) UILabel *foodDescLab;

@end

@implementation RecommendMainCell

+ (instancetype)recommendCellWithTableView:(UITableView *)tableView {
    
    RecommendMainCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier_RecommendCell];
    
    
    if (!cell) {
        cell = [[RecommendMainCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kCellIdentifier_RecommendCell];
    }
    
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        [self setupView];
    }
    
    return self;
}

- (void)setupView {
    
    self.foodImgV = ({
    
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView
        .imgV_backgroundColor(UICOLOR_GRAY);
            
         [self.contentView addSubview:imageView];
        
         CGFloat imageHeight = kSCREEN_WIDTH*0.35;
         [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(@0);
             make.left.equalTo(@5);
             make.right.equalTo(@-5);
            make.height.mas_equalTo(imageHeight);
        }];
            
        imageView;
        
    });
    
    self.foodNameLab = ({
    
        UILabel *titleLabel = [[UILabel alloc] init];
        titleLabel
        .lab_textAlignment(NSTextAlignmentLeft)
        .lab_textColor(UICOLOR_BLACK)
        .lab_font(UIFONT_UnAdapter_Name(@"HelveticaNeue-Bold", 16));
            
         [self.contentView addSubview:titleLabel];
            
        [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@5);
            make.top.equalTo(self.foodImgV.mas_bottom).offset(10);
        }];
            
        titleLabel;
    });
    
    
    self.foodTimeLab = ({
        
        UILabel *timeLabel = [UILabel new];
        timeLabel
        .lab_textAlignment(NSTextAlignmentLeft)
        .lab_textColor(UICOLOR_RecomCellTimeTextColor)
        .lab_font(UIFONT_UnAdapter_Size(11));
        
        [self.contentView addSubview:timeLabel];
        
        [timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(@-5);
            make.top.equalTo(self.foodNameLab.mas_top);
        }];
        
        timeLabel;
    });


    self.foodRepLab = ({
        
        UILabel *replyLabel = [UILabel new];
        replyLabel
        .lab_textAlignment(NSTextAlignmentLeft)
        .lab_textColor(UICOLOR_RecomCellRepTextColor)
        .lab_font(UIFONT_Adapter_Size(12));
        
        [self.contentView addSubview:replyLabel];
        
        [replyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.foodNameLab.mas_right).offset(10);
            make.top.equalTo(self.foodNameLab.mas_top);
        }];
        
        replyLabel;
    });

    
    
    self.foodDescLab = ({
        
        UILabel *descLabel = [UILabel new];
        descLabel
        .lab_textColor(UICOLOR_RecomCellDescTextColor)
        .lab_textAlignment(NSTextAlignmentLeft)
        .lab_font(UIFONT_UnAdapter_Size(12))
        .lab_lineBreakMode(NSLineBreakByTruncatingTail)
        .lab_numberOfLines(2);
        
        [self.contentView addSubview:descLabel];
        
        [descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.foodNameLab.mas_bottom).offset(5);
            make.left.equalTo(@5);
            make.right.equalTo(@-5);
            make.bottom.equalTo(self.contentView.mas_bottom).offset(-10);
        }];
        
        descLabel;
    });
    
    
}

- (void)setModel:(RecommendCellModel *)model {
    _model = model;
    
    NSString *time = [model.CreateTime substringToIndex:10];
    
    
    NSString *imageString = [NSString stringWithFormat:kImageStrSplit,model.Img,kSCREEN_WIDTH*kSCREEN_SCALE];
    [self.foodImgV sd_setImageWithURL:[NSURL URLWithString:imageString] placeholderImage:[UIImage imageNamed:@"LoadingImg"]];
    self.foodNameLab.lab_text(model.Title);
    self.foodTimeLab.lab_text(time);
    self.foodRepLab.lab_text(model.ReplyCount);
    self.foodDescLab.lab_text(model.Content);
}

@end
