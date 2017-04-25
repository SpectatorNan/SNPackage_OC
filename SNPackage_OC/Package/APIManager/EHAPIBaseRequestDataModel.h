//
//  EHAPIBaseRequestDataModel.h
//  NetworkingAPIDEMO
//
//  Created by Spectator on 16/6/28.
//  Copyright © 2016年 Spectator. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetAPIConfig.h"

@interface EHAPIBaseRequestDataModel : NSObject

@property (nonatomic, strong) NSDictionary *parameters;//请求参数
@property (nonatomic, assign) SNAPIManagerRequestType requestType;//网络请求方式
@property (nonatomic, copy) NSString *urlPath;//网络请求地址
@property (nonatomic, copy) CompletionDataBlock responseBlock;//请求着陆回调

@end
