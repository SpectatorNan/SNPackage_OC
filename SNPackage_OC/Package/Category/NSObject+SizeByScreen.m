//
//  NSObject+SizeByScreen.m
//  云商风云
//
//  Created by 陈志坚 on 16/5/9.
//  Copyright © 2016年 admin. All rights reserved.
//

#import "NSObject+SizeByScreen.h"

@implementation NSObject (SizeByScreen)
- (NSNumber*)numberByScreenWithFloat:(CGFloat)number{
    if ([UIScreen mainScreen].bounds.size.width == 414) {
        return @(number);
    }else if ([UIScreen mainScreen].bounds.size.width == 375){
        return @(number/1.104);
    }else{
        return @(number/1.29375);
    }
}
- (CGFloat)floatByScreenWithFloat:(CGFloat)number{
    if ([UIScreen mainScreen].bounds.size.width == 414) {
        return number;
    }else if ([UIScreen mainScreen].bounds.size.width == 375){
        return number/1.104;
    }else{
        return number/1.29375;
    }
}
@end
