//
//  SNMethodMacro.h
//  refactorEatHome
//
//  Created by Spectator on 16/6/20.
//  Copyright © 2016年 Spectator. All rights reserved.
//

#pragma mark --  创建 block 使用的weakself
#define WEAKLY(_w_, _s_) __weak __typeof(_s_) _w_ = _s_;
#define STRONGLY(_s_, _w_) __strong __typeof(_w_) _s_ = _w_;


#pragma mark --  GCD 主线程
#define GCD_ASYNC_MAINQUEUE(method) dispatch_async(dispatch_get_main_queue(), ^{ \
method; \
})