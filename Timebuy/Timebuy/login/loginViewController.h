//
//  loginViewController.h
//  Timebuy
//
//  Created by Mr.OJ on 15/9/29.
//  Copyright (c) 2015年 com.CraftDream. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "verifyPhoneViewController.h"

#import "JKCountDownButton.h"
#import "MBProgressHUD.h"
#import "AFNetworking.h"
#import <SMS_SDK/SMS_SDK.h>

@interface loginViewController : UIViewController < UITextFieldDelegate,MBProgressHUDDelegate>
{
    BOOL isVerified;
    
    MBProgressHUD *HUD;
    MBProgressHUD *HUDinSuccess;
    MBProgressHUD *HUDSendSuccess;
}

@property (strong, nonatomic) IBOutlet UIView *countryView;
@property (strong, nonatomic) IBOutlet UIButton *countryButton;
@property (strong, nonatomic) IBOutlet UIView *telephoneView;
@property (strong, nonatomic) IBOutlet UITextField *telephoneTextField;
@property (weak, nonatomic) IBOutlet JKCountDownButton *getVerifyMsgButton;
//@property (weak, nonatomic) IBOutlet JKCountDownButton *getVerifyVoiceButton;
@property (strong, nonatomic) IBOutlet UIView *verifyNumView;
@property (strong, nonatomic) IBOutlet UITextField *verifyNumTextField;
@property (strong, nonatomic) IBOutlet UIButton *loginButton;
@property (strong, nonatomic) IBOutlet UIButton *userAgreementButton;

@property (nonatomic, weak) IBOutlet NSLayoutConstraint *weixinLayoutConstraint;
@property (nonatomic, weak) IBOutlet NSLayoutConstraint *weiboLayoutConstraint;
@property (nonatomic, weak) IBOutlet NSLayoutConstraint *QQLayoutConstraint;
@property (nonatomic, weak) IBOutlet NSLayoutConstraint *alipayLayoutConstraint;
@property (nonatomic, weak) IBOutlet NSLayoutConstraint *buttonWidth;

- (IBAction)cancel:(id)sender;

- (IBAction)selectCountry:(id)sender;
- (IBAction)login:(id)sender;
- (IBAction)userAgreement:(id)sender;

- (IBAction)getVerifyMsg:(JKCountDownButton *)sender;
//- (IBAction)getVerifyVoice:(JKCountDownButton *)sender;

- (IBAction)loginByWeixin:(id)sender;
- (IBAction)loginByWeibo:(id)sender;
- (IBAction)loginByQQ:(id)sender;
- (IBAction)loginByAlipay:(id)sender;

@end
