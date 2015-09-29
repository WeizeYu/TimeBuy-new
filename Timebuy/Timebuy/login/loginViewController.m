//
//  loginViewController.m
//  Timebuy
//
//  Created by Mr.OJ on 15/9/29.
//  Copyright (c) 2015年 com.CraftDream. All rights reserved.
//

#import "loginViewController.h"

@interface loginViewController ()

@end

@implementation loginViewController

@synthesize countryView,countryButton;
@synthesize telephoneView,telephoneTextField;
@synthesize getVerifyMsgButton;
@synthesize getVerifyVoiceButton;
@synthesize verifyNumView,verifyNumTextField;
@synthesize loginButton;
@synthesize userAgreementButton;

@synthesize weixinLayoutConstraint,weiboLayoutConstraint,QQLayoutConstraint,alipayLayoutConstraint,buttonWidth;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self updateViewStyle:countryView];
    [self updateViewStyle:telephoneView];
    [self updateViewStyle:verifyNumView];
    
    [self updateButtonStyle:getVerifyMsgButton];
    [self updateButtonStyle:getVerifyVoiceButton];
    [self updateButtonStyle:loginButton];
    
}

- (IBAction)cancel:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - complete button function
//选择国家
- (IBAction)selectCountry:(id)sender
{
    
}

//获取短信验证码
- (IBAction)getVerifyMsg:(id)sender
{
    
}

//获取语音验证码
- (IBAction)getVerifyVoice:(id)sender
{
    
}

//登录
- (IBAction)login:(id)sender
{
    
}

//获取用户协议
- (IBAction)userAgreement:(id)sender
{
    
}

//微信登录
- (IBAction)loginByWeixin:(id)sender
{
    
}

//微博登录
- (IBAction)loginByWeibo:(id)sender
{
    
}

//QQ登录
- (IBAction)loginByQQ:(id)sender
{
    
}

//支付宝登录
- (IBAction)loginByAlipay:(id)sender
{
    
}

#pragma mark -  set constraints
- (void)updateViewConstraints
{
    [self autoArrangeButtonWithConstraints:@[self.weixinLayoutConstraint,
                                             self.weiboLayoutConstraint,
                                             self.QQLayoutConstraint,
                                             self.alipayLayoutConstraint] width:self.buttonWidth.constant];
    
    [super updateViewConstraints];
}

- (void)autoArrangeButtonWithConstraints:(NSArray *)constraintArray width:(CGFloat)width
{
    CGFloat step = (self.view.frame.size.width - (width *constraintArray.count)) / (constraintArray.count + 1);
    for (int i = 0; i < constraintArray.count; i++) {
        NSLayoutConstraint *constraint = constraintArray[i];
        constraint.constant = step * (i + 1) + width * i;
    }
}

- (void)updateViewStyle:(UIView *)view
{
    view.backgroundColor = [UIColor clearColor];
    view.layer.masksToBounds = YES;
    view.layer.borderWidth = 1.0f;
    view.layer.borderColor = [UIColor whiteColor].CGColor;
    view.layer.cornerRadius = 45.0f / 2;
}

- (void)updateButtonStyle:(UIButton *)button
{
    button.layer.masksToBounds = YES;
    button.layer.cornerRadius = 45.0f / 2;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
