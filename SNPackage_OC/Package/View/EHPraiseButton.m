//
//  EHPraiseButton.m
//  refactorEatHome
//
//  Created by Spectator on 16/8/11.
//  Copyright © 2016年 Spectator. All rights reserved.
//

#import "EHPraiseButton.h"

@implementation EHPraiseButton

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        UIImageView *img = [[UIImageView alloc] initWithFrame:frame];
        [self addSubview:img];
        self.img = img;
        
        UILabel *num = [[UILabel alloc] initWithFrame:frame];
        [self addSubview:num];
        self.num = num;
        
    }
    
    return self;
}

@end
