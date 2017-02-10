//
//  SNUUID.h
//  eathome
//
//  Created by Spectator on 16/4/29.
//  Copyright © 2016年 test. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
 *  SNKeyChain UUID
 *
 */
#define  KEY_UUID @"com.poandsoul.eathome.UUID"
#define  KEY_USERNAME @"com.poandsoul.eathome.username"
#define  KEY_PASSWORD @"com.poandsoul.eathome.password"


@interface SNUUID : NSObject

+(NSString *)getUUID;

+ (void)saveAccount:(NSString *)account password:(NSString *)password;
+ (void)deleteAccount;
+ (NSString *)getAccount;
+ (NSString *)getPassword;
@end
