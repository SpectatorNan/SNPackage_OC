//
//  SNBaseViewControllerProtocol.h
//  refactorEatHome
//
//  Created by Spectator on 16/6/21.
//  Copyright © 2016年 Spectator. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SNBaseViewControllerProtocol <NSObject>

@optional
- (void)eh_addSubviews;
- (void)eh_layout;
- (void)eh_getNewData;
- (void)eh_responseBlock;

@end
