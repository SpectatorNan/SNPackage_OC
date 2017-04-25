//
//  SNDeviceMacro.h
//  refactorEatHome
//
//  Created by Spectator on 16/6/20.
//  Copyright © 2016年 Spectator. All rights reserved.
//

#ifndef SNDeviceMacro_h
#define SNDeviceMacro_h


#pragma mark -- 宽高比
#define kScaleFrom_iPhone5_DesginWidth(_X_) (_X_ * (kSCREEN_WIDTH/320))
#define kScaleFrom_iPhone5_DesginHeight(_X_) (_X_ * (kSCREEN_HEIGHT/568))


#pragma mark -- 屏幕大小及倍率
#define kScreen_Bounds [UIScreen mainScreen].bounds
#define kSCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width
#define kSCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height
#define kSCREEN_SCALE [UIScreen mainScreen].scale


#pragma mark -- Tabbar Navi 高度
#define kTABBAR_HEIGHT 49
#define kNAVI_HEIGHT 64

#pragma mark -- 系统版本
#define k_Is_iOS8 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)


#pragma mark -- 判断手机型号
#define kDevice_Is_iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define kDevice_Is_iPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)
#define kDevice_Is_iPhone6Plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)


#endif /* SNDeviceMacro_h */
