//
//  EHPayManager.m
//  refactorEatHome
//
//  Created by Spectator on 16/8/17.
//  Copyright © 2016年 Spectator. All rights reserved.
//

#import "EHPayManager.h"
#import "ShopCartCellModel.h"
#import "WXApi.h"
#import <AlipaySDK/AlipaySDK.h>
#import "RSADataSigner.h"
#import "Order.h"
#import "UPPaymentControl.h"

@implementation EHPayManager

+ (instancetype)manager {
    
    EHPayManager *mgr = [[EHPayManager alloc] init];
    
    [[[NSNotificationCenter defaultCenter] rac_addObserverForName:kWXPay_Resp_noti object:nil] subscribeNext:^(NSNotification *noti) {
        
        NSString *respStr = [noti object];
        if ([respStr isEqualToString:kWXPay_Resp_result_success]) {
            
        } else if ([respStr isEqualToString:kWXPay_Resp_result_userCancel]) {
            
        } else if ([respStr isEqualToString:kWXPay_Resp_result_failure]) {
            
        }
        
        [[NSNotificationCenter defaultCenter] postNotificationName:kNoti_GoodsClearForPayManager object:respStr];
    }];
    
    [[[NSNotificationCenter defaultCenter] rac_addObserverForName:kALiPay_Resp_noti object:nil] subscribeNext:^(NSNotification *noti) {
        NSString *respStr = [noti object];
        if ([respStr isEqualToString:kALiPay_Resp_result_success]) {
            
        } else if ([respStr isEqualToString:kALiPay_Resp_result_cancel]) {
            
        } else if ([respStr isEqualToString:kALiPay_Resp_result_fail]) {
            
        }
        
        [[NSNotificationCenter defaultCenter] postNotificationName:kNoti_GoodsClearForPayManager object:respStr];
    }];
    
    return mgr;
}


- (void)requestPrepareOrderWithModel:(EHReadyOrderModel *)model {
    
    NSMutableDictionary *dic = [ @{
                          @"id":model.ID,
                          @"type":@(model.type),
                          @"mark":model.mark,
                          @"addressID":model.addressID,
                          
                          } mutableCopy];
    if (model.tradeno) {
        [dic setObject:model.tradeno forKey:@"tradeno"];
    }
    
    [[EHAPIClient shareAPIClient] POSTWithClassificationOfAPI:EHAPIClassificationTypePay parameters:dic complete:^(id data, NSError *error) {
        
        BOOL success = [EHAPIClient testingResponseSuccess:data];
        
        if (success) {
            
            NSString *jsonString = data[@"Msg"];
            NSArray *jsonArr = [jsonString componentsSeparatedByString:@"|"];
        
        switch (model.type) {
    
            case PayMethodTypeWXPay:
                [self parseWXPrepare:jsonArr];
                break;
            case PayMethodTypeAliPay:
                [self parseAliPrepare:jsonArr];
                break;
            case PayMethodTypeUnionPay:
                [self parseUnionPrepare:jsonArr];
                break;
            default:
                break;
        }
            
            
        }
        
    }];
}


- (NSString *)serializationFoodIDWithArray:(NSArray *)foodArr {
    
    __block NSString *idStr = @"";
    
    [foodArr enumerateObjectsUsingBlock:^(ShopCartCellModel* obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        NSString *ID = obj.VegetableID;
        
        if (idx == 0) {
            idStr = ID;
        }
        else
        {
            idStr = [NSString stringWithFormat:@"%@;%@",idStr,ID];
        }
        
    }];
    
    return idStr;
}


- (void)parseWXPrepare:(NSArray *)jsonArr {
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    
    NSArray *keyArr = @[@"appid",@"mch_id",@"prepay_id",@"timestamp",@"noncestr",@"sign",@"trade_no"];
    
    [jsonArr enumerateObjectsUsingBlock:^(NSString* obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [dic setObject:jsonArr[idx] forKey:keyArr[idx]];
    }];
    
    
    SNLog(@"WXPrepare Dic %@",dic);
    
    [self turnUpWXPay:dic];
    

}

- (void)parseAliPrepare:(NSArray *)jsonArr {
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];

    NSArray *keyArr = @[@"sign",@"total_fee",@"trade_no"];
    
    [jsonArr enumerateObjectsUsingBlock:^(NSString* obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [dic setObject:jsonArr[idx] forKey:keyArr[idx]];
    }];
    
    
    SNLog(@"AliPrepare Dic %@",dic);

    [self turnUpAliPay:dic];
}

- (void)parseUnionPrepare:(NSArray *)jsonArr {
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];

    
    NSArray *keyArr = @[@"tn",@"trade_no"];
    
    [jsonArr enumerateObjectsUsingBlock:^(NSString* obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [dic setObject:jsonArr[idx] forKey:keyArr[idx]];
    }];
    
    
    SNLog(@"UnionPrepare Dic %@",dic);
    if (self.unionPayBlock) {
        self.unionPayBlock(dic);
    }
}

#pragma  mark == 微信支付
- (void)turnUpWXPay:(NSDictionary *)dic {
    
    PayReq *request = [[PayReq alloc] init];
    request.partnerId = [dic objectForKey:@"mch_id"];
    request.prepayId = [dic objectForKey:@"prepay_id"];
    request.package = @"Sign=WXPay";
    request.nonceStr = [dic objectForKey:@"noncestr"];
    request.timeStamp = [[dic objectForKey:@"timestamp"] intValue];
    request.sign = [dic objectForKey:@"sign"];
    
    [WXApi sendReq:request];
}


