//
//  ShoppingCartCell.m
//  refactorEatHome
//
//  Created by Spectator on 16/6/14.
//  Copyright © 2016年 Spectator. All rights reserved.
//


#define kDeleteButtonWidth      60.0f
#define kCriticalTranslationX   30
#define kShouldSlideX -2

#import "ShoppingCartCell.h"
#import "ShopCartSelectButton.h"
#import "UIImageView+WebCache.h"
#import "EHShopCartCellViewModel.h"

@interface ShoppingCartCell ()
{
    UIButton* _tagButton;
    UIButton* _deleteButton;
    
    
    UIPanGestureRecognizer *_pan;
    UITapGestureRecognizer *_tap;
    
    BOOL _shouldSlide;
}
@property (nonatomic, assign) BOOL isSlided;

@property (nonatomic, strong) UIImageView *foodImageView;

@property (nonatomic, strong) UILabel *foodNameLabel;

@property (nonatomic, strong) UILabel *foodDescLabel;

@property (nonatomic, strong) UILabel *foodPriceLabel;

@property (nonatomic, strong) UITextField *foodNumberLabel;

@property (nonatomic, strong) UIButton *addNumberBtn;

@property (nonatomic, strong) UIButton *reduceNumberBtn;

@property (nonatomic, strong) EHShopCartCellViewModel *viewModel;
@end


@implementation ShoppingCartCell

- (EHShopCartCellViewModel *)viewModel {
    
    if (!_viewModel) {
        _viewModel = [[EHShopCartCellViewModel alloc] init];
    }
    return _viewModel;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        [self setupView];
//        [self setupGes];
        [self reponseBlock];
    }
    
    return self;
}

- (void)reponseBlock {
    
    WEAKLY(wSelf, self);
    self.viewModel.shopCartComplete = ^(NSUInteger code, BOOL isDel) {
        STRONGLY(sSelf, wSelf);
        SNLog(@"操作结果 %lu",(unsigned long)code);
        if (code == 0) {
            
            if (isDel) {
                if (sSelf.delCurrentCell) {
                    sSelf.delCurrentCell(sSelf);
                }
            } else {

                [sSelf reloadCount];
            }
       
        }
    };
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
}

- (void)setupView {
    
    self.contentView.backgroundColor = UICOLOR_WHITE;
    
    self.selectFlagBtn = ({
        
        ShopCartSelectButton *flagBtn = [ShopCartSelectButton new];
        
        flagBtn
        .button_image([UIImage imageNamed:@"trade_choose_default"],UIControlStateNormal)
        .button_image([UIImage imageNamed:@"trade_choose_OK"],UIControlStateSelected);
        
        [self.contentView addSubview:flagBtn];

        flagBtn;
    });
    
    self.foodImageView = ({
        
        UIImageView *foodImage = [UIImageView new];
        
        [self.contentView addSubview:foodImage];

        foodImage;
    });
    
    self.foodNameLabel = ({
        
        UILabel *foodName = [UILabel new];
        foodName.font = UIFONT_UnAdapter_Size(14);

        [self.contentView addSubview:foodName];
        foodName.lab_lineBreakMode(NSLineBreakByTruncatingTail);

        foodName;
    });
    
    
    self.foodDescLabel = ({
        
        UILabel *foodDesc = [UILabel new];
        
        foodDesc.lab_font(UIFONT_UnAdapter_Size(10))
        .lab_textColor(UICOLOR_RecomCellTimeTextColor)
        .lab_numberOfLines(0);
        
        [self.contentView addSubview:foodDesc];

        foodDesc;
    });
    
    self.foodPriceLabel = ({
       
        UILabel *foodPrice = [UILabel new];
        
        foodPrice.lab_font(UIFONT_UnAdapter_Size(12))
        .lab_textColor(UICOLOR_RecomCellRepTextColor);
        
        [self.contentView addSubview:foodPrice];

        foodPrice;

    });
    
    
    self.reduceNumberBtn = ({
        
        UIButton *reduceBtn = [[UIButton alloc] init];
        [reduceBtn setImage:[UIImage imageNamed:@"js_jian"] forState:UIControlStateNormal];
        [self.contentView addSubview:reduceBtn];

        [reduceBtn addTarget:self action:@selector(reduce) forControlEvents:UIControlEventTouchUpInside];
        
        reduceBtn;
    });
    
    self.foodNumberLabel = ({
        
        UITextField *foodNumber = [UITextField new];
        
        foodNumber.font = UIFONT_UnAdapter_Size(12);
        foodNumber.borderStyle = UITextBorderStyleRoundedRect;
        foodNumber.textAlignment = NSTextAlignmentCenter;
        
        [self.contentView addSubview:foodNumber];

        foodNumber;

    });
    
    self.addNumberBtn = ({
        
        UIButton *addBtn = [[UIButton alloc] init];
        [addBtn setImage:[UIImage imageNamed:@"js_jia"] forState:UIControlStateNormal];
        [self.contentView addSubview:addBtn];

        [addBtn addTarget:self action:@selector(add) forControlEvents:UIControlEventTouchUpInside];
        addBtn;
    });
    
    
    [self.selectFlagBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(10);
        make.centerY.equalTo(self.contentView.mas_centerY);
        make.height.width.mas_equalTo(kScaleFrom_iPhone5_DesginWidth(30));
    }];
    
    [self.foodImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.selectFlagBtn.mas_right).offset(10);
        make.top.equalTo(self.contentView.mas_top).offset(5);
        make.height.width.mas_equalTo(kScaleFrom_iPhone5_DesginWidth(80));
