//
//  SNBaseViewProtocol.h
//  refactorEatHome
//
//  Created by Spectator on 16/6/20.
//  Copyright © 2016年 Spectator. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SNBaseViewProtocol <NSObject>

@optional
- (instancetype)initWithModel:(id)viewModel;

- (void)eh_setupViews;
- (void)eh_layout;

@end
