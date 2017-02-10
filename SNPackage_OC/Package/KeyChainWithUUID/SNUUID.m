//
//  SNUUID.m
//  eathome
//
//  Created by Spectator on 16/4/29.
//  Copyright © 2016年 test. All rights reserved.
//

#import "SNUUID.h"
#import "SNKeyChain.h"

@implementation SNUUID

+ (NSString *)getUUID {
    
    NSString * strUUID = (NSString *)[SNKeyChain load:KEY_UUID];
    
    //首次执行该方法时，uuid为空
    if ([strUUID isEqualToString:@""] || !strUUID)
    {
        //生成一个uuid的方法
        CFUUIDRef uuidRef = CFUUIDCreate(kCFAllocatorDefault);
        
        strUUID = (NSString *)CFBridgingRelease(CFUUIDCreateString (kCFAllocatorDefault,uuidRef));
        
        //将该uuid保存到keychain
        [SNKeyChain save:KEY_UUID data:strUUID];
 
    }
    return strUUID;
}

+ (void)saveAccount:(NSString *)account password:(NSString *)password {
    
    NSString *username = [self getAccount];
    NSString *pass = [self getPassword];
    
    if ([username isEqualToString:@""] || !username || !pass || [pass isEqualToString:@""] || ![username isEqualToString:account] || ![pass isEqualToString:password]) {
        
        [SNKeyChain save:KEY_USERNAME data:account];
        [SNKeyChain save:KEY_PASSWORD data:password];
    }
}

+ (void)deleteAccount {
    
    [SNKeyChain deleteKeyData:KEY_USERNAME];
    [SNKeyChain deleteKeyData:KEY_PASSWORD];
}

+ (NSString *)getAccount {
    
    return [SNKeyChain load:KEY_USERNAME];
}

+ (NSString *)getPassword {
    
    return [SNKeyChain load:KEY_PASSWORD];
}

@end
