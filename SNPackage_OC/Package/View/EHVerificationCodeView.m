//
//  EHVerificationCodeView.m
//  refactorEatHome
//
//  Created by Spectator on 16/6/27.
//  Copyright © 2016年 Spectator. All rights reserved.
//

#import "EHVerificationCodeView.h"


@interface EHVerificationCodeView ()
{
    NSInteger _timeCount;
    NSTimer *_timer;
}

@property (nonatomic, strong) UIButton *verificationCodeBtn;

@end

@implementation EHVerificationCodeView

- (void)eh_setupViews {
    
    self.titleLabel = ({
       
        UILabel *title = [[UILabel alloc] init];
        [self addSubview:title];
        
        [title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@10);
            make.centerY.equalTo(self.mas_centerY);
            make.width.mas_equalTo(80);
        }];
        title;
        
    });
    
    UIButton *requestCodeBtn = [[UIButton alloc] init];
    [self addSubview:requestCodeBtn];
    
    requestCodeBtn.backgroundColor = UICOLOR_GREEN_BUTTON;
    [requestCodeBtn setTitle:@"验证码" forState:UIControlStateNormal];
    [requestCodeBtn setTitleColor:UICOLOR_WHITE forState:UIControlStateNormal];
    [requestCodeBtn addTarget:self action:@selector(verifi) forControlEvents:UIControlEventTouchUpInside];
    requestCodeBtn.button_cornerRadius(3);
    self.verificationCodeBtn = requestCodeBtn;
    [requestCodeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.mas_centerY);
        make.height.equalTo(self.mas_height).multipliedBy(0.6);
        make.width.equalTo(self.mas_width).multipliedBy(0.2);
        make.right.equalTo(@-10);
    }];
    
    
    self.codeField = ({
       
        UITextField *codeFie = [[UITextField alloc] init];
        [self addSubview:codeFie];
        
        [codeFie mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.titleLabel.mas_right).offset(5);
            make.right.equalTo(requestCodeBtn.mas_left).offset(-5);
            make.centerY.equalTo(self.mas_centerY);
        }];
        codeFie;
    });

    UIView *lineView = [[UIView alloc] init];
    [self addSubview:lineView];
    lineView.backgroundColor = UICOLOR_GRAY;
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(0.5);
        make.left.equalTo(self.codeField.mas_left);
        make.right.equalTo(self.codeField.mas_right);
        make.top.equalTo(self.codeField.mas_bottom);
    }];
}


- (void)verifi {
    [self requestStart];
    if (self.requestCode) {
        self.requestCode();
    }
}


#pragma mark -- 倒计时
- (void)requestStart {
    self.verificationCodeBtn.enabled = NO;
    _timeCount = 60;
    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(waitForVerification) userInfo:nil repeats:YES];
    _timer.fireDate = [NSDate distantPast];
}

- (void)stopTiming {
    [_timer invalidate];
}

- (void)waitForVerification {
    
    [self.verificationCodeBtn setTitle:[NSString stringWithFormat:@"%ld秒",(long)_timeCount] forState:UIControlStateDisabled];
    _timeCount = --_timeCount;
    SNLog(@"timeCount -- %ld",(long)_timeCount);
    if (_timeCount == 0) {
        _timer.fireDate = [NSDate distantFuture];
        _timeCount = 60;
        [self.verificationCodeBtn setTitle:@"重新发送" forState:UIControlStateNormal];
        self.verificationCodeBtn.enabled = YES;
    }
}
@end
