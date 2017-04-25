//
//  OrderRecordCell.m
//  refactorEatHome
//
//  Created by Spectator on 16/7/20.
//  Copyright © 2016年 Spectator. All rights reserved.
//

#import "OrderRecordCell.h"

@interface OrderRecordCell ()

@property (nonatomic, strong) UIControl *topView;

@property (nonatomic, strong) UIControl *bodyView;

@property (nonatomic, strong) UIView *amountView;

@property (nonatomic, strong) UIView *buttonView;

@property (nonatomic, strong) UILabel *foodNameLabel;

@property (nonatomic, strong) UILabel *stateLabel;

@property (nonatomic, strong) UIImageView *foodImgView;

@property (nonatomic, strong) UILabel *foodDescLabel;

@property (nonatomic, strong) UILabel *foodPriceLabel;

@property (nonatomic, strong) UILabel *foodNumberLabel;

@property (nonatomic, strong) UILabel *amoutLabel;

@property (nonatomic, strong) UIButton *receiptBtn;

@end

@implementation OrderRecordCell

+ (instancetype)orederCellWithTableview:(UITableView *)tableView {
    
    OrderRecordCell *cell = [tableView dequeueReusableCellWithIdentifier:kOrderCellIdentifier];
    
    if (!cell) {
        cell = [[OrderRecordCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kOrderCellIdentifier];
    }
    
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        [self setU];
    }
    
    return self;
}


- (void)setU {
    
    self.topView = ({
        
        UIControl *top = [UIControl new];
        [self.contentView addSubview:top];
        
        [top mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(self.contentView.mas_top);
            make.left.equalTo(self.contentView.mas_left);
            make.right.equalTo(self.contentView.mas_right);
            make.height.mas_equalTo(44);
        }];
        
        top;
    });
    
    
    self.bodyView = ({
       
        UIControl *body = [UIControl new];
        [self.contentView addSubview:body];
        
        [body mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.topView.mas_bottom);
            make.left.equalTo(self.contentView.mas_left);
            make.right.equalTo(self.contentView.mas_right);
            make.height.mas_equalTo(100);
        }];
        
        body;
    });
    
    
    self.amountView = ({
       
        UIView *amount = [UIView new];
        [self.contentView addSubview: amount];
        
        [amount mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(self.bodyView.mas_bottom);
            make.left.equalTo(self.contentView.mas_left);
            make.right.equalTo(self.contentView.mas_right);
            make.height.mas_equalTo(44);
        }];
        
        amount;
    });
    
    self.buttonView = ({
       
        UIView *bView = [UIView new];
        [self.contentView addSubview:bView];
        
        [bView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.amountView.mas_bottom);
            make.left.equalTo(self.contentView.mas_left);
            make.right.equalTo(self.contentView.mas_right);
            make.height.mas_equalTo(44);
            make.bottom.equalTo(self.contentView.mas_bottom);
        }];
        
        bView;
    });
    
    self.topView.backgroundColor = [UIColor redColor];
    self.bodyView.backgroundColor = [UIColor orangeColor];
    self.amountView.backgroundColor = [UIColor purpleColor];
    self.buttonView.backgroundColor = [UIColor blueColor];
}

@end
