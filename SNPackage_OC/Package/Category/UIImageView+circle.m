//
//  UIImageView+circle.m
//  eathome
//
//  Created by spectator Mr.Z on 16/2/23.
//  Copyright © 2016年 test. All rights reserved.
//

#import "UIImageView+circle.h"

@implementation UIImageView (circle)

- (void)circle {
    CGFloat r = MIN(self.frame.size.width, self.frame.size.height);
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, r, r);
    self.layer.cornerRadius = r / 2;
    self.clipsToBounds = YES;
}

@end
