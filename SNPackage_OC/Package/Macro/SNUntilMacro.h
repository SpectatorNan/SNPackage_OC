//
//  SNColorMacro.h
//  refactorEatHome
//
//  Created by Spectator on 16/6/20.
//  Copyright © 2016年 Spectator. All rights reserved.
//


#pragma mark -- Notification

#define kWXPay_Resp_noti @"weixinzhifu_huiidao_noti"
#define kWXPay_Resp_result_success @"WXPay_success"
#define kWXPay_Resp_result_userCancel @"WXPay_userCancel"
#define kWXPay_Resp_result_failure @"WXPay_failure"

#define kALiPay_Resp_noti @"zhifubaozhifu_huidiao_noti"
#define kALiPay_Resp_result_success @"ALiPay_success"
#define kALiPay_Resp_result_cancel @"ALiPay_cancel"
#define kALiPay_Resp_result_fail @"ALiPay_fail"
#define kAliPay_appID @"2016051801414213"
#define kAliPay_pID @"2088511670550666"
#define kAliURLScheme @"com.poandsoul.7nongzhualipay"


#define kUnionPay_Resp_noti @"yinlianzhifu_huidiao_noti"
#define kUnionURLScheme @"com.poandsoul.7nongzhuuppay"
#define kUnionPay_Resp_result_success @"UnionPay_success"
#define kUnionPay_Resp_result_cancel @"UnionPay_cancel"
#define kUnionPay_Resp_result_fail @"UnionPay_fail"

#define kNoti_GoodsClearForPayManager @"GoodClearForPayManager"
#define kPayMangerEnding @"payMangerEnding"

#pragma mark --  颜色

#define UICOLOR_WHITE_SEGMENT [UIColor rgb:0xffffff alpha:0.5]
#define UICOLOR_WHITE [UIColor rgb:0xffffff]
#define UICOLOR_GRAY [UIColor rgb:0xbababa]
#define UICOLOR_BLACK [UIColor rgb:0x000000]

#define UICOLOR_LIGHTGRAY_BG [UIColor rgb:0xf3f3f3]
#define UICOLOR_ORANGE_NAVI [UIColor rgb:0xff5800]
#define UICOLOR_ORANGE_DEEP [UIColor rgb:0xff5820]
#define UICOLOR_CLEAR [UIColor clearColor]
#define UICOLOR_GRAY_TABLEBG [UIColor rgb:0xfafafa]
#define UICOLOR_GRAY_BG RGB(222,222,222)

#define UICOLOR_WHITE_LIGHTORANGE RGB(255, 238, 230)
#define UICOLOR_RecomCellTimeTextColor RGB(147,148,149)
#define UICOLOR_RecomCellRepTextColor RGB(253,90,1)
#define UICOLOR_RecomCellDescTextColor RGB(75,76,77)
#define UICOLOR_GREEN_BUTTON RGB(74, 197, 108)
#define UICOLOR_GREEN_ADDADDRESSBTN [UIColor rgb:0x4bc46b]

#define RGB( r, g, b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
#define RGBA( r, g, b, a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

#pragma mark --  字体
#define kScaleFrom_iPhone5_DesginFontSize(_X_) (_X_ * (kSCREEN_WIDTH/320))

#define UIFONT_Adapter_Size(s) [UIFont systemFontOfSize: kScaleFrom_iPhone5_DesginFontSize(s)]
#define UIFONT_Adapter_Blod(s) [UIFont boldSystemFontOfSize: kScaleFrom_iPhone5_DesginFontSize(s)]
#define UIFONT_Adapter_Name(name, fontSize) [UIFont fontWithName:name size:kScaleFrom_iPhone5_DesginFontSize(fontSize)]


#define UIFONT_UnAdapter_Blod(s) [UIFont boldSystemFontOfSize: s]
#define UIFONT_UnAdapter_Size(s) [UIFont systemFontOfSize: s]
#define UIFONT_UnAdapter_Name(name, fontSize) [UIFont fontWithName:name size:fontSize]

#define UIFONT_Name(_S_, _M_,...)  [UIFont fontWithName:[NSString stringWithFormat:(_S_), ##__VA_ARGS__] size:_M_]

#pragma mark -- image

#define kImageStrSplit @"%@?imageView2/0/w/%f"