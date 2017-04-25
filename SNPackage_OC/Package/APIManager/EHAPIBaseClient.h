//
//  EHAPIBaseClient.h
//  EHAPIDemo
//
//  Created by Spectator on 16/6/28.
//  Copyright © 2016年 Spectator. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetAPIConfig.h"

@class EHAPIBaseRequestDataModel;

@interface EHAPIBaseClient : NSObject

- (void)GETWithURLStr:(NSString *)URLStr param:(id)param complete:(CompletionDataBlock)complete;

- (void)POSTWithURLStr:(NSString *)URLStr param:(id)param complete:(CompletionDataBlock)complete;

- (void)requestWithDataModel:(EHAPIBaseRequestDataModel *)dataModel;

@end
