//
//  PassWord&ChangeMethodView.h
//  payMoney
//
//  Created by 陈志坚 on 16/5/17.
//  Copyright © 2016年 陈志坚. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PassWordChangeMethodView;
@protocol PassWordChangeMethodViewDelegate <NSObject>
@optional
- (void)cancelPay:(PassWordChangeMethodView*)view;
- (void)changePayMethod:(PassWordChangeMethodView*)view;
@end
typedef void(^passWordBlock)(NSString* passWord);


@interface PassWordChangeMethodView : UIView
@property (nonatomic,copy)passWordBlock passBlock;
@property (nonatomic,weak)id <PassWordChangeMethodViewDelegate>delegate;
+ (instancetype)PassWordChangeMethodViewWith:(passWordBlock)block;
- (void)becomeFirstRespons;
@end
