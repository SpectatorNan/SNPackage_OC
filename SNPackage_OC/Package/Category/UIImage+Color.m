//
//  UIImage+Color.m
//  refactorEatHome
//
//  Created by Spectator on 16/7/21.
//  Copyright © 2016年 Spectator. All rights reserved.
//

#import "UIImage+Color.h"

@implementation UIImage (Color)

UIImage * imageWithColor(UIColor *Color) {
    
    CGRect rect = CGRectMake(0, 0, 1, 1);
    
    UIGraphicsBeginImageContext(rect.size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [Color CGColor]);
    
    CGContextFillRect(context, rect);
    
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return theImage;
}

@end
