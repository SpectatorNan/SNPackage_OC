//
//  ShopCartSelectButton.h
//  refactorEatHome
//
//  Created by Spectator on 16/6/14.
//  Copyright © 2016年 Spectator. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShopCartSelectButton : UIButton
// 分区标记
@property (nonatomic,assign) NSInteger  sectionTag;
// 行标记
@property (nonatomic,assign) NSInteger  rowTag;

- (void)setSectionTag:(NSInteger)sectionTag rowTag:(NSInteger)rowTag;
@end
