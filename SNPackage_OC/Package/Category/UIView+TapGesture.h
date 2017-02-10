//
//  UIView+TapGesture.h
//  eathome
//
//  Created by Spectator on 16/4/22.
//  Copyright © 2016年 test. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (TapGesture)


- (void)addTapGestureWithAction:(SEL)action;

- (void)addTapGestureWithAction:(SEL)action target:(id)target;
@end
