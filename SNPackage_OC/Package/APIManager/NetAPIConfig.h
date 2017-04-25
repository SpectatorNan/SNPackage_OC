//
//  NetAPIConfig.h
//  NetworkingAPIDEMO
//
//  Created by Spectator on 16/6/28.
//  Copyright © 2016年 Spectator. All rights reserved.
//

#ifndef NetAPIConfig_h
#define NetAPIConfig_h


#endif /* NetAPIConfig_h */

typedef NS_ENUM(NSUInteger, SNAPIManagerRequestType) {
    SNAPIManagerRequestTypeGet,     //get请求
    SNAPIManagerRequestTypePost,    //post请求
    SNAPIManagerRequestTypePostUpload,  //post数据请求
    SNAPIManagerRequestTypeGetDownload  //下载文件请求，不做返回值解析
};

typedef void (^ProgressBlock)(NSProgress *taskProgress);
typedef void (^CompletionDataBlock)(id data, NSError *error);
typedef void (^ErrorAlertSelectIndexBlock)(NSUInteger buttonIndex);

#define kSMS_Register @"register"
#define kSMS_ModifyAddress @"modifyAddress"
#define kSMS_AddAddress @"addAddress"