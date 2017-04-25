//
//  EHAPIBaseClient.m
//  EHAPIDemo
//
//  Created by Spectator on 16/6/28.
//  Copyright © 2016年 Spectator. All rights reserved.
//

#import "EHAPIBaseClient.h"
#import "EHAPIBaseRequestDataModel.h"
#import "AFHTTPSessionManager.h"

@interface EHAPIBaseClient ()

@property (nonatomic, strong) AFHTTPSessionManager *HTTPManager;

@end

@implementation EHAPIBaseClient


- (AFHTTPSessionManager *)HTTPManager {
    
    if (!_HTTPManager) {
        _HTTPManager = [AFHTTPSessionManager manager];
        _HTTPManager.requestSerializer.timeoutInterval = 30.f;
    }
    
    return _HTTPManager;
}

- (void)requestWithDataModel:(EHAPIBaseRequestDataModel *)dataModel {
    
    
    if (dataModel.requestType == SNAPIManagerRequestTypeGet) {
        
        [self GETWithURLStr:dataModel.urlPath param:dataModel.parameters complete:^(id data, NSError *error) {
            dataModel.responseBlock(data,error);
        }];
        
    } else if (dataModel.requestType == SNAPIManagerRequestTypePost) {
        
        [self POSTWithURLStr:dataModel.urlPath param:dataModel.parameters complete:^(id data, NSError *error) {
            dataModel.responseBlock(data, error);
        }];
        
    }
    
}


- (void)GETWithURLStr:(NSString *)URLStr param:(id)param complete:(CompletionDataBlock)complete {
    
    [self.HTTPManager GET:URLStr parameters:param progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if (complete) {
            complete(responseObject, nil);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (complete) {
            complete(nil,error);
        }
    }];
    
}

- (void)POSTWithURLStr:(NSString *)URLStr param:(id)param complete:(CompletionDataBlock)complete {
    
    [self.HTTPManager POST:URLStr parameters:param progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if (complete) {
            complete(responseObject, nil);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (complete) {
            complete(nil,error);
        }
        
    }];
}

@end
