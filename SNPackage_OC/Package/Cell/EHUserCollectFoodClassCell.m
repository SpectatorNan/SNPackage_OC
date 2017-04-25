//
//  EHUserCollectFoodClassCell.m
//  refactorEatHome
//
//  Created by Spectator on 16/9/6.
//  Copyright © 2016年 Spectator. All rights reserved.
//

#import "EHUserCollectFoodClassCell.h"
#import "EHUserCollectModel.h"
#import "UIImageView+WebCache.h"

@interface EHUserCollectFoodClassCell ()

@property (nonatomic, strong) UILabel *nameL;

@property (nonatomic, strong) UILabel *descL;

@property (nonatomic, strong) UIImageView *imgV;

@property (nonatomic, strong) UILabel *priceL;

@end

@implementation EHUserCollectFoodClassCell


+ (instancetype)foodClassCellWithTableView:(UITableView *)tableView {
    
    EHUserCollectFoodClassCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier_CollectFoodClassCell];
    
    
    if (!cell) {
        cell = [[EHUserCollectFoodClassCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kCellIdentifier_CollectFoodClassCell];
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
    
    CGFloat imageHeight = (kSCREEN_WIDTH)*0.35;
//    self.backgroundColor = UICOLOR_GRAY_BG;
//    self.contentView.backgroundColor = UICOLOR_WHITE;
//    self.contentView.layer.cornerRadius = 10;
//    self.contentView.clipsToBounds = YES;
    
//    UIView *underline = [[UIView alloc] init];
//    [self.contentView addSubview:underline];
//    underline.backgroundColor = [UIColor grayColor];
//    
//    [underline mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.height.mas_equalTo(0.5);
//        make.bottom.equalTo(self.contentView.mas_bottom).offset(-2);
//        make.width.equalTo(self.contentView.mas_width);
//    }];
    
    UIImageView  *foodImgV = [[UIImageView alloc] init];
    [self.contentView addSubview:foodImgV];
    [foodImgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.width.mas_equalTo(imageHeight);
//        make.edges.equalTo(self.contentView).insets(UIEdgeInsetsMake(5, 5, 5, 0));
        make.top.equalTo(self.contentView).offset(5);
        make.left.equalTo(@12);
//        make.bottom.equalTo(self.contentView).offset(-5);
//        make.width.equalTo(foodImgV.mas_height);
    }];
    self.imgV = foodImgV;
    
    UILabel *nameLabel = [UILabel new];
    nameLabel.lab_font(UIFONT_UnAdapter_Name(@"HelveticaNeue-Bold", 16));
    [self.contentView addSubview:nameLabel];
    
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(foodImgV.mas_right).offset(10);
        make.top.equalTo(foodImgV.mas_top).offset(5);
    }];
    self.nameL = nameLabel;
    
    
    
    UILabel *priceLabel = [UILabel new];
    priceLabel.font = UIFONT_UnAdapter_Size(12);
    [self.contentView addSubview:priceLabel];
    self.priceL = priceLabel;
    [priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(@-20);
        make.centerY.mas_equalTo(nameLabel);
    }];
    
    
    UILabel *descLabel = [UILabel new];
    descLabel.lab_numberOfLines(0).lab_font(UIFONT_UnAdapter_Size(12)).lab_lineBreakMode(NSLineBreakByTruncatingTail);
    [self.contentView addSubview:descLabel];
    
    [descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(nameLabel.mas_left).offset(5);
        make.top.equalTo(nameLabel.mas_bottom).offset(5);
        make.right.equalTo(self.contentView.mas_right).offset(-5);
        make.bottom.equalTo(foodImgV.mas_bottom).offset(-5);
    }];
    self.descL = descLabel;
    
    
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.imgV.mas_bottom).offset(5);
        make.width.mas_equalTo(kSCREEN_WIDTH);
    }];
    

//    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.height.mas_equalTo(kSCREEN_WIDTH*0.35);
//        make.top.equalTo(self).offset(4);
//        make.left.equalTo(self).offset(12);
//        make.right.equalTo(self).offset(-12);
//        make.bottom.equalTo(self).offset(-4);
//        make.bottom.equalTo(self.imgV.mas_bottom).offset(5);
//    }];
    
//    self.contentView.layer.masksToBounds = YES;
}



//static char *modelKey;
- (void)setModel:(EHUserCollectSubFoodModel *)model {
    
    _model = model;
//    objc_setAssociatedObject(self, &modelKey, model, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self layoutIfNeeded];
    NSString *imgStr = [NSString stringWithFormat:kImageStrSplit,model.img,self.imgV.size.height*kSCREEN_SCALE];
    [self.imgV sd_setImageWithURL:[NSURL URLWithString:imgStr] placeholderImage:[UIImage imageNamed:@"CartNone"]];
    self.nameL.text = model.name;
    self.descL.text = model.mark;
    
    NSString *firstText = [NSString stringWithFormat:@"￥%.2f",model.price];
    self.priceL.lab_symbolSplitBeforeAndAfterTheTextColor(@"/",firstText, UICOLOR_ORANGE_NAVI,model.unit,UICOLOR_BLACK);
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
