//
//  EHAPIClient.h
//  EHAPIDemo
//
//  Created by Spectator on 16/6/28.
//  Copyright © 2016年 Spectator. All rights reserved.
//

#import "EHAPIBaseClient.h"

#define kBaseURL @"http://api.7nongzhu.com"

typedef NS_ENUM(NSUInteger, EHAPIClassificationType) {
    /**
     *  登录接口
     */
    EHAPIClassificationTypeLogin = 0,
    /**
     *  第三方登录
     */
    EHAPIClassificationType3PartyLogin,
    /**
     *  注册接口
     */
    EHAPIClassificationTypeRegisterUser,
    /**
     *  验证码
     */
    EHAPIClassificationTypeSendSMS,
    /**
     *  收货地址
     */
    EHAPIClassificationTypeQueryUserAddress,
    /**
     *  添加收货地址
     */
    EHAPIClassificationTypeAddUserAddress,
    /**
     *  修改收货地址
     */
    EHAPIClassificationTypeModifyUserAddress,
    /**
     *  删除收货地址
     */
    EHAPIClassificationTypeDeleteUserAddress,
    /**
     *  默认收货地址
     */
    EHAPIClassificationTypeDefaultUserAddess,
    /**
     *  主屏信息
     */
    EHAPIClassificationTypeRecommendMainInfo,
    /**
     *  主屏选择类别
     */
    EHAPIClassificationTypeRecommendMainByType,
    /**
     *  主屏广告
     */
    EHAPIClassificationTypeRecommendAD,
    /**
     *  集市信息
     */
    EHAPIClassificationTypeMarketMainInfo,
    /**
     *  集市选择类别
     */
    EHAPIClassificationTypeMarketMainByType,
    /**
     *  集市搜索
     */
    EHAPIClassificationTypeMarketSearchByKey,
    /**
     *  购物车
     */
    EHAPIClassificationTypeShoppingCart,
    /**
     *  自动登录
     */
    EHAPIClassificationTypeUserInfo,
    /**
     *  某个用户作品
     */
    EHAPIClassificationTypeGetUserWork,
    /**
     *  某个作品
     */
    EHAPIClassificationTypeGetWork,
    /**
     *  某个菜品下的作品
     */
    EHAPIClassificationTypeGetWorkByMainInfo,
    /**
     *  修改头像
     */
    EHAPIClassificationTypeModifyFace,
    /**
     *  修改用户信息
     */
    EHAPIClassificationTypeModifyUserInfo,
    /**
     *  加入购物车
     */
    EHAPIClassificationTypeAddCart,
    /**
     *  修改购物车
     */
    EHAPIClassificationTypeModifyCart,
    /**
     *  添加收藏
     */
    EHAPIClassificationTypeAddFav,
    /**
     *  取消收藏
     */
    EHAPIClassificationTypeDelFav,
    /**
     *  收藏列表
     */
    EHAPIClassificationTypeFavList,
    /**
     *  在线支付
     */
    EHAPIClassificationTypePay,
    /**
     *  万象优图Sign
     */
    EHAPIClassificationTypeUploadUserIconSign
};

@interface EHAPIClient : EHAPIBaseClient

@property (nonatomic, copy, readonly) NSString *baseURL;

+ (EHAPIClient *)shareAPIClient;

- (void)POSTWithClassificationOfAPI:(EHAPIClassificationType)classificationType parameters:(id)parameters complete:(CompletionDataBlock)complete;

+ (BOOL)testingResponseSuccess:(id)data;
+ (NSUInteger)testingResposeCode:(id)data;


@end
