//
//  MorePayMthod.m
//  payMoney
//
//  Created by 陈志坚 on 16/5/18.
//  Copyright © 2016年 陈志坚. All rights reserved.
//

#import "MorePayMthod.h"
#import "NSObject+SizeByScreen.h"
@interface MorePayMthod ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation MorePayMthod
{
    UILabel* _title;
    UIButton* _back;
    UIView* _line;
    UITableView* _methodList;
}
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if ( self) {
        
        [self setUp];
    }
    return self;
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setUp];
    }
    return self;
}
- (void)setUp{
    self.backgroundColor = [UIColor whiteColor];
    self.layer.cornerRadius = 10.f;
    _title = [UILabel new];
    _title.font = [UIFont systemFontOfSize:sizeScreenByFloat(18)];
    _title.text = @"请选择支付方式";

    
    
    _line = [UIView new];
    _line.backgroundColor = [UIColor colorWithRed:233/255.0 green:233/255.0 blue:233/255.0 alpha:1];
    
    _methodList = [UITableView new];
    _methodList.dataSource = self;
    _methodList.delegate = self;
    self.layer.masksToBounds = YES;
    _methodList.clipsToBounds = YES;
    _methodList.bounces = NO;

    [self addSubview:_title];
    [self addSubview:_line];
    [self addSubview:_methodList];
    
    [_title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self).offset(sizeScreenByFloat(12));
    }];
    
    [_back mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_title);
        make.left.equalTo(self).offset(sizeScreenByFloat(15));

    }];
    
    [_line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.width.equalTo(self);
        make.height.equalTo(@1);
        make.top.equalTo(_title.mas_bottom).offset(sizeScreenByFloat(15));
    }];
    
    [_methodList mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.top.equalTo(_line.mas_bottom);
        make.bottom.equalTo(self);
        make.width.equalTo(self);
    }];
}


- (void)backUp{
    //返回
    if ([self.delegate respondsToSelector:@selector(backToLastView:)]) {
        [self.delegate backToLastView:self];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;

}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell* cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"morePayMethod"];
    [self configCell:cell andInderPath:indexPath];
    return cell;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    if (indexPath.row ==0) {
//    
//    }else if (indexPath.row ==1){
//        //跳转支付宝
//    }else{
//        //跳转微信
//    }
    
    if ([self.delegate respondsToSelector:@selector(clickCellByType:)]) {
        [self.delegate clickCellByType:indexPath.row];
    }
    
    if (self.clickCellByType) {
        self.clickCellByType(indexPath.row);
    }
}
- (void)configCell:(UITableViewCell*)cell andInderPath:(NSIndexPath*)path{
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    if (path.row ==0) {
        cell.imageView.image = [UIImage imageNamed:@"YEPay"];
        cell.textLabel.text = @"余额支付";
    }else if (path.row == 1){
        cell.imageView.image = [UIImage imageNamed:@"WXPay"];
        cell.textLabel.text = @"微信支付";
    }else if (path.row == 2){
        cell.imageView.image = [UIImage imageNamed:@"ZXBPay"];
        cell.textLabel.text = @"支付宝支付";
    } else {
        cell.imageView.image = [UIImage imageNamed:@"YLPay"];
        cell.textLabel.text = @"银联支付";
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return tableView.frame.size.height /4.0;
}

@end
