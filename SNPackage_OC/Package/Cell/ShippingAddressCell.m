//
//  ShippingAddressCell.m
//  refactorEatHome
//
//  Created by Spectator on 16/6/17.
//  Copyright © 2016年 Spectator. All rights reserved.
//

#import "ShippingAddressCell.h"
#import "ShipAddressCellModel.h"


@interface ShippingAddressCell ()

@property (nonatomic, strong) UILabel *nameL;

@property (nonatomic, strong) UILabel *addressL;

@property (nonatomic, strong) UILabel *phoneL;

@property (nonatomic, strong) UIButton *defaultBtn;
@end


@implementation ShippingAddressCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        [self setupView];
        
    }
    
    return self;
}


- (void)setupView {
    

    self.nameL = ({
    
    UILabel *nameLabel = [UILabel new];
    
    [self.contentView addSubview:nameLabel];
    
    nameLabel.lab_font(UIFONT_Adapter_Blod(14));
    
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).offset(10);
        make.left.equalTo(self.contentView.mas_left).offset(10);
    }];
        nameLabel;
    });
    
    
    self.phoneL = ({
    UILabel *phoneLabel = [UILabel new];
    
    [self.contentView addSubview:phoneLabel];
    
    phoneLabel.lab_font(UIFONT_Adapter_Blod(14));
    
    [phoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.nameL.mas_top);
        make.left.equalTo(self.nameL.mas_right).offset(10);
    }];
        phoneLabel;
    });
    
    
    self.addressL = ({
    
    UILabel *addressLabel = [UILabel  new];
    
    [self.contentView addSubview:addressLabel];
    
    addressLabel
    .lab_textColor(UICOLOR_RecomCellDescTextColor)
    .lab_adjustsFontSizeToFitWidth(YES);
    
    
    [addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nameL.mas_left);
        make.top.equalTo(self.nameL.mas_bottom).offset(10);
        make.right.equalTo(self.contentView.mas_right).offset(-10);
    }];
        addressLabel;
    });
    
    
    
    UIView *lineView = [UIView new];
    [self.contentView addSubview:lineView];
    lineView.backgroundColor = UICOLOR_GRAY;
    
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.addressL.mas_bottom).offset(5);
        make.height.mas_equalTo(1);
        make.left.equalTo(self.nameL.mas_left);
        make.right.equalTo(self.contentView.mas_right);
    }];
    
    
    self.defaultBtn = ({
    
    UIButton *defaultBtn = [UIButton new];
    
    [self.contentView addSubview:defaultBtn];
    
    defaultBtn
    .button_title(@"设为默认",UIControlStateNormal)
    .button_titleColor(UICOLOR_RecomCellRepTextColor,UIControlStateSelected)
    .button_titleColor(UICOLOR_BLACK,UIControlStateNormal)
    .button_image([UIImage imageNamed:@"trade_choose_default"],UIControlStateNormal)
    .button_image([UIImage imageNamed:@"trade_choose_OK"],UIControlStateSelected);
    
    [defaultBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineView.mas_bottom).offset(10);
        make.left.equalTo(self.nameL.mas_left);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-5);
    }];
        [defaultBtn addTarget:self action:@selector(defaultAddressBlock) forControlEvents:UIControlEventTouchUpInside];
        defaultBtn;
    });
    
    
    UIButton *deleteBtn = [UIButton new];
    
    [self.contentView addSubview:deleteBtn];
    
    deleteBtn
    .button_title(@"删除",UIControlStateNormal)
    .button_titleColor(UICOLOR_BLACK,UIControlStateNormal);

    [deleteBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.defaultBtn.mas_top);
        make.right.equalTo(self.contentView.mas_right).offset(-10);
    }];
    [deleteBtn addTarget:self action:@selector(deleteAddressBlock) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *editBtn = [UIButton new];
    
    [self.contentView addSubview:editBtn];
    
    editBtn
    .button_title(@"编辑",UIControlStateNormal)
    .button_titleColor(UICOLOR_BLACK,UIControlStateNormal);
    
    [editBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.defaultBtn.mas_top);
        make.right.equalTo(deleteBtn.mas_left).offset(-10);
    }];
    [editBtn addTarget:self action:@selector(editAddressBlock) forControlEvents:UIControlEventTouchUpInside];
}

- (void)setModel:(ShipAddressCellModel *)model {
    _model = model;
    
    self.nameL.text = model.Name;
    self.phoneL.text = model.telphone;
    self.addressL.text = [NSString stringWithFormat:@"株洲市%@%@",model.AreaID1,model.Address];
    
    self.defaultBtn.selected = model.DefaultAddress ? YES : NO;
}


- (void)defaultAddressBlock {
    
    if (self.clickDefaultBtn) {
        self.clickDefaultBtn();
    }
    
}

- (void)editAddressBlock {
    
    if (self.clickEditBtn) {
        self.clickEditBtn();
    }
}

- (void)deleteAddressBlock {
    
    if (self.clickDeleteBtn) {
        self.clickDeleteBtn();
    }
}

@end
