//
//  TapImageView.h
//  eathome
//
//  Created by Spectator on 16/5/27.
//  Copyright © 2016年 test. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITapImageView : UIImageView

//点击事件
- (void)addTapAction:(void(^)(id obj))tapAction;
// 设置参数带block响应点击事件
- (void)setImageWithURL:(NSURL *)imgUrl placeholderImage:(NSString *)imgName tapAction:(void(^)(id obj))tapAction;



@end
