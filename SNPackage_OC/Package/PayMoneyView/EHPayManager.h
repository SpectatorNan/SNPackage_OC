//
//  EHPayManager.h
//  refactorEatHome
//
//  Created by Spectator on 16/8/17.
//  Copyright © 2016年 Spectator. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PayMethodView.h"
@class EHReadyOrderModel;

@interface EHPayManager : NSObject

@property (nonatomic, copy)  void(^unionPayBlock)(NSDictionary *unionDic);

+ (instancetype)manager;

- (void)requestPrepareOrderWithModel:(EHReadyOrderModel *)model;

- (NSString *)serializationFoodIDWithArray:(NSArray *)foodArr;

@end


@interface EHReadyOrderModel : NSObject

@property (nonatomic, copy) NSString *ID;
// 支付类型
@property (nonatomic, assign) PayMethodType type;

@property (nonatomic, strong) NSString *mark;

@property (nonatomic, strong) NSString *addressID;

@property (nonatomic, strong) NSString *tradeno;

@end


@interface EHAliPayModel : NSObject

@property (nonatomic, copy) NSString *partner;

@property (nonatomic, copy) NSString *seller_id;

@property (nonatomic, copy) NSString *out_trade_no;

@property (nonatomic, copy) NSString *subject;

@property (nonatomic, strong) NSString *body;

@property (nonatomic, copy) NSString *total_fee;

@property (nonatomic, copy) NSString *notify_url;

@property (nonatomic, copy) NSString *service;

@property (nonatomic, copy) NSString *payment_type;

@property (nonatomic, copy) NSString *input_charset;

@property (nonatomic, copy) NSString *it_b_pay;

- (NSString *)description;

@end