//        make.bottom.equalTo(self.contentView.mas_bottom).offset(-5);
    }];
    
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.foodImageView.mas_bottom).offset(5);
            make.width.mas_equalTo(kSCREEN_WIDTH);
     }];

    
    [self.foodNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.foodImageView.mas_right).offset(10);
        make.top.equalTo(@10);
        make.height.mas_equalTo(kScaleFrom_iPhone5_DesginWidth(20));
        make.right.equalTo(@-10);
    }];
    
    [self.foodDescLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.foodImageView.mas_right).offset(20)
        ;
        make.top.equalTo(self.foodNameLabel.mas_bottom).offset(3);
        make.right.equalTo(self.contentView.mas_right).offset(-10);
    }];
    
    [self.foodPriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.foodImageView.mas_right).offset(10);
        make.bottom.equalTo(@-5);
    }];
    
    [self.addNumberBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(@-5);
        make.height.width.mas_equalTo(kScaleFrom_iPhone5_DesginWidth(25));
        make.bottom.equalTo(@-5);
    }];
    
    [self.foodNumberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.addNumberBtn.mas_left).offset(-5);
        make.bottom.equalTo(@-5);
        make.height.equalTo(self.addNumberBtn.mas_height);
        make.width.mas_equalTo(kScaleFrom_iPhone5_DesginWidth(35));
    }];
    
    [self.reduceNumberBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.foodDescLabel.mas_bottom).offset(3);
        make.right.equalTo(self.foodNumberLabel.mas_left).offset(-5);
        make.height.width.mas_equalTo(kScaleFrom_iPhone5_DesginWidth(25));
        make.left.equalTo(self.foodPriceLabel.mas_right);
        make.bottom.equalTo(@-5);
    }];
    
    
    UIButton *largeSubButton = [UIButton new];
    [self.contentView addSubview:largeSubButton];
    [[largeSubButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        [self reduce];
    }];
    
    [largeSubButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.foodPriceLabel.mas_right);
        make.right.equalTo(self.foodNumberLabel.mas_left);
        make.bottom.equalTo(self.contentView.mas_bottom);
        make.top.equalTo(self.foodDescLabel.mas_bottom);
    }];
    
    UIButton *largeAddButton = [UIButton new];
    [self.contentView addSubview:largeAddButton];
    [[largeAddButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        [self add];
    }];
    
    [largeAddButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.foodNumberLabel.mas_right);
        make.right.equalTo(self.contentView.mas_right);
        make.bottom.equalTo(self.contentView.mas_bottom);
        make.top.equalTo(self.foodDescLabel.mas_bottom);
    }];
}

- (void)setupGes {
    _pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(pan:)];
    [self.contentView addGestureRecognizer:_pan];
    _pan.delegate = self;
    _pan.delaysTouchesBegan = YES;
    
    _tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap:)];
    _tap.delegate = self;
    _tap.enabled = YES;
