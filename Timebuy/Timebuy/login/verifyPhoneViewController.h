//
//  verifyPhoneViewController.h
//  Timebuy
//
//  Created by CraftDream on 15/10/1.
//  Copyright (c) 2015年 com.CraftDream. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JKCountDownButton.h"

@interface verifyPhoneViewController : UIViewController

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

- (IBAction)cancel:(id)sender;

- (IBAction)selectCountry:(id)sender;
- (IBAction)getVerifyMsg:(id)sender;
//- (IBAction)getVerifyVoice:(id)sender;
- (IBAction)login:(id)sender;
- (IBAction)userAgreement:(id)sender;

@end
