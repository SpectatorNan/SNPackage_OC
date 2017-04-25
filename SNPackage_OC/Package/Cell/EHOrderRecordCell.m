//
//  EHOrderRecordCell.m
//  refactorEatHome
//
//  Created by Spectator on 16/7/19.
//  Copyright © 2016年 Spectator. All rights reserved.
//

#import "EHOrderRecordCell.h"
#import "FUIButton.h"
#import "EHOrderModel.h"
#import "UIImageView+WebCache.h"

@interface EHOrderRecordCell ()

//@property (nonatomic, strong) UIControl *topView;

@property (nonatomic, strong) UIControl *bodyView;

//@property (nonatomic, strong) UIView *amountView;

//@property (nonatomic, strong) UIView *buttonView;

//@property (nonatomic, strong) UILabel *nameLabel;

//@property (nonatomic, strong) UILabel *stateLabel;

@property (nonatomic, strong) UILabel *foodDescLabel;

@property (nonatomic, strong) UIImageView *foodImgView;

@property (nonatomic, strong) UILabel *priceLabel;

@property (nonatomic, strong) UILabel *numberLabel;

//@property (nonatomic, strong) UILabel *amountLabel;

//@property (nonatomic, strong) UIButton *deliveryBtn;

@end

@implementation EHOrderRecordCell

+ (instancetype)orderCellWithTableView:(UITableView *)tableView {
    
    EHOrderRecordCell *cell = [tableView dequeueReusableCellWithIdentifier:kEHOrderRecordCellIdentifier];
    if (!cell) {
    
   cell = [[EHOrderRecordCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kEHOrderRecordCellIdentifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        [self setUpView];
    }
    
    return self;
}


- (void)setUpView {
    /**
     topView
     */
//    UIControl *topView = [[UIControl alloc] init];
//    [self.contentView addSubview:topView];
//    self.topView = topView;
//    
//    
//    UILabel *nameLabel = [[UILabel alloc] init];
//    [topView addSubview:nameLabel];
//    nameLabel.text = @"菜名";
//    nameLabel.font = UIFONT_Adapter_Size(16);
//    self.nameLabel = nameLabel;
//    
//    UILabel *stateLabel = [[UILabel alloc] init];
//    [topView addSubview:stateLabel];
//    stateLabel.textColor = UICOLOR_RecomCellRepTextColor;
//    stateLabel.font = UIFONT_Adapter_Size(16);
//    stateLabel.text = @"交易状态";
//    self.stateLabel = stateLabel;
    
    /**
     bodyView
     
     */
    UIControl *bodyView = [[UIControl alloc] init];
    [self.contentView addSubview:bodyView];
    self.bodyView = bodyView;
    
    
    
    UIImageView *foodImgV = [[UIImageView alloc] init];
    [bodyView addSubview:foodImgV];
    foodImgV.image = [UIImage imageNamed:@"cart"];
    self.foodImgView = foodImgV;
    
    
    UILabel *foodDescLabel = [[UILabel alloc] init];
    [bodyView addSubview:foodDescLabel];
    foodDescLabel.text = @"菜名";
//    foodDescLabel.numberOfLines = 0;
    foodDescLabel.font = UIFONT_Adapter_Blod(16);
    foodDescLabel.textColor = UICOLOR_RecomCellDescTextColor;
    foodDescLabel.textAlignment = NSTextAlignmentRight;
    self.foodDescLabel = foodDescLabel;
    
    
    UILabel *priceLabel = [[UILabel alloc] init];
    [bodyView addSubview:priceLabel];
    priceLabel.text = [NSString stringWithFormat:@"￥25.06"];
    priceLabel.font = UIFONT_Adapter_Size(12);
    self.priceLabel = priceLabel;
    
    
    UILabel *numberLabel = [[UILabel alloc] init];
    [bodyView addSubview:numberLabel];
    numberLabel.text = [NSString stringWithFormat:@"x 99"];
    numberLabel.font = UIFONT_Adapter_Size(12);
    self.numberLabel = numberLabel;
    
    /**
     amountView
     
     */
//    UIView *amoutView = [[UIView alloc] init];
//    [self.contentView addSubview: amoutView];
//    self.amountView = amoutView;
    
    
//    UILabel *amountLabel = [[UILabel alloc] init];
//    [amoutView addSubview:amountLabel];
//    amountLabel.text = [NSString stringWithFormat:@"共1件商品 合计: x 25.06 (含运费:￥10.00)"];
//    amountLabel.adjustsFontSizeToFitWidth = YES;
//    self.amountLabel = amountLabel;
    
    /**
     buttonView
     
     */
//    UIView *buttonView = [[UIView alloc] init];
//    [self.contentView addSubview:buttonView];
//    self.buttonView = buttonView;
    
    
//    UIButton *deliveryBtn = [[UIButton alloc] init];
//    [buttonView addSubview:deliveryBtn];
//    deliveryBtn
//    .button_cornerRadius(3);
//    deliveryBtn.titleLabel.font = UIFONT_Size(12);
//    [deliveryBtn setTitle:@"确认收货" forState:UIControlStateNormal];
//    [deliveryBtn setTitleColor:UICOLOR_WHITE forState:UIControlStateNormal];
//    [deliveryBtn setBackgroundColor: UICOLOR_RecomCellRepTextColor];
//    self.deliveryBtn = deliveryBtn;
    
//    FUIButton *deliveryBtn = [[FUIButton alloc] init];
//    deliveryBtn.buttonColor = UICOLOR_RecomCellRepTextColor;
//    [deliveryBtn setTitleColor:UICOLOR_WHITE forState:UIControlStateNormal];
//    [deliveryBtn setTitle:@"确认收货" forState:UIControlStateNormal];
//    deliveryBtn.titleLabel.font = UIFONT_Adapter_Size(13);
//    [deliveryBtn setTitleEdgeInsets:UIEdgeInsetsMake(3, 3, 3, 3)];
//    deliveryBtn.shadowColor = UICOLOR_ORANGE_NAVI;
//    deliveryBtn.shadowHeight = 3.0f;
//    deliveryBtn.cornerRadius = 6.0f;
//    
//    self.deliveryBtn = deliveryBtn;
//    [buttonView addSubview:deliveryBtn];
    
#pragma mark -- top layout
    
//    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
////        make.top.right.left.equalTo(self.contentView);
////        make.height.mas_equalTo(44);
//        make.top.equalTo(self.contentView.mas_top);
//        make.left.equalTo(self.contentView.mas_left);
//        make.right.equalTo(self.contentView.mas_right);
//        make.height.mas_equalTo(30);
//    
//    }];
//    
//    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.equalTo(topView.mas_centerY);
//        make.left.equalTo(@5);
//    }];
//    
//    [stateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.equalTo(topView.mas_centerY);
//        make.right.equalTo(@-10);
//    }];
    
    
#pragma mark -- body layout
    [bodyView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(topView.mas_bottom);
//        make.right.left.equalTo(self.contentView);
//        make.height.mas_equalTo(120);
        
//        make.top.equalTo(self.topView.mas_bottom);
        make.top.equalTo(self.contentView.mas_top);
        make.left.equalTo(self.contentView.mas_left);
        make.right.equalTo(self.contentView.mas_right);
        make.height.mas_equalTo(100);
    }];
    
    [foodImgV mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.left.equalTo(@10);
        make.height.mas_equalTo(60);
        make.width.equalTo(self.foodImgView.mas_height);
        make.bottom.equalTo(self.bodyView.mas_bottom).offset(-10);
    
    }];
    
    [foodDescLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(foodImgV.mas_top).offset(15);
        make.left.equalTo(foodImgV.mas_right).offset(15);
//        make.right.equalTo(stateLabel.mas_left);
//        make.right.equalTo(priceLabel.mas_left).offset(-5);
//        make.bottom.equalTo(foodImgV.mas_bottom).offset(-5);
    }];
    
    [priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.right.equalTo(stateLabel.mas_right);
        make.right.equalTo(@-10);
        make.top.equalTo(foodDescLabel.mas_top);
//        make.left.equalTo(stateLabel.mas_left).offset(10);
        make.width.mas_equalTo(80);
    }];
    
    [numberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.right.equalTo(stateLabel.mas_right);
//        make.right.equalTo(@-10);
//        make.centerY.equalTo(foodImgV.mas_centerY);
        make.top.equalTo(priceLabel.mas_bottom).offset(10);
        make.left.equalTo(priceLabel.mas_left);
    }];
    
    
#pragma mark -- amount layout
//    [amoutView mas_makeConstraints:^(MASConstraintMaker *make) {
////        make.top.equalTo(bodyView.mas_bottom);
////        make.right.left.equalTo(self.contentView);
////        make.height.mas_equalTo(44);
//        make.top.equalTo(self.bodyView.mas_bottom);
//        make.left.equalTo(self.contentView.mas_left);
//        make.right.equalTo(self.contentView.mas_right);
//        make.height.mas_equalTo(30);
//    }];
//    
//    [amountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.right.equalTo(@-10);
//        make.centerY.mas_equalTo(amoutView.mas_centerY);
//        make.left.equalTo(foodImgV.mas_right).offset(-10);
//    }];
    
