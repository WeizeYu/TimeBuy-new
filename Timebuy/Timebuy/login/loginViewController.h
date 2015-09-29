//
//  loginViewController.h
//  Timebuy
//
//  Created by Mr.OJ on 15/9/29.
//  Copyright (c) 2015年 com.CraftDream. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface loginViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIView *countryView;
@property (strong, nonatomic) IBOutlet UIButton *countryButton;
@property (strong, nonatomic) IBOutlet UIView *telephoneView;
@property (strong, nonatomic) IBOutlet UITextField *telephoneTextField;
@property (strong, nonatomic) IBOutlet UIButton *getVerifyMsgButton;
@property (strong, nonatomic) IBOutlet UIButton *getVerifyVoiceButton;
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
- (IBAction)getVerifyMsg:(id)sender;
- (IBAction)getVerifyVoice:(id)sender;
- (IBAction)login:(id)sender;
- (IBAction)userAgreement:(id)sender;

- (IBAction)loginByWeixin:(id)sender;
- (IBAction)loginByWeibo:(id)sender;
- (IBAction)loginByQQ:(id)sender;
- (IBAction)loginByAlipay:(id)sender;

@end
