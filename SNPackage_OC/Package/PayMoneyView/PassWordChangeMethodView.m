//
//  PassWord&ChangeMethodView.m
//  payMoney
//
//  Created by 陈志坚 on 16/5/17.
//  Copyright © 2016年 陈志坚. All rights reserved.
//

#import "PassWordChangeMethodView.h"
#import "ZSDSetPasswordView.h"
#import "NSObject+SizeByScreen.h"
@interface PassWordChangeMethodView ()<ZSDSetPasswordViewDelegate>

@end
@implementation PassWordChangeMethodView

{
    UILabel* _titleLabel;
    UIButton* _cancelButton;
    UILabel* _totolCost;
    UILabel* _tipLabel;
    UITextField* _passWord;
    UIButton* _changeMethod;
    ZSDSetPasswordView* _inputView;
}
+ (instancetype)PassWordChangeMethodViewWith:(passWordBlock)block{
    PassWordChangeMethodView* view = [[self alloc]init];
    view.passBlock = block;
    return view;
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
    
    self.layer.cornerRadius = 10;
    
    _titleLabel = [UILabel new];
    _titleLabel.text = @"付款详情";
    _titleLabel.font = [UIFont systemFontOfSize:sizeScreenByFloat(18)];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    
    _cancelButton = [UIButton new];
    [_cancelButton setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    _cancelButton.titleLabel.font = [UIFont systemFontOfSize:sizeScreenByFloat(18)];
//    [_cancelButton setTitle:@"X" forState:UIControlStateNormal];
    [_cancelButton setBackgroundImage:[UIImage imageNamed:@"yansexuanzeguanbi"] forState:UIControlStateNormal];
    [_cancelButton addTarget:self action:@selector(cancelButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    _totolCost = [UILabel new];
    _totolCost.font = [UIFont systemFontOfSize:sizeScreenByFloat(18)];
    _totolCost.textAlignment = NSTextAlignmentCenter;
    _totolCost.textColor = [UIColor colorWithRed:222/255.0 green:28/255.0 blue:32/255.0 alpha:1];

    _tipLabel = [UILabel new];
    _tipLabel.font = [UIFont systemFontOfSize:sizeScreenByFloat(18)];
    _tipLabel.textAlignment = NSTextAlignmentCenter;
    _tipLabel.text = @"请输入支付密码";
    _tipLabel.textColor = [UIColor grayColor];
    
    _inputView = [ZSDSetPasswordView new];
    _inputView.layer.borderWidth = 1.0f;
    _inputView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _inputView.delegate = self;
    
    _changeMethod = [UIButton new];
    [_changeMethod setTitle:@"账户余额支付 更改 >" forState:UIControlStateNormal];
    [_changeMethod setTitleColor:[UIColor colorWithRed:10/255.0 green:165/255.0 blue:43/255.0 alpha:1] forState:UIControlStateNormal];
    [_changeMethod addTarget:self action:@selector(changeMehtodClick:) forControlEvents:UIControlEventTouchUpInside];
    _changeMethod.titleLabel.font = [UIFont systemFontOfSize:sizeScreenByFloat(18)];
    
    [self addSubview:_changeMethod];
    [self addSubview:_cancelButton];
    [self addSubview:_titleLabel];
    [self addSubview:_totolCost];
    [self addSubview:_tipLabel];
    [self addSubview:_inputView];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(sizeScreenByFloat(8));
        make.centerX.equalTo(self);
//        make.width.equalTo(self);
    }];
    
    [_cancelButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(sizeScreenByFloat(-10));
        make.top.equalTo(_titleLabel);
        make.height.equalTo(_titleLabel).multipliedBy(0.8);
        make.width.equalTo(_cancelButton.mas_height);
    }];
    
    [_totolCost mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_titleLabel.mas_bottom).offset(sizeScreenByFloat(12));
        make.centerX.equalTo(self);

    }];
    
    [_tipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_totolCost.mas_bottom).offset(sizeScreenByFloat(12));
        make.centerX.equalTo(self);
//        make.width.equalTo(self);
    }];
    
    [_inputView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_tipLabel.mas_bottom).offset(sizeScreenByFloat(5));
        make.centerX.equalTo(self);
        make.width.equalTo(self).multipliedBy(0.85);
        make.height.equalTo(sizeScreenByNumber(50));
    }];
    
    [_changeMethod mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.bottom.equalTo(self).offset(sizeScreenByFloat(-5));
        
    }];
    _totolCost.text = @"300.00元";
}
- (void)changeMehtodClick:(UIButton*)button{
    if ([self.delegate respondsToSelector:@selector(changePayMethod:)]) {
        [self.delegate changePayMethod:self];
    }
}

- (void)cancelButtonClick:(UIButton*)button{
    if ([self.delegate respondsToSelector:@selector(cancelPay:)]) {
        [self.delegate cancelPay:self];
    }
}


- (void)passwordView:(ZSDSetPasswordView*)passwordView inputPassword:(NSString*)password{
//block 回传
    self.passBlock(password);
}


- (void)becomeFirstRespons{
    [_inputView fieldBecomeFirstResponder];
}
@end
