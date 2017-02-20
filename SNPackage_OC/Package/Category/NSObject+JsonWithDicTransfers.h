//
//  NSObject+JsonWithDicTransfers.h
//  refactorEatHome
//
//  Created by Spectator on 2017/2/20.
//  Copyright © 2017年 Spectator. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (JsonWithDicTransfers)
+ (NSDictionary *)sn_dictionaryWithJsonString:(NSString *)jsonString;
+ (NSString*)sn_dictionaryToJson:(NSDictionary *)dic;
@end
