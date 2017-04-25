//
//  EHSelectShipAddressCell.m
//  refactorEatHome
//
//  Created by Spectator on 2017/2/7.
//  Copyright © 2017年 Spectator. All rights reserved.
//

#import "EHSelectShipAddressCell.h"
#import "ShipAddressCellModel.h"

@interface EHSelectShipAddressCell()

@property (nonatomic, strong) UILabel *shipNameL;

@property (nonatomic, strong) UILabel *shipPhoneL;

@property (nonatomic, strong) UILabel *shipAddressL;

@end

@implementation EHSelectShipAddressCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
+ (instancetype)selectShipAddressCellWithTableView:(UITableView *)tableView {
    
    EHSelectShipAddressCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier_SelectShipAddressCell];
    
    
    if (!cell) {
        cell = [[EHSelectShipAddressCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kCellIdentifier_SelectShipAddressCell];
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
    
    self.shipNameL = ({
        UILabel *obj = [[UILabel alloc] init];
        obj.lab_font(UIFONT_Adapter_Size(12));
        
        [self.contentView addSubview:obj];
        
        [obj mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(@10);
            make.left.equalTo(@10);
        }];
        obj;
    });
    
    self.shipPhoneL = ({
        UILabel *obj = [[UILabel alloc] init];
        obj.lab_font(UIFONT_Adapter_Size(12));
        
        [self.contentView addSubview:obj];
        
        [obj mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(@10);
            make.right.equalTo(@-10);
        }];
        obj;
    });
    
    self.shipAddressL = ({
        UILabel *obj = [[UILabel alloc] init];
        obj.lab_font(UIFONT_Adapter_Size(12));
        
        [self.contentView addSubview:obj];
        
        [obj mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.shipNameL.mas_bottom).offset(10);
            make.left.equalTo(self.shipNameL.mas_left);
//            make.bottom.equalTo(self.contentView.mas_bottom).offset(-10);
        }];
        obj;
    });
    
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(kSCREEN_WIDTH);
        make.bottom.equalTo(self.shipAddressL.mas_bottom).offset(10);
    }];
    
}

- (void)setAddress:(ShipAddressCellModel *)address {
    
    _address = address;
    
    self.shipNameL.lab_text(address.Name);
    self.shipPhoneL.lab_text(address.telphone);
    self.shipAddressL.lab_text([NSString stringWithFormat:@"株洲市%@%@",address.AreaID1,address.Address]);
}

@end
