//
//  ZSDSetPasswordView.m
//  demo
//
//  Created by shaw on 15/4/11.
//  Copyright (c) 2015年 shaw. All rights reserved.
//

#import "ZSDSetPasswordView.h"
#import "NSObject+SizeByScreen.h"

#define kLineCount 5
#define kDotCount 6
#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface ZSDSetPasswordView ()<UITextFieldDelegate>
{
    NSMutableArray *passwordIndicatorArrary;
}

@end

@implementation ZSDSetPasswordView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self setUp];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    
    if (self)
    {    
        [self setUp];
    }
    
    return self;
}

- (void)setUp{
    
    self.layer.cornerRadius = 10.f;
    [[NSNotificationCenter defaultCenter] addObserverForName:UITextFieldTextDidChangeNotification object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *note){
        
        if ([note.object isEqual:_passwordTextField])
        {
            [self setDotWithCount:_passwordTextField.text.length];
            
            if (_passwordTextField.text.length == 6)
            {
                if ([_delegate respondsToSelector:@selector(passwordView:inputPassword:)])
                {
                    [_delegate passwordView:self inputPassword:_passwordTextField.text];
                }
            }
        }
    }];
    
    [self initView];
}
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextFieldTextDidChangeNotification object:nil];
}

-(void)fieldBecomeFirstResponder
{
    [_passwordTextField becomeFirstResponder];
}

- (void)initView
{
    self.backgroundColor = [UIColor whiteColor];
    
    passwordIndicatorArrary = [[NSMutableArray alloc] init];
    
    _passwordTextField = [UITextField new];
    _passwordTextField.hidden = YES;
    _passwordTextField.delegate = self;
    _passwordTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    _passwordTextField.keyboardType = UIKeyboardTypeNumberPad;
    [self addSubview:_passwordTextField];
    
    [_passwordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.right.equalTo(self);
        make.top.equalTo(self);
        make.bottom.equalTo(self);
    }];
    
    for (int i = 0; i < kLineCount; i++)
    {
        
        UIImageView *lineImageView = [UIImageView new];
        lineImageView.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:lineImageView];
        [lineImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_right).multipliedBy((i+1)/(CGFloat)kDotCount);
            make.height.equalTo(self);
            make.width.equalTo(@1);
            make.top.equalTo(self);


        }];
    }
    
    for (int i = 0; i < kDotCount; i++)
    {
        
        UIImageView *dotImageView = [UIImageView new];
        dotImageView.backgroundColor = [UIColor blackColor];
        dotImageView.layer.cornerRadius = sizeScreenByFloat(12) / 2.0f;
        dotImageView.clipsToBounds = YES;
        dotImageView.hidden = YES;
        [self addSubview:dotImageView];
        
        [dotImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(sizeScreenByNumber(12));
            make.height.equalTo(dotImageView.mas_width);
            make.centerY.equalTo(self);
            make.centerX.equalTo(self).multipliedBy((1+2*i)/6.f);
            
            
        }];
        
        [passwordIndicatorArrary addObject:dotImageView];
    }
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if([string isEqualToString:@"\n"])
    {
        //按回车关闭键盘
        [textField resignFirstResponder];
        return NO;
    }
    else if(string.length == 0)
    {
        //判断是不是删除键
        return YES;
    }
    else if(textField.text.length >= kDotCount)
    {
        //输入的字符个数大于6，则无法继续输入，返回NO表示禁止输入
        return NO;
    }
    else
    {
        return YES;
    }
}

- (void)setDotWithCount:(NSInteger)count
{
    for (UIImageView *dotImageView in passwordIndicatorArrary)
    {
        dotImageView.hidden = YES;
    }
    
    for (int i = 0; i< count; i++)
    {
        ((UIImageView*)[passwordIndicatorArrary objectAtIndex:i]).hidden = NO;
    }
}

- (void)clearUpPassword
{
    _passwordTextField.text = @"";
    [self setDotWithCount:_passwordTextField.text.length];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [_passwordTextField becomeFirstResponder];
}



@end
