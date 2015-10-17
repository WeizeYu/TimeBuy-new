//
//  priceViewController.m
//  TimeBuy
//
//  Created by Mr.OJ on 15/9/2.
//  Copyright (c) 2015年 Mr.OJ. All rights reserved.
//

#import "priceViewController.h"

@interface priceViewController ()

@end

@implementation priceViewController

@synthesize priceTextField;
@synthesize price;
@synthesize confirmButton;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationController.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,[UIFont systemFontOfSize:20.0f], NSFontAttributeName, nil];
    self.navigationItem.title = @"修改金额";
    
    //priceTextField.text = price;
    priceTextField.delegate = self;
    priceTextField.text = price;
    
    [confirmButton setTitleColor:[UIColor colorWithWhite:10.0f alpha:0.3f] forState:UIControlStateDisabled];
    
    if (![price isEqualToString:@"请输入价格"] && ![price isEqualToString:@""] && price != nil) {
        confirmButton.enabled = YES;
    }
}

- (IBAction)cancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)save:(id)sender {
    
    //[self checkNum:priceTextField.text];
    if ([priceTextField.text isEqualToString:@"0.0"]) {
        [self showErrorWithTitle:@"" WithMessage:@"请输入大于0元的金额"];
    } else {
        if ([self checkNum:priceTextField.text]) {
            [self dismissViewControllerAnimated:YES completion:nil];
            
            [[NSNotificationCenter defaultCenter] postNotificationName:@"passModifyInRelease"
                                                                object:self
                                                              userInfo:@{@"type":@"price",@"value":priceTextField.text}];
        } else {
            [self showErrorWithTitle:@"修改失败" WithMessage:@"请输入正确的价格"];
        }
    }
    
}

#pragma mark - TextField delegate
//点击return取消键盘
- (BOOL)textFieldShouldReturn:(UITextField *) textField {
    
    [textField resignFirstResponder];
    
    if ([priceTextField.text isEqualToString:@""]) {
        confirmButton.enabled = NO;
    } else {
        if ([priceTextField.text isEqualToString:@"0.0"]) {
            [self showErrorWithTitle:@"" WithMessage:@"请输入大于0元的金额"];
        } else {
            if ([self checkNum:priceTextField.text]) {
                [self dismissViewControllerAnimated:YES completion:nil];
                
                [[NSNotificationCenter defaultCenter] postNotificationName:@"passModifyInRelease"
                                                                    object:self
                                                                  userInfo:@{@"type":@"price",@"value":priceTextField.text}];
            } else {
                [self showErrorWithTitle:@"修改失败" WithMessage:@"请输入正确的价格"];
            }
        }
    }
    
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    if ([priceTextField.text isEqualToString:@""]) {
        confirmButton.enabled = NO;
    } else {
        confirmButton.enabled = YES;
    }
    
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if ([priceTextField.text isEqualToString:@""]) {
        confirmButton.enabled = NO;
    } else {
        confirmButton.enabled = YES;
    }
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    
    NSString *getStr = [textField.text stringByReplacingCharactersInRange:range withString:string];
    
    if ([getStr isEqualToString:@""]) {
        confirmButton.enabled = NO;
    } else {
        confirmButton.enabled = YES;
    }
    
    return YES;
}

// 点击编辑区以外的地方 取消键盘
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    if (![priceTextField isExclusiveTouch]) {
        [priceTextField resignFirstResponder];
    }
}

//判断数字正确
- (BOOL)checkNum:(NSString *)str
{
    NSString *regex =  @"\\d{1,10}(?:\\.\\d{1,2})?";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL isMatch = [pred evaluateWithObject:str];
    if (!isMatch) {
        //NSLog(@"价格只能输入数字");
        return NO;
    }
    //NSLog(@"数字正确！");
    return YES;
    
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
