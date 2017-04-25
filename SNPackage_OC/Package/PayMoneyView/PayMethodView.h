//
//  PayMethodView.h
//  payMoney
//
//  Created by Spectator on 16/8/17.
//  Copyright © 2016年 陈志坚. All rights reserved.
//

#import <UIKit/UIKit.h>

// 支付类型
typedef NS_ENUM(NSUInteger, PayMethodType) {
    PayMethodTypeWallet,
    PayMethodTypeWXPay,
    PayMethodTypeAliPay,
    PayMethodTypeUnionPay
};

@protocol PayMethodTypeDelegate;
@interface PayMethodView : UIView

@property (nonatomic, copy) void(^clickCellByType)(NSUInteger type);
- (void)tapDismiss;
@property (nonatomic,weak)id <PayMethodTypeDelegate>delegate;

@end


@protocol PayMethodTypeDelegate <NSObject>

- (void)selectedPayType:(PayMethodType)type;

@end
