//
//  SNToolMacro.h
//  refactorEatHome
//
//  Created by Spectator on 16/6/20.
//  Copyright © 2016年 Spectator. All rights reserved.
//

#ifndef SNToolMacro_h
#define SNToolMacro_h


#define CLASS(c) [c class]

#define CLASS_IS_SAME(obj, cl) [obj isKindOfClass:CLASS(cl)]

#ifdef DEBUG
//# define SNLog(fmt, ...) NSLog((@"[文件名:%s]\n" "[函数名:%s]\n" "[行号:%d] \n" fmt), __FILE__, __FUNCTION__, __LINE__, ##__VA_ARGS__);
# define SNLog(fmt, ...) NSLog((@"[函数名:%s]\n" "[行号:%d] \n" fmt), __FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
# define SNLog(...);
#endif

#endif /* SNToolMacro_h */
