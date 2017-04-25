//
//  TapImageView.m
//  eathome
//
//  Created by Spectator on 16/5/27.
//  Copyright © 2016年 test. All rights reserved.
//

#import "UITapImageView.h"
#import "UIImageView+WebCache.h"

@interface  UITapImageView ()

@property (nonatomic, copy) void(^tapAction)(id);

@end

@implementation UITapImageView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (instancetype)init
{
    return [self initWithFrame:CGRectZero];
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

- (void)setImageWithURL:(NSURL *)imgUrl placeholderImage:(NSString *)imgName tapAction:(void (^)(id))tapAction {
    
    [self sd_setImageWithURL:imgUrl placeholderImage:[UIImage imageNamed:imgName]];
    
    [self addTapAction:tapAction];
}

@end
