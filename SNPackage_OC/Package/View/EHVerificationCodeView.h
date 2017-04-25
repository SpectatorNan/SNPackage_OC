//
//  EHVerificationCodeView.h
//  refactorEatHome
//
//  Created by Spectator on 16/6/27.
//  Copyright © 2016年 Spectator. All rights reserved.
//

#import "SNBaseView.h"

@interface EHVerificationCodeView : SNBaseView

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UITextField *codeField;

- (void)stopTiming;
typedef void(^requestCodeBlock)();
@property (nonatomic, copy) requestCodeBlock requestCode;

@end
