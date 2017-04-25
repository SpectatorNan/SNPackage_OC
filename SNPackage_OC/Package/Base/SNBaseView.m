//
//  SNBaseView.m
//  refactorEatHome
//
//  Created by Spectator on 16/6/20.
//  Copyright © 2016年 Spectator. All rights reserved.
//

#import "SNBaseView.h"

@interface SNBaseView ()

@property (nonatomic, copy) void(^tapAction)(id);

@end

@implementation SNBaseView

- (instancetype)init
{
    self = [super init];
    if (self) {
        
//        [self eh_setupViews];
//        [self eh_layout];
    }
    return self;
}

- (instancetype)initWithModel:(id)viewModel {
    
    self = [super init];
    
    if (self) {
        
        [self eh_setupViews];
        [self eh_layout];
    }
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {

    self = [super initWithFrame:frame];
    
    if (self) {
        
        [self eh_setupViews];
        [self eh_layout];
    }
    
    return self;
}


- (void)eh_setupViews {
    
}

- (void)eh_layout {
    
}

- (void)addTapAction:(void (^)(id obj))tapAction {
    
    self.tapAction = tapAction;
    
    if (![self gestureRecognizers]) {
        self.userInteractionEnabled = YES;
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
        [self addGestureRecognizer:tap];
    }
    
}


- (void)tap {
    
    if (self.tapAction) {
        self.tapAction(self);
    }
}

@end
