//
//  NSObject+SizeByScreen.h
//  云商风云
//
//  Created by 陈志坚 on 16/5/9.
//  Copyright © 2016年 admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#define sizeScreenByNumber(r)  [self numberByScreenWithFloat:r]
#define sizeScreenByFloat(r)  [self floatByScreenWithFloat:r]
@interface NSObject (SizeByScreen)
- (NSNumber*)numberByScreenWithFloat:(CGFloat)number;
- (CGFloat)floatByScreenWithFloat:(CGFloat)number;
@end