//    [self.contentView addGestureRecognizer:_tap];
}
#pragma mark -- button method
- (void)add {
    
    self.model.unitCount++;
        [self.viewModel addFoodCount:self.model];
        [self reloadCount];

}

- (void)reduce {
    
    self.model.unitCount--;
  
    if (self.model.unitCount < 1) {
        self.model.unitCount = 1;
    } else {
        [self.viewModel reduceFoodCount:self.model];
        [self reloadCount];
    }

}

- (void)del {
    
    [self.viewModel deleteFood:self.model];

}


#pragma mark -- get data
- (void)setModel:(ShopCartCellModel *)model {
    
    _model = model;
    
    self.foodNameLabel.text = model.Name;
    self.foodDescLabel.text = model.Mark;
    NSString *firstText = [NSString stringWithFormat:@"￥%.2f",model.Price];
    self.foodPriceLabel
    .lab_symbolSplitBeforeAndAfterTheTextColor(@"/",firstText, UICOLOR_ORANGE_NAVI,model.Unit,UICOLOR_BLACK);
    self.foodNumberLabel.text = [NSString stringWithFormat:@"%ld",model.unitCount];
    
    [self layoutIfNeeded];
    NSString *imgStr = [NSString stringWithFormat:kImageStrSplit,model.Img,self.foodImageView.bounds.size.width*kSCREEN_SCALE];
    
    [self.foodImageView sd_setImageWithURL:[NSURL URLWithString:imgStr] placeholderImage:[UIImage imageNamed:@"CartNone"]];
}

- (void)reloadCount {
    
    if (self.model.unitCount < 1) {
        self.model.unitCount = 1;
    } else {
        self.foodNumberLabel.text = [NSString stringWithFormat:@"%ld",self.model.unitCount];
    }
    
    if (self.refreshTotalPrice) {
        self.refreshTotalPrice();
    }
    
}

#pragma mark -  用一个属性来控制点击手势是否可用。
/*
 _shouldSlide 做到了 只有当cell向左滑动开才会支持点击手势
 */

- (void)pan:(UIPanGestureRecognizer*)ges{
    CGPoint point = [ges translationInView:ges.view];
    
    if (self.contentView.left <= -2) {
        _shouldSlide = YES;
    }
    if (fabs(point.y) < 1.0) {
        if (_shouldSlide) {
            [self slideWithTranslation:point.x];
        } else if (fabs(point.x) >= 1.0) {
            [self slideWithTranslation:point.x];
        }
    }
    //在拖拽停止时，根据拖拽距离来进行判断，是展开还是收缩
    if (ges.state == UIGestureRecognizerStateEnded) {
        CGFloat x = 0;
        if (self.contentView.left < -kCriticalTranslationX && !self.isSlided) {
            x = -(kDeleteButtonWidth);
        }
        [self cellSlideAnimationWithX:x];
        //拖拽停止时，复位 不相应点击手势
        _shouldSlide = NO;
    }
    
    [ges setTranslation:CGPointZero inView:ges.view];
}

- (void)cellSlideAnimationWithX:(CGFloat)x
{
    [UIView animateWithDuration:0.4 delay:0 usingSpringWithDamping:0.6 initialSpringVelocity:2 options:UIViewAnimationOptionLayoutSubviews animations:^{
        self.contentView.left = x;
    } completion:^(BOOL finished) {
        self.isSlided = (x != 0);
    }];
}

//连续调用
- (void)slideWithTranslation:(CGFloat)value
{//左划到头，或者右划到头
    if (self.contentView.left < -(kDeleteButtonWidth) * 1.1 || self.contentView.left > 30) {
        value = 0;
    }
    self.contentView.left += value;
}

- (void)tap:(UIPanGestureRecognizer*)ges {
 
    NSLog(@"%s--%d",__func__,__LINE__);
}
#pragma mark - gestureRecognizer delegate

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    if (self.contentView.left <= kShouldSlideX && otherGestureRecognizer != _pan && otherGestureRecognizer != _tap) {
        return NO;
    }
    return YES;
}

@end
