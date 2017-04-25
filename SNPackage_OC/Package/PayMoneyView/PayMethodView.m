//
//  PayMethodView.m
//  payMoney
//
//  Created by Spectator on 16/8/17.
//  Copyright © 2016年 陈志坚. All rights reserved.
//

#import "PayMethodView.h"
#import "MorePayMthod.h"


@interface PayMethodView ()<MorePayMthodDelegate,UIGestureRecognizerDelegate>//

@property (nonatomic, strong)  UIGestureRecognizer *disTap;

@end


@implementation PayMethodView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        [self setup];
    }
    
    return self;
}

- (void)setup {
    
    self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3];
    
    
    MorePayMthod* MorePayMethodView = [MorePayMthod new];
    MorePayMethodView.delegate = self;
    [self addSubview:MorePayMethodView];
    
    [MorePayMethodView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.centerY.equalTo(self).multipliedBy(0.85);
        make.width.equalTo(self).multipliedBy(0.85);
        make.height.equalTo(self).multipliedBy(0.35);
    }];
    
    [self addTapGestureWithAction:@selector(tapDismiss)];
}

- (void)tapDismiss {
    
    [self removeFromSuperview];
}

- (void)addTapGestureWithAction:(SEL)action{
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:action];
    tapGesture.delegate = self;
    self.disTap = tapGesture;
    [self addGestureRecognizer:tapGesture];
    
    tapGesture.numberOfTapsRequired = 1;
}

- (void)clickCellByType:(NSUInteger)type {
    
    if (self.clickCellByType) {
        self.clickCellByType(type);
    }
    
    if ([self.delegate respondsToSelector:@selector(selectedPayType:)]) {
        [self.delegate selectedPayType:type];
    }
    
    [self tapDismiss];
}

#pragma mark - gestureRecognizer delegate

//- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
//{
//    if (otherGestureRecognizer != self.disTap) {
//        return NO;
//    }
//    return YES;
//}

-(BOOL)gestureRecognizer:(UIGestureRecognizer*)gestureRecognizer shouldReceiveTouch:(UITouch*)touch {
    
    
    NSString *classStr = NSStringFromClass([gestureRecognizer.view class]);
    NSString *touchClassStr = NSStringFromClass([touch.view class]);
    if ([touchClassStr isEqual:@"PayMethodView"]) {
        return YES;
    }
    
    return NO;
}

@end
