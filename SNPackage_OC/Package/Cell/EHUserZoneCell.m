//
//  EHUserZoneCell.m
//  refactorEatHome
//
//  Created by Spectator on 16/8/10.
//  Copyright © 2016年 Spectator. All rights reserved.
//

#import "EHUserZoneCell.h"
#import "EHUserZoneCellModel.h"
#import "UIImageView+WebCache.h"
#import "EHPraiseButton.h"
#import "User.h"




@interface EHUserZoneCell ()

@property (nonatomic, strong) MASConstraint *allImgConVConstraint;

@property (nonatomic, strong) MASConstraint *oneConVConstraint;

@property (nonatomic, strong) MASConstraint *twoConVConstraint;

@property (nonatomic, strong) MASConstraint *threeConVConstraint;

@property (nonatomic, strong) MASConstraint *singleConVConstraint;

@property (nonatomic, strong) MASConstraint *imgOneHeightConstraint,*minImgOneHeight;

/**
 *  groupView
 */
@property (nonatomic, strong) UIView *allImageContentView,*oneContentView,*twoContentView,*threeContentView;

@property (nonatomic, strong) UIView *singleContentView;

/**
 *  内容视图
 */
@property (nonatomic, strong) UIImageView *iconView;

@property (nonatomic, strong) UILabel *nameLabel;

@property (nonatomic, strong) UILabel *introduceLabel;

@property (nonatomic, strong) UIImageView *imgSingle;

@property (nonatomic, strong) UIImageView *imgOne,*imgTwo,*imgThree,*imgFour,*imgFive,*imgSix,*imgSeven,*imgEight,*imgNine;

@property (nonatomic, strong) UILabel *timeLabel;

@property (nonatomic, strong) EHPraiseButton *praiseBtn;

@property (nonatomic, strong) UIButton *linkBtn;


@property (nonatomic, assign) CGFloat imgMargin;
@property (nonatomic, assign) CGFloat allImgWidth;
@property (nonatomic, assign) CGFloat imgWidth;


@end

@implementation EHUserZoneCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        [self setupView];
        [self layoutBaseTop];
    }
    
    return self;
}

- (void)setupView {
    
    UIImageView *iconView = [UIImageView new];
    self.iconView = iconView;
    
    UILabel *nameLabel = [UILabel new];
    self.nameLabel = nameLabel;
    nameLabel.font = UIFONT_Adapter_Size(12);
    
    UILabel *introduceLabel = [UILabel new];
    self.introduceLabel = introduceLabel;
    introduceLabel.font = UIFONT_Adapter_Size(12);
    introduceLabel.numberOfLines = 2;
    
    UIImageView *imageOne = [UIImageView new];
    self.imgOne = imageOne;
    
    UIImageView *imageTwo = [UIImageView new];
    self.imgTwo = imageTwo;
    
    UIImageView *imageThree = [UIImageView new];
    self.imgThree = imageThree;
    
    UIImageView *imageFour = [UIImageView new];
    self.imgFour = imageFour;
    
    UIImageView *imageFive = [UIImageView new];
    self.imgFive = imageFive;
    
    UIImageView *imageSix = [UIImageView new];
    self.imgSix = imageSix;
    
    UIImageView *imageSeven = [UIImageView new];
    self.imgSeven = imageSeven;
    
    UIImageView *imageEight = [UIImageView new];
    self.imgEight = imageEight;
    
    UIImageView *imageNine = [UIImageView new];
    self.imgNine = imageNine;
    
    UILabel *timeLabel = [UILabel new];
    self.timeLabel = timeLabel;
    timeLabel.font = UIFONT_Adapter_Size(9);
    
    EHPraiseButton *praiseBtn = [EHPraiseButton new];
    self.praiseBtn = praiseBtn;
    praiseBtn.img.image = [UIImage imageNamed:@"praise"];
    praiseBtn.num.text = @"0";
    praiseBtn.num.textColor = UICOLOR_BLACK;
    
//    [praiseBtn setImage:[UIImage imageNamed:@"praise"] forState:UIControlStateNormal];
//    [praiseBtn setTitle:@"0" forState:UIControlStateNormal];
//    [praiseBtn setTitleColor:UICOLOR_BLACK forState:UIControlStateNormal];
    
    UIButton *linkButton = [UIButton new];
    self.linkBtn = linkButton;
    [linkButton setTitleColor:UICOLOR_BLACK forState:UIControlStateNormal];
    linkButton.titleLabel.font = UIFONT_Adapter_Size(10);
    
    self.allImageContentView = [UIView new];
    self.allImageContentView.clipsToBounds = YES;
    
    self.oneContentView = [UIView new];
    self.oneContentView.clipsToBounds = YES;
    
    self.twoContentView = [UIView new];
    self.twoContentView.clipsToBounds = YES;
    
    self.threeContentView = [UIView new];
    self.threeContentView.clipsToBounds = YES;

    
    [self.oneContentView sn_addSubviews:@[self.imgOne,self.imgTwo,self.imgThree]];
    
    [self.twoContentView sn_addSubviews:@[self.imgFour,self.imgFive,self.imgSix]];
    
    [self.threeContentView sn_addSubviews:@[self.imgSeven,self.imgEight,self.imgNine]];
    
    [self.allImageContentView sn_addSubviews:@[self.oneContentView,self.twoContentView,self.threeContentView]];
    
    [self.contentView sn_addSubviews:@[self.iconView,self.nameLabel,self.introduceLabel,self.allImageContentView,self.timeLabel,self.linkBtn,self.praiseBtn]];
}

