//
//  UIView+badge.m
//  refactorEatHome
//
//  Created by Spectator on 16/8/20.
//  Copyright © 2016年 Spectator. All rights reserved.
//

#import "UIView+badge.h"

@implementation UIView (badge)
- (UILabel *)setBadgeValue:(NSString *)badgeValue center:(CGPoint)center {
    UILabel *badgeLabel = objc_getAssociatedObject(self, @selector(setBadgeValue:center:));
    SNLog(@"%f %f",self.bounds.size.width,self.bounds.size.height);
    if (!badgeLabel /*&& CGRectContainsPoint(self.bounds, center)*/) {

        badgeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 15, 15)];
        badgeLabel.text = badgeValue;
        badgeLabel.textColor = [UIColor redColor];
        badgeLabel.font = [UIFont boldSystemFontOfSize:10];
        [self addSubview:badgeLabel];
        badgeLabel.textAlignment = NSTextAlignmentCenter;
        badgeLabel.center = center;
        badgeLabel.backgroundColor = [UIColor whiteColor];
        badgeLabel.layer.cornerRadius = 7.5;
        badgeLabel.clipsToBounds = YES;
    }
    if ([badgeValue integerValue]) {
        if ([badgeValue integerValue] > 99) {
            badgeLabel.text = @"99+";
        } else {
            badgeLabel.text = badgeValue;
        }
        badgeLabel.hidden = NO;
    } else {
        badgeLabel.hidden = YES;
    }
    [badgeLabel setAdjustsFontSizeToFitWidth:YES];
    objc_setAssociatedObject(self, @selector(setBadgeValue:center:), badgeLabel, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    return badgeLabel;
}
@end
