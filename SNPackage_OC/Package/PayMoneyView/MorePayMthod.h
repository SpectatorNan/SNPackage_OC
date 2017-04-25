//
//  MorePayMthod.h
//  payMoney
//
//  Created by 陈志坚 on 16/5/18.
//  Copyright © 2016年 陈志坚. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MorePayMthod;
@protocol MorePayMthodDelegate <NSObject>
@optional
- (void)backToLastView:(MorePayMthod*)view;
- (void)clickCellByType:(NSUInteger)type;
@end
@interface MorePayMthod : UIView

@property (nonatomic,weak)id <MorePayMthodDelegate>delegate;
/*
0: 余额支付;
1: 微信支付;
2: 支付宝支付;
3: 银联支付;
 */
@property (nonatomic, copy) void(^clickCellByType)(NSUInteger type);
@end
