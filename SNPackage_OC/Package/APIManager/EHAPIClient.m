//
//  EHAPIClient.m
//  EHAPIDemo
//
//  Created by Spectator on 16/6/28.
//  Copyright © 2016年 Spectator. All rights reserved.
//

#import "EHAPIClient.h"
#import "EHAPIBaseRequestDataModel.h"
#import "URLs.h"

@interface EHAPIClient ()

@property (nonatomic, copy, readwrite) NSString *baseURL;

@property (nonatomic, strong) NSArray *urlPathArr;

@end

@implementation EHAPIClient
static EHAPIClient *_shareClient = nil;
static dispatch_once_t onceToken;

+ (EHAPIClient *)shareAPIClient {
    
    dispatch_once(&onceToken, ^{
        _shareClient = [[EHAPIClient alloc] init];
    });
    
    return _shareClient;
}

    
- (NSString *)baseURL {
    
    if (!_baseURL) {
        _baseURL = kBaseURL;
    }
    
    return _baseURL;
}

- (NSArray *)urlPathArr {
    
    if (!_urlPathArr) {
        _urlPathArr = @[sNetLogin,s3PartyLogin,sNetUserRegister,sNetRequestVerificationCode,sNetUserAddress,sNetAddUserAddress,sNetModifyUserAddress,sNetDeleUserAddress,sNetSetDefaultAddress,sNetMainInfo,sNetMainInfoForType,sNetMainInfoAD,sNetMarketInfo,sNetMarketInfoForType,sNetMarketSearch,sNetUserShoppingCart,sNetUserInfo,sNetGetUserWork,sNetGetWork,sNetGetWorkByMainInfo,sNetModifyUserFace,sNetModifyUserInfo,sNetAddCart,sNetModifyCart,sNetAddFav,sNetDelFav,sNetFavList,sNetPay,sNetGetUserIconSign];
    }
    return _urlPathArr;
}

- (void)POSTWithClassificationOfAPI:(EHAPIClassificationType)classificationType parameters:(id)parameters complete:(CompletionDataBlock)complete {
    
    NSString *URLStr = [self splicingURLStrByType:classificationType];
    
    EHAPIBaseRequestDataModel *dataModel = [self dataModelWithURLStr:URLStr param:parameters requestType:SNAPIManagerRequestTypePost complete:^(id data, NSError *error) {
        complete(data, error);
    }];
    
    [self requestWithDataModel:dataModel];
}

- (EHAPIBaseRequestDataModel *)dataModelWithURLStr:(NSString *)URLStr param:(id)param requestType:(SNAPIManagerRequestType)requestType complete:(CompletionDataBlock)complete {
    
    EHAPIBaseRequestDataModel *model = [[EHAPIBaseRequestDataModel alloc] init];
   
    model.urlPath = URLStr;
    model.parameters = param;
    model.requestType = requestType;
    model.responseBlock = complete;
    
    return model;
}

- (NSString *)splicingURLStrByType:(EHAPIClassificationType)classificationType {
    
    
    return [self splicingURLWithString:self.urlPathArr[classificationType]];

}

- (NSString *)splicingURLWithString:(NSString *)pathStr {
    
    NSString *URLSTR = @"";
    
    if (self.baseURL && ![pathStr hasPrefix:@"http"]) {
        
        if ([self.baseURL length] > 0 && ![self.baseURL hasSuffix:@"/"]) {
            self.baseURL = [self.baseURL stringByAppendingString:@"/"];
        }
        
        
        if ([pathStr length] > 0 && [pathStr hasPrefix:@"/"]) {
            pathStr = [pathStr substringWithRange:NSMakeRange(1, [pathStr length]-1)];
        }
        
        URLSTR = [NSString stringWithFormat:@"%@%@",self.baseURL,pathStr];
    }
    
    return URLSTR;
}

+ (BOOL)testingResponseSuccess:(id)data {
    
    NSDictionary *dataDic = (NSDictionary*)data;
    
    NSString *code = dataDic[@"code"];
    
    if ([code isEqualToString:@"0"]) {
        return YES;
    } else {
        return  NO;
    }
 
}

+ (NSUInteger)testingResposeCode:(id)data {
    
    NSDictionary *dataDic = (NSDictionary*)data;
    
    NSString *code = dataDic[@"code"];
    
    return [code integerValue];
}

@end