- (void)layoutBaseTop {
#define kIconViewWidth kScaleFrom_iPhone5_DesginWidth(30)
#define kNameLabelLeftPadding kScaleFrom_iPhone5_DesginWidth(5)
#define kIconViewLeftPadding kScaleFrom_iPhone5_DesginWidth(10)
#define kAllImgRightPadding kScaleFrom_iPhone5_DesginWidth(-40)
    [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).offset(kScaleFrom_iPhone5_DesginHeight(10));
        make.left.equalTo(self.contentView.mas_left).offset(kScaleFrom_iPhone5_DesginWidth(10));
        make.height.width.mas_equalTo(kScaleFrom_iPhone5_DesginWidth(30));
    }];
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.iconView.mas_top);
        make.left.equalTo(self.iconView.mas_right).offset(kScaleFrom_iPhone5_DesginWidth(5));
        make.width.lessThanOrEqualTo(@kScaleFrom_iPhone5_DesginWidth(60));
        make.width.greaterThanOrEqualTo(@kScaleFrom_iPhone5_DesginWidth(30));
    }];
    
    [self.introduceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nameLabel.mas_left);
        make.right.equalTo(self.contentView).offset(kScaleFrom_iPhone5_DesginWidth(-10));
        make.top.equalTo(self.nameLabel.mas_bottom).offset(kScaleFrom_iPhone5_DesginHeight(5));
    }];
#pragma mark -- Constraint1
    [self.allImageContentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nameLabel.mas_left);
        make.right.equalTo(self.contentView.mas_right).offset(kScaleFrom_iPhone5_DesginWidth(-40));
        make.top.equalTo(self.introduceLabel.mas_bottom).offset(kScaleFrom_iPhone5_DesginHeight(5));

        self.allImgConVConstraint = make.height.mas_equalTo(0).priority(UILayoutPriorityRequired);
        [self.allImgConVConstraint deactivate];
        
        make.bottom.equalTo(self.contentView.mas_bottom).offset(kScaleFrom_iPhone5_DesginHeight(-30));
    }];
    
    [self layoutIfNeeded];
    
    self.allImgWidth= kSCREEN_WIDTH-kIconViewLeftPadding-kIconViewWidth-kNameLabelLeftPadding+kAllImgRightPadding;
    self.imgMargin = self.allImgWidth*0.02;
    self.imgWidth = self.allImgWidth*0.32;
    
    
#pragma mark -- Constraint2
    [self.oneContentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self.allImageContentView);

        self.oneConVConstraint = make.height.equalTo(@0).priority(UILayoutPriorityRequired);
        [self.oneConVConstraint deactivate];
    }];
#pragma mark -- Constraint3
    [self.imgOne mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self.oneContentView);
        make.width.height.mas_equalTo(self.imgWidth);
        
       self.imgOneHeightConstraint = make.height.equalTo(@(self.allImgWidth)).priorityMedium();
        [self.imgOneHeightConstraint deactivate];
        
        make.bottom.equalTo(self.oneContentView.mas_bottom);
    }];

    [self.imgTwo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.oneContentView);
        make.left.equalTo(self.imgOne.mas_right).offset(self.imgMargin);
        make.width.height.mas_equalTo(self.imgWidth);
    }];
    
    [self.imgThree mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.top.equalTo(self.oneContentView);
        make.width.height.mas_equalTo(self.imgWidth);
        
    }];
    
