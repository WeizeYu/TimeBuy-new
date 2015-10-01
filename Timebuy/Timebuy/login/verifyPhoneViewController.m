//
//  verifyPhoneViewController.m
//  Timebuy
//
//  Created by CraftDream on 15/10/1.
//  Copyright (c) 2015年 com.CraftDream. All rights reserved.
//

#import "verifyPhoneViewController.h"

@interface verifyPhoneViewController ()

@end

@implementation verifyPhoneViewController

@synthesize countryView,countryButton;
@synthesize telephoneView,telephoneTextField;
@synthesize getVerifyMsgButton;
@synthesize verifyNumView,verifyNumTextField;
@synthesize loginButton;
@synthesize userAgreementButton;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self updateViewStyle:countryView];
    [self updateViewStyle:telephoneView];
    [self updateViewStyle:verifyNumView];
    
    [self updateButtonStyle:getVerifyMsgButton];
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
    [getVerifyMsgButton setBackgroundImage:[self imageWithColor:[UIColor lightGrayColor] size:getVerifyMsgButton.bounds.size] forState:UIControlStateDisabled];
    getVerifyMsgButton.enabled = NO;
    //button type要 设置成custom 否则会闪动
    [getVerifyMsgButton startWithSecond:60];
    NSString *title = [NSString stringWithFormat:@"剩余%d秒",60];
    [getVerifyMsgButton setTitle:title forState:UIControlStateDisabled];
    
    [getVerifyMsgButton didChange:^NSString *(JKCountDownButton *countDownButton,int second) {
        NSString *title = [NSString stringWithFormat:@"剩余%d秒",second];
        return title;
    }];
    [getVerifyMsgButton didFinished:^NSString *(JKCountDownButton *countDownButton, int second) {
        countDownButton.enabled = YES;
        return @"点击重新获取";
        
    }];
}

//登录
- (IBAction)login:(id)sender
{
    
}

//获取用户协议
- (IBAction)userAgreement:(id)sender
{
    
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

- (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size {
    
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    
    UIGraphicsBeginImageContext(rect.size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
    
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
