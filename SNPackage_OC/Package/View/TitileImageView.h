//
//  TitileImageView.h
//  refactorEatHome
//
//  Created by Spectator on 16/7/21.
//  Copyright © 2016年 Spectator. All rights reserved.
//

#import "SNBaseView.h"

@class UITapImageView;
@interface TitileImageView : SNBaseView

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UITapImageView *faceImg;
//  图片下面带label
- (void)setTitle:(NSString *)title imageUrlString:(NSString *)image;

@end