#pragma mark -- Constraint5
    [self.twoContentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.allImageContentView);
        
        make.top.equalTo(self.oneContentView.mas_bottom).offset(self.imgMargin);

        self.twoConVConstraint = make.height.equalTo(@0).priority(UILayoutPriorityRequired);
        [self.twoConVConstraint deactivate];

    }];
    
    [self.imgFour mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self.twoContentView);
        make.bottom.equalTo(self.twoContentView.mas_bottom);
        make.width.height.mas_equalTo(self.imgWidth);
    }];
    
    [self.imgFive mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.twoContentView.mas_top);
        make.centerX.equalTo(self.twoContentView.mas_centerX);
        make.width.height.mas_equalTo(self.imgWidth);
    }];
    
    [self.imgSix mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.top.equalTo(self.twoContentView);
        make.width.height.mas_equalTo(self.imgWidth);
    }];
#pragma mark -- Constraint6
    [self.threeContentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.allImageContentView);
        
        make.top.equalTo(self.twoContentView.mas_bottom).offset(self.imgMargin);

        self.threeConVConstraint = make.height.equalTo(@0).priority(UILayoutPriorityRequired);
        [self.threeConVConstraint deactivate];
        
        make.bottom.equalTo(self.allImageContentView.mas_bottom);
    }];
    
    [self.imgSeven mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self.threeContentView);
        make.width.height.mas_equalTo(self.imgWidth);
        make.bottom.equalTo(self.threeContentView.mas_bottom);
    }];
    
    [self.imgEight mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.threeContentView.mas_top);
        make.centerX.equalTo(self.threeContentView.mas_centerX);
        make.width.height.mas_equalTo(self.imgWidth);
    }];
    
    [self.imgNine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.top.equalTo(self.threeContentView);
        make.width.height.mas_equalTo(self.imgWidth);
    }];
    
/*
    [self.singleContentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nameLabel.mas_left);
        make.right.equalTo(self.contentView.mas_right).offset(kScaleFrom_iPhone5_DesginWidth(-15));
        make.top.equalTo(self.introduceLabel.mas_bottom).offset(kScaleFrom_iPhone5_DesginHeight(5));
        
        self.singleConVConstraint = make.height.mas_equalTo(0).priority(UILayoutPriorityRequired);
        [self.singleConVConstraint deactivate];
    }];
    
    [self.imgSingle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self.singleContentView);
        make.bottom.equalTo(self.singleContentView).priorityLow();
        make.right.equalTo(self.singleContentView);
        make.height.equalTo(self.imgSingle.mas_width);
    }];
 */
    
//    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.width.mas_equalTo(kSCREEN_WIDTH);
//        make.bottom.equalTo(self.allImageContentView.mas_bottom).offset(kScaleFrom_iPhone5_DesginHeight(30));
//    }];
    
    [self.linkBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView.mas_right).offset(kScaleFrom_iPhone5_DesginWidth(-20));
        make.bottom.equalTo(self.contentView).offset(kScaleFrom_iPhone5_DesginWidth(-5));
        make.height.mas_equalTo(kScaleFrom_iPhone5_DesginHeight(20));
        make.width.lessThanOrEqualTo(@100);
    }];
    
    [self.praiseBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.bottom.equalTo(self.contentView).offset(kScaleFrom_iPhone5_DesginWidth(-5));
        make.height.mas_equalTo(kScaleFrom_iPhone5_DesginWidth(15));
        make.width.mas_equalTo(kScaleFrom_iPhone5_DesginWidth(30));
        make.right.equalTo(self.linkBtn.mas_left).offset(kScaleFrom_iPhone5_DesginWidth(-5));
    }];
    
    
    [self.praiseBtn.img mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.praiseBtn).insets(UIEdgeInsetsMake(0, 0, 0, kScaleFrom_iPhone5_DesginWidth(15)));
    }];
    
    [self.praiseBtn.num mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.praiseBtn).insets(UIEdgeInsetsMake(0, kScaleFrom_iPhone5_DesginWidth(15), 0, 0));
    }];
    self.praiseBtn.num.adjustsFontSizeToFitWidth = YES;
    
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.bottom.equalTo(self.contentView).offset(kScaleFrom_iPhone5_DesginWidth(-10));
        make.left.equalTo(self.contentView.mas_left).offset(kScaleFrom_iPhone5_DesginWidth(10));
        make.centerY.equalTo(@[self.linkBtn,self.praiseBtn]);
    }];
    
    
    
}


