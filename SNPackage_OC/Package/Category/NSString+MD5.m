//
//  NSString+MD5.m
//  eathome
//
//  Created by Spectator on 16/4/29.
//  Copyright © 2016年 test. All rights reserved.
//

#import "NSString+MD5.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (MD5)

//md5 32位 加密 （小写）

- (NSString*)md532BitLower {

    const char *cStr = [self UTF8String];
 
    unsigned char result[16];
   
    
 
    NSNumber *num = [NSNumber numberWithUnsignedLong:strlen(cStr)];
  
    CC_MD5( cStr,[num intValue], result );

    return [[NSString stringWithFormat:
             
             @"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
             
             result[0], result[1], result[2], result[3],
             
             result[4], result[5], result[6], result[7],
            
             result[8], result[9], result[10], result[11],
             
             result[12], result[13], result[14], result[15]
           
             ] lowercaseString];
 
}


//md5 16位加密 （大写）

- (NSString*)md532BitUpper {
 
    const char *cStr = [self UTF8String];
  
    unsigned char result[16];

    NSNumber *num = [NSNumber numberWithUnsignedLong:strlen(cStr)];
 
    CC_MD5( cStr,[num intValue], result );

    return [[NSString stringWithFormat:
           
             @"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
             
             result[0], result[1], result[2], result[3],
             result[4], result[5], result[6], result[7],
            
             result[8], result[9], result[10], result[11],
          
             result[12], result[13], result[14], result[15]
            
             ] uppercaseString];
  
}




@end
