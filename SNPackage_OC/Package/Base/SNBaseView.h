//
//  SNBaseView.h
//  refactorEatHome
//
//  Created by Spectator on 16/6/20.
//  Copyright © 2016年 Spectator. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SNBaseViewProtocol.h"

@interface SNBaseView : UIView<SNBaseViewProtocol>

// 响应view的点击手势
- (void)addTapAction:(void (^)(id obj))tapAction;

@end