- (void)setModel:(EHUserZoneCellModel *)model {
    _model = model;
    
    [self layoutIfNeeded];
    
    [self.iconView sd_setImageWithURL:[NSURL URLWithString:[User shareUser].Img] placeholderImage:[UIImage imageNamed:@"UserFace"]];
    self.nameLabel.text = model.Name;
    self.introduceLabel.text = model.Introduce;
    
//    NSArray *modelImgArr = @[model.img1];
//    NSArray *imgUIArr = @[self.imgOne,self.imgTwo,self.imgThree,self.imgFour,self.imgFive,self.imgSix,self.imgSeven,self.imgEight,self.imgNine];
//    
//    NSMutableArray *noNilImgMutArr = [NSMutableArray array];
//    for (NSString *imgUrlStr in modelImgArr) {
//        
//        if (![imgUrlStr isEqualToString:@""]) {
//            [noNilImgMutArr addObject:imgUrlStr];
//        }
//    }
//    
//    NSInteger imgCount = noNilImgMutArr.count;
//    [self setImgLayoutWithCount:imgCount];
//    
//    for (NSInteger i = 0; i < imgCount; i++) {
//        UIImageView *currentImgV = imgUIArr[i];
//        NSString *finalImgUrlStr = [NSString stringWithFormat:@"%@?imageView2/0/w/%f",noNilImgMutArr[i],currentImgV.bounds.size.width*kSCREEN_SCALE];
//        SNLog(@"%@",finalImgUrlStr);
//        [currentImgV sd_setImageWithURL:[NSURL URLWithString:finalImgUrlStr]];
//    }
    
    [self removeEmptyAndShowImg:model];
    
    self.timeLabel.text = model.CreateTime;
    [self.linkBtn setTitle:model.MainTitle forState:UIControlStateNormal];
//    [self.praiseBtn setTitle:model.PraiseNum forState:UIControlStateNormal];
    self.praiseBtn.num.text = [NSString stringWithFormat:@"(%@)",model.PraiseNum];
}


- (void)removeEmptyAndShowImg:(EHUserZoneCellModel *)model {
    
    NSArray *modelImgArr = @[model.img1,model.img2,model.img3,model.img4,model.img5,model.img6,model.img7,model.img8,model.img9];
    NSArray *imgUIArr = @[self.imgOne,self.imgTwo,self.imgThree,self.imgFour,self.imgFive,self.imgSix,self.imgSeven,self.imgEight,self.imgNine];
    
    NSMutableArray *noNilImgMutArr = [NSMutableArray array];
    for (NSString *imgUrlStr in modelImgArr) {
//        ![imgUrlStr isEqualToString:@""] ||
//        if ( [imgUrlStr hasSuffix:@"jpg"] || [imgUrlStr hasSuffix:@"png"]) {
        if (![imgUrlStr isEqualToString:@""]) {
      
            [noNilImgMutArr addObject:imgUrlStr];
        }
    }
    
    NSInteger imgCount = noNilImgMutArr.count;
    [self setImgLayoutWithCount:imgCount];
    
    for (NSInteger i = 0; i < imgCount; i++) {
        UIImageView *currentImgV = imgUIArr[i];
        NSString *finalImgUrlStr = [NSString stringWithFormat:kImageStrSplit,noNilImgMutArr[i],currentImgV.bounds.size.width*kSCREEN_SCALE];
//        SNLog(@"%@",finalImgUrlStr);
        [currentImgV sd_setImageWithURL:[NSURL URLWithString:finalImgUrlStr]];
    }
}

- (void)setImgLayoutWithCount:(NSInteger )count {
    [self.oneConVConstraint deactivate];
    [self.allImgConVConstraint deactivate];
    [self.twoConVConstraint deactivate];
    [self.threeConVConstraint deactivate];
    [self.imgOneHeightConstraint deactivate];
    
    switch (count) {
        case 0:
            [self.allImgConVConstraint activate];
            break;
        case 1:
//            [self.imgOneHeightConstraint activate];
            [self.twoConVConstraint activate];
            [self.threeConVConstraint activate];
            break;
        case 2:
        case 3:
            [self.twoConVConstraint activate];
            [self.threeConVConstraint activate];
            break;
        case 4:
        case 5:
        case 6:
            [self.threeConVConstraint activate];
            break;
        default:
            break;
    }
}


@end