#pragma mark -- button layout
//    [buttonView mas_makeConstraints:^(MASConstraintMaker *make) {
////        make.top.equalTo(amoutView.mas_bottom).offset(1);
////        make.right.left.equalTo(self.contentView);
//        make.top.equalTo(self.amountView.mas_bottom);
//        make.left.equalTo(self.contentView.mas_left);
//        make.right.equalTo(self.contentView.mas_right);
//        make.height.mas_equalTo(30);
////        make.bottom.equalTo(self.contentView.mas_bottom);
//    }];
//    
//    [deliveryBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.right.equalTo(@-10);
//        make.centerY.equalTo(self.buttonView.mas_centerY);
//        make.top.equalTo(@3);
//        make.width.mas_equalTo(70);
//        make.bottom.equalTo(@-3);
//        
//    }];
    
#pragma mark -- space view
    UIView *placeholderView = [[UIView alloc] init];
    [self.contentView addSubview: placeholderView];
    placeholderView.backgroundColor = UICOLOR_GRAY_BG;
    
    [placeholderView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(buttonView.mas_bottom);
        make.top.equalTo(bodyView.mas_bottom);
        make.right.left.equalTo(self.contentView);
        make.height.mas_equalTo(0.5);
        make.bottom.equalTo(self.contentView.mas_bottom);
    }];
    
}

//- (void)layoutSubviews {
//    [super layoutSubviews];
//    
//#pragma mark -- top layout
//    [self.topView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.right.left.equalTo(@0);
//        make.height.mas_equalTo(44);
//    }];
//    
//    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.equalTo(self.topView.mas_centerY);
//        make.left.equalTo(@5);
//    }];
//    
//    [self.stateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.equalTo(self.topView.mas_centerY);
//        make.right.equalTo(@-10);
//    }];
//    
//    
//#pragma mark -- body layout
//    [self.bodyView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.topView.mas_bottom);
//        make.right.left.equalTo(@0);
//        //        make.height.mas_equalTo(120);
//    }];
//    
//    [self.foodImgView mas_makeConstraints:^(MASConstraintMaker *make) {
//        
//        make.top.left.equalTo(@10);
//        make.height.mas_equalTo(80);
//        make.width.equalTo(self.foodImgView.mas_height);
//        make.bottom.equalTo(self.bodyView.mas_bottom).offset(-10);
//    }];
//    
//    [self.foodDescLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        
//        make.top.equalTo(self.foodImgView.mas_top).offset(5);
//        make.left.equalTo(self.foodImgView.mas_right).offset(5);
//        make.right.equalTo(self.stateLabel.mas_left);
//        make.bottom.equalTo(self.foodImgView.mas_bottom).offset(-5);
//    }];
//    
//    [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.right.equalTo(self.stateLabel.mas_right);
//        make.top.equalTo(self.foodDescLabel.mas_top);
//        make.left.equalTo(self.stateLabel.mas_left).offset(10);
//    }];
//    
//    [self.numberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.right.equalTo(self.stateLabel.mas_right);
//        make.centerY.equalTo(self.foodImgView.mas_centerY);
//    }];
//    
//    
//#pragma mark -- amount layout
//    [self.amoutView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.bodyView.mas_bottom);
//        make.right.left.equalTo(@0);
//        make.height.mas_equalTo(44);
//    }];
//    
//    [self.amountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.right.equalTo(@-10);
//        make.centerY.mas_equalTo(self.amoutView.mas_centerY);
//    }];
//    
//#pragma mark -- button layout
//    [self.buttonView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.amoutView.mas_bottom).offset(1);
//        make.right.left.equalTo(@0);
//    }];
//    
//    [self.deliveryBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.right.equalTo(@-10);
//        make.centerY.equalTo(self.buttonView.mas_centerY);
//        make.top.equalTo(@5);
//        make.bottom.equalTo(@-5);
//    }];
//
//}

- (void)setModelData:(EHOrderCellModel *)model {
    NSString *imgStr = [NSString stringWithFormat:kImageStrSplit,model.Img,self.foodImgView.frame.size.width*kSCREEN_SCALE];
    [self.foodImgView sd_setImageWithURL:[NSURL URLWithString:imgStr] placeholderImage:[UIImage imageNamed:@"CartNone"]];
    self.foodDescLabel.lab_text(model.Name);
    self.priceLabel.lab_text([NSString stringWithFormat:@"￥%@/%@",model.Price,model.Unit]);
    self.numberLabel.lab_text([NSString stringWithFormat:@"x %@",model.ShopCount]);
}

@end
