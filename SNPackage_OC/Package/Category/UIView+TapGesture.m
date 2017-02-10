//
//  UIView+TapGesture.m
//  eathome
//
//  Created by Spectator on 16/4/22.
//  Copyright © 2016年 test. All rights reserved.
//

#import "UIView+TapGesture.h"

@implementation UIView (TapGesture)

#pragma mark -- 添加手势
- (void)addTapGestureWithAction:(SEL)action{
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:action];
    
    [self addGestureRecognizer:tapGesture];
    
    tapGesture.numberOfTapsRequired = 1;
}


- (void)addTapGestureWithAction:(SEL)action target:(id)target{
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:target action:action];
    
    [self addGestureRecognizer:tapGesture];
    
    tapGesture.numberOfTapsRequired = 1;
}
@end