- (void)turnUpAliPay:(NSDictionary *)dic {
    
    NSString *signedString = [dic objectForKey:@"sign"];
    
   
    EHAliPayModel *aliOrder = [EHAliPayModel new];
    aliOrder.partner = @"2088511670550666";
    aliOrder.seller_id = @"zhaoyue@poandsoul.com";
    aliOrder.out_trade_no = [dic objectForKey:@"trade_no"];
    aliOrder.subject = @"七农猪在线支付";
    aliOrder.body = @"七农猪在线支付";
    aliOrder.total_fee = [dic objectForKey:@"total_fee"];
    aliOrder.notify_url = @"http%3A%2F%2Fapi.7nongzhu.com%2Fapi_v1%2Fpay%2Falipay_callback.ashx";
    aliOrder.service = @"mobile.securitypay.pay";
    
    NSString *orderInfo = [aliOrder description];
    NSString *signedStr = [dic objectForKey:@"sign"] ;
    
    // NOTE: 如果加签成功，则继续执行支付
    if (signedString != nil) {
        //应用注册scheme,在AliSDKDemo-Info.plist定义URL types
        NSString *appScheme = kAliURLScheme;
        
        NSString *orderInfoEncoded = [NSString stringWithFormat:@"%@&sign=\"%@\"&sign_type=\"%@\"",
                                      orderInfo, signedStr, @"RSA"];
        
        SNLog(@"orderstring- %@",orderInfoEncoded);
        // NOTE: 调用支付结果开始支付
        [[AlipaySDK defaultService] payOrder:orderInfoEncoded fromScheme:appScheme callback:^(NSDictionary *resultDic) {
            NSLog(@"reslut = %@",resultDic);
            
            NSString *memo = resultDic[@"memo"];
            NSString *resultStatus = resultDic[@"resultStatus"];
            if ([memo isEqualToString:@"用户中途取消"]) {
                [[NSNotificationCenter defaultCenter] postNotificationName:kNoti_GoodsClearForPayManager object:kALiPay_Resp_result_cancel];
            } else if ([resultStatus integerValue] == 9000) {
                [[NSNotificationCenter defaultCenter] postNotificationName:kNoti_GoodsClearForPayManager object:kALiPay_Resp_result_success];
            } else {
                [[NSNotificationCenter defaultCenter] postNotificationName:kNoti_GoodsClearForPayManager object:kALiPay_Resp_result_fail];
            }
        }];
    }
    
    
    

}


- (NSString *)createOrderString:(NSDictionary *)signDic {
    
    NSString *partner = @"2088511670550666";
    NSString *seller_id = @"zhaoyue@poandsoul.com";
    NSString *out_trade_no = [signDic objectForKey:@"trade_no"];
    NSString *subject = @"七农猪在线支付";
    NSString *body = @"七农猪在线支付";
    NSString *total_fee = [signDic objectForKey:@"total_fee"];
    
    //http://api.7nongzhu.com/api_v1/pay/alipay_callback.ashx
    NSString *notify_url = @"http%3A%2F%2Fapi.7nongzhu.com%2Fapi_v1%2Fpay%2Falipay_callback.ashx";
    NSString *service = @"mobile.securitypay.pay";
    NSString *payment_type = @"1";
    NSString *_input_charset = @"utf-8";
    NSString *it_b_pay = @"1d";
    NSString *sign = [signDic objectForKey:@"sign"];
    NSString *sign_type = @"RSA";
    
    NSString *orderString = [NSString stringWithFormat:@"partner=\"%@\"&seller_id=\"%@\"&out_trade_no=\"%@\"&subject=\"%@\"&body=\"%@\"&total_fee=\"%@\"&notify_url=\"%@\"&service=\"%@\"&payment_type=\"%@\"&_input_charset=\"%@\"&it_b_pay=\"%@\"&sign=\"%@\"&sign_type=\"%@\"",partner,seller_id,out_trade_no,subject,body,total_fee,notify_url,service,payment_type,_input_charset,it_b_pay,sign,sign_type];
    
    return orderString;
}


- (NSString*)urlEncodedString:(NSString *)string
{
  
    NSString* encodedValue = string;
    if (string.length > 0) {
        encodedValue = (__bridge_transfer  NSString*)CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (__bridge CFStringRef)string, NULL, (__bridge CFStringRef)@"!*'();:@&=+$,/?%#[]", kCFStringEncodingUTF8 );
    }
    return encodedValue;
}

- (void)dealloc {
    
    SNLog(@"支付管理被销毁了");
}

@end


@implementation EHReadyOrderModel


@end


@implementation EHAliPayModel

- (NSString *)description {
    
    NSMutableString * discription = [NSMutableString string] ;
    [discription appendFormat:@"partner=\"%@\"", self.partner];
    [discription appendFormat:@"&seller_id=\"%@\"", self.seller_id];
    [discription appendFormat:@"&out_trade_no=\"%@\"", self.out_trade_no];
    [discription appendFormat:@"&subject=\"%@\"", self.subject];
    [discription appendFormat:@"&body=\"%@\"", self.body];
    [discription appendFormat:@"&total_fee=\"%@\"", self.total_fee];
    [discription appendFormat:@"&notify_url=\"%@\"", self.notify_url];
    [discription appendFormat:@"&service=\"%@\"", self.service];
    [discription appendFormat:@"&_input_charset=\"utf-8\""];
    [discription appendFormat:@"&payment_type=\"1\""];
    [discription appendFormat:@"&it_b_pay=\"1d\""];
    return discription;
}



@end