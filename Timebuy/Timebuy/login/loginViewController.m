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
    [self updateButtonStyle:loginButton];
    
    isVerified = NO;
    
    //NSLog(@"系统版本：%@", [[UIDevice currentDevice] systemVersion]);
    
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
- (IBAction)getVerifyMsg:(JKCountDownButton *)sender
{
    
    if (![telephoneTextField.text isEqualToString:@""]) {
        if ([self isMobileNumber:telephoneTextField.text]) {
            [getVerifyMsgButton setBackgroundImage:[self imageWithColor:[UIColor lightGrayColor] size:getVerifyMsgButton.bounds.size] forState:UIControlStateDisabled];
            getVerifyMsgButton.enabled = NO;
            //button type要 设置成custom 否则会闪动
            [getVerifyMsgButton startWithSecond:60];
            NSString *title = [NSString stringWithFormat:@"剩余%d秒",60];
            [getVerifyMsgButton setTitle:title forState:UIControlStateDisabled];
            
            HUDSendSuccess = [[MBProgressHUD alloc] init];
            HUDSendSuccess.mode = MBProgressHUDModeText;
            HUDSendSuccess.delegate = self;
            HUDSendSuccess.labelText = @"验证码发送成功";
            [HUDSendSuccess show:YES];
            [HUDSendSuccess hide:YES afterDelay:1];
            
            [self.view addSubview:HUDSendSuccess];
            
            [getVerifyMsgButton didChange:^NSString *(JKCountDownButton *countDownButton,int second) {
                NSString *title = [NSString stringWithFormat:@"剩余%d秒",second];
                return title;
            }];
            [getVerifyMsgButton didFinished:^NSString *(JKCountDownButton *countDownButton, int second) {
                countDownButton.enabled = YES;
                return @"点击重新获取";
                
            }];
            
            [SMS_SDK getVerificationCodeBySMSWithPhone:telephoneTextField.text zone:@"86" result:^(SMS_SDKError *error) {
                //注意区号和手机号码前面都不要加“＋”号，有的开发者喜欢这样写，@“＋86”，这种是错误的写法
                if (!error) {
                    NSLog(@"获取验证码成功");
                    isVerified = YES;
                    
                } else {
                    NSLog(@"错误吗：%zi,错误描述：%@",error.errorCode,error.errorDescription);
                }
            }];
        } else {
            [self showErrorWithTitle:@"" WithMessage:@"请输入正确手机号"];
        }
    } else {
        [self showErrorWithTitle:@"" WithMessage:@"手机号不能为空"];
    }
    
}

//登录
- (IBAction)login:(id)sender
{
    NSLog(@"verify number = %@", verifyNumTextField.text);
    if (![telephoneTextField.text isEqualToString:@""]) {
        if (isVerified == YES && ![verifyNumTextField.text isEqualToString:@""]) {
            [SMS_SDK commitVerifyCode:verifyNumTextField.text result:^(enum SMS_ResponseState state) {
                //self.verfyCode.text这里传的是获取到的验证码，可以把获取到的验证码填写在文本框里面，然后获取到文本框里面的值传进参数里
                if (1==state) {
                    NSLog(@"验证成功");
                    [self verifyLogin];
                } else if (0==state){
                    NSLog(@"验证失败");
                    
                    MBProgressHUD *failHUD = [[MBProgressHUD alloc] init];
                    failHUD.mode = MBProgressHUDModeText;
                    failHUD.delegate = self;
                    failHUD.labelText = @"验证码错误，请重试";
                    [failHUD show:YES];
                    [failHUD hide:YES afterDelay:1];
                    
                    [self.view addSubview:failHUD];
                    
                }
            }];
        } else {
            [self showErrorWithTitle:@"" WithMessage:@"请先进行手机验证"];
        }
    } else {
        [self showErrorWithTitle:@"" WithMessage:@"请输入手机号"];
    }
}

//获取用户协议
- (IBAction)userAgreement:(id)sender
{
    
}

//微信登录
- (IBAction)loginByWeixin:(id)sender
{
    verifyPhoneViewController *verifyPhoneVC = [[verifyPhoneViewController alloc] init];
    
    [self presentViewController:verifyPhoneVC animated:YES completion:nil];
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

#pragma mark - TextField delegate
//点击return取消键盘
- (BOOL)textFieldShouldReturn:(UITextField *) textField {
    
    [textField resignFirstResponder];
    
    return YES;
}

// 点击编辑区以外的地方 取消键盘
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    if (![telephoneTextField isExclusiveTouch] || ![verifyNumTextField isExclusiveTouch]) {
        [telephoneTextField resignFirstResponder];
        [verifyNumTextField resignFirstResponder];
    }
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

- (void)verifyLogin {
    
    HUD = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    HUD.delegate = self;
    
    NSDate *curDate = [NSDate date];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy/MM/dd HH:mm:ss"];
    NSString *curDateTime = [formatter stringFromDate:curDate];
    
    //上传至服务器
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer  = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    [manager.requestSerializer setValue:@"d6089681f79c7627bbac829307e041a7" forHTTPHeaderField:@"x-timebuy-sid"];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [manager.requestSerializer setValue:@"application/json; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    //2.设置登录参数
    NSDictionary *dict = @{ @"phone":telephoneTextField.text,
                            @"source":@"1",
                            @"clientType":@"20",
                            @"clientVersion":[[UIDevice currentDevice] systemVersion],            //获得设备系统版本
                            @"did":[[[UIDevice currentDevice] identifierForVendor] UUIDString],   //获得设备标志
                            @"loginTime":curDateTime
                            };
    
    //3.请求
    NSString *url = [NSString stringWithFormat:@"%@%@",timebuyUrl,@"reg/phone"];
    [manager GET:url parameters:dict success: ^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"GET --> %@", responseObject); //自动返回主线程
        [HUD hide:YES];
        
        NSString *getStatus = [NSString stringWithFormat:@"%@",[responseObject objectForKey:@"success"]];
        NSString *getCode = [NSString stringWithFormat:@"%@",[responseObject objectForKey:@"code"]];
        if ([getStatus isEqualToString:@"1"] && [getCode isEqualToString:@"1000"]) {
            
            //[self dismissViewControllerAnimated:YES completion:nil];
            
            HUDinSuccess = [[MBProgressHUD alloc] initWithView:self.view];
            [self.view addSubview:HUDinSuccess];
            HUDinSuccess.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"37x-Checkmark.png"]];
            HUDinSuccess.mode = MBProgressHUDModeCustomView;
            HUDinSuccess.delegate = self;
            HUDinSuccess.labelText = @"登录成功";
            [HUDinSuccess show:YES];
            [HUDinSuccess hide:YES afterDelay:1];
            
            // 将得到的数据存在本地
            NSData *getData = [responseObject objectForKey:@"data"];
            
            
            [[NSNotificationCenter defaultCenter] postNotificationName:@"passState"
                                                                object:self
                                                              userInfo:@{@"state":@"0"}];
            //用户的信息存入本地
            [userConfiguration setStringValueForConfigurationKey:@"phone" withValue:telephoneTextField.text];
            [userConfiguration setStringValueForConfigurationKey:@"userId" withValue:[getData valueForKey:@"userId"]];
            
            //设置下载后的头像
            //[userConfiguration setDataValueForConfigurationKey:@"portrait" withValue:UIImagePNGRepresentation([UIImage imageNamed:@"portrait.png"])];
            
            /*
            //利用SDWenImage下载图片
            NSString *headIdStr = [userConfiguration getStringValueForConfigurationKey:@"headIcon"];
            NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://192.168.8.102:8080/timebuy/upload/%@",headIdStr]];
            SDWebImageManager *manager = [SDWebImageManager sharedManager];
            [manager downloadImageWithURL:url options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize) {
                // progression tracking code
            } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
                if (error) {
                    NSLog(@"头像下载出错error %@",error);
                } else {
                    if (image) {
                        NSLog(@"头像下载成功！");
                        //将图片数据存入NSUserDefaults中
                        [userConfiguration setDataValueForConfigurationKey:@"portrait" withValue:UIImagePNGRepresentation(image)];
                        
                    }
                }
            }];
            */
            
            
        } else if ([getStatus isEqualToString:@"0"] && [getCode isEqualToString:@"2003"]) {
            [self showErrorWithTitle:@"登录失败" WithMessage:@"用户名不存在"];
        } else if ([getStatus isEqualToString:@"0"] && [getCode isEqualToString:@"2004"]) {
            [self showErrorWithTitle:@"登录失败" WithMessage:@"密码错误"];
        } else {
            [self showErrorWithTitle:@"登录失败" WithMessage:@"系统错误"];
        }
        
    } failure: ^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@", error);
        [HUD hide:YES];
        [self showErrorWithTitle:@"登录失败" WithMessage:@"网络连接失败，请检查网络设置"];
    }];
}

#pragma mark - MBProgressHUDDelegate
- (void)hudWasHidden:(MBProgressHUD *)hud {
    // Remove HUD from screen when the HUD was hidded
    [hud removeFromSuperview];
    if ([hud isEqual:HUDinSuccess]) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    //[HUDinSuccess removeFromSuperview];
    
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

//判断手机号码是否正确
- (BOOL)isMobileNumber:(NSString *)mobileNum
{
    /**
     * 手机号码
     * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     * 联通：130,131,132,152,155,156,185,186
     * 电信：133,1349,153,180,189
     */
    NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    /**
     10         * 中国移动：China Mobile
     11         * 134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     12         */
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
    /**
     15         * 中国联通：China Unicom
     16         * 130,131,132,152,155,156,185,186
     17         */
    NSString * CU = @"^1(3[0-2]|5[256]|8[56]|7[0-9])\\d{8}$";
    /**
     20         * 中国电信：China Telecom
     21         * 133,1349,153,180,189
     22         */
    NSString * CT = @"^1((33|53|8[09])[0-9]|349)\\d{7}$";
    /**
     25         * 大陆地区固话及小灵通
     26         * 区号：010,020,021,022,023,024,025,027,028,029
     27         * 号码：七位或八位
     28         */
    // NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    
    if (([regextestmobile evaluateWithObject:mobileNum] == YES)
        || ([regextestcm evaluateWithObject:mobileNum] == YES)
        || ([regextestct evaluateWithObject:mobileNum] == YES)
        || ([regextestcu evaluateWithObject:mobileNum] == YES))
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

-(void)showErrorWithTitle:(NSString *)titile WithMessage:(NSString *)msg
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:titile message:msg delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alert show];
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
