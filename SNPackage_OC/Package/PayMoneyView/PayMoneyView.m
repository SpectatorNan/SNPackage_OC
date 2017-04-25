//
//  PayMoneyView.m
//  支付界面
//
//  Created by 陈志坚 on 16/5/17.
//  Copyright © 2016年 陈志坚. All rights reserved.
//

#import "PayMoneyView.h"
#import "MorePayMthod.h"
#import "PassWordChangeMethodView.h"
@interface PayMoneyView ()<PassWordChangeMethodViewDelegate,MorePayMthodDelegate>
@property (nonatomic,copy)NSString* password;
@end
@implementation PayMoneyView
{
    PassWordChangeMethodView* _payView;
    
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
    self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3];
    __weak typeof(self) weakSelf = self;
    _payView = [PassWordChangeMethodView PassWordChangeMethodViewWith:^(NSString *passWord) {
        weakSelf.password = passWord;
        
    }];
    _payView.backgroundColor = [UIColor whiteColor];
    _payView.delegate = self;
    [self addSubview:_payView];
    
    [_payView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.centerY.equalTo(self).multipliedBy(0.7);
        make.width.equalTo(self).multipliedBy(0.85);
        make.height.equalTo(self).multipliedBy(0.3);
    }];
    
    [_payView becomeFirstRespons];
   
   
}
- (void)cancelPay:(PassWordChangeMethodView *)view{
    [self removeFromSuperview];
}
- (void)backToLastView:(MorePayMthod *)view{
    [view removeFromSuperview];
    [self setUp];
}

- (void)changePayMethod:(PassWordChangeMethodView *)view{
    [view removeFromSuperview];
    
    //set Ui
    MorePayMthod* MorePayMethodView = [MorePayMthod new];
    MorePayMethodView.delegate = self;
    [self addSubview:MorePayMethodView];
    
    [MorePayMethodView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.centerY.equalTo(self).multipliedBy(0.7);
        make.width.equalTo(self).multipliedBy(0.85);
        make.height.equalTo(self).multipliedBy(0.3);
    }];
    
}
- (void)setPassword:(NSString *)password{
    _password = password;
    NSLog(@"%@",password);
}

@end
