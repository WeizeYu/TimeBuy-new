//
//  timeSelectViewController.m
//  TimeBuy
//
//  Created by Mr.OJ on 15/9/14.
//  Copyright (c) 2015年 Mr.OJ. All rights reserved.
//

#import "selectTimeViewController.h"

@interface selectTimeViewController ()

@end

@implementation selectTimeViewController

@synthesize startTimeTextField,endTimeTextField,datePicker;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationController.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,[UIFont systemFontOfSize:20.0f], NSFontAttributeName, nil];
    self.navigationItem.title = @"修改时间";
    
    UIBarButtonItem *registerButton = [[UIBarButtonItem alloc] initWithTitle:@"确定" style:UIBarButtonItemStylePlain target:self action:@selector(save:)];
    self.navigationItem.rightBarButtonItem = registerButton;
    self.navigationItem.rightBarButtonItem.enabled = NO;
    
    startTimeTextField.delegate = self;
    endTimeTextField.delegate = self;
    
    flag = 0;
    
    [startTimeTextField addTarget:self action:@selector(startTimeEvent:) forControlEvents:UIControlEventTouchDown];
    [endTimeTextField addTarget:self action:@selector(endTimeEvent:) forControlEvents:UIControlEventTouchDown];
    
}

- (void)save:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"passModifyInRelease"
                                                        object:self
                                                      userInfo:@{@"type":@"time",@"value":startTimeTextField.text,
                                                                 @"value2":endTimeTextField.text}];
    
}

- (void)dateChanged:(id)sender {
    
    UITextField *curTextField = (UITextField *)sender;
    
    UIDatePicker* control = (UIDatePicker*)sender;
    NSDate* date = control.date;
    NSLog(@"%ld",(long)curTextField.tag);
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    NSString *curDateTime = [formatter stringFromDate:date];
    
    if (flag == 1) {
        startTimeTextField.text = curDateTime;
        
    } else if (flag == 2) {
        endTimeTextField.text = curDateTime;
    }
    
    if (![startTimeTextField.text isEqualToString:@""] && ![endTimeTextField.text isEqualToString:@""]) {
        self.navigationItem.rightBarButtonItem.enabled = YES;
    } else {
        self.navigationItem.rightBarButtonItem.enabled = NO;
    }
    
}

- (void)startTimeEvent:(id)sender {
    NSLog(@"start");
    
    flag = 1;
    
    for (UIView *v in [self.view subviews]) {
        if ([v isKindOfClass:[UIDatePicker class]]) {
            [v removeFromSuperview];
        }
    }
    
    datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height - 275, [UIScreen mainScreen].bounds.size.width, 275)];
    datePicker.datePickerMode = UIDatePickerModeDateAndTime;
    datePicker.minuteInterval = 30;
    datePicker.backgroundColor = [UIColor whiteColor];
    NSDate *minDate = [NSDate date];
    datePicker.minimumDate = minDate;
    [datePicker addTarget:self action:@selector(dateChanged:) forControlEvents:UIControlEventValueChanged ];
    [self.view addSubview:datePicker];
}

- (void)endTimeEvent:(id)sender {
    NSLog(@"start");
    
    flag = 2;
    
    for (UIView *v in [self.view subviews]) {
        if ([v isKindOfClass:[UIDatePicker class]]) {
            [v removeFromSuperview];
        }
    }
    
    datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height - 275, [UIScreen mainScreen].bounds.size.width, 275)];
    datePicker.datePickerMode = UIDatePickerModeDateAndTime;
    datePicker.minuteInterval = 30;
    datePicker.backgroundColor = [UIColor whiteColor];
    NSDate *minDate = [NSDate date];
    datePicker.minimumDate = minDate;
    [datePicker addTarget:self action:@selector(dateChanged:) forControlEvents:UIControlEventValueChanged ];
    [self.view addSubview:datePicker];
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    
    return NO;
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
