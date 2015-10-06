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
@synthesize confirmButton;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    startTimeTextField.delegate = self;
    endTimeTextField.delegate = self;
    
    startTimeDate = [[NSDate alloc] init];
    
    flag = 0;
    
    [startTimeTextField addTarget:self action:@selector(startTimeEvent:) forControlEvents:UIControlEventTouchDown];
    [endTimeTextField addTarget:self action:@selector(endTimeEvent:) forControlEvents:UIControlEventTouchDown];
    
    //[startTimeTextField becomeFirstResponder];
    
    shadowView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    shadowView.backgroundColor = [UIColor blackColor];
    shadowView.alpha = 0.3f;
    [self.view addSubview:shadowView];
    shadowView.hidden = YES;
    
    UITapGestureRecognizer*tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(Actiondo:)];
    
    [shadowView addGestureRecognizer:tapGesture];
    
    transition1 = [CATransition animation];
    transition1.delegate = self;
    transition1.duration = 0.2f;
    transition1.timingFunction = UIViewAnimationCurveEaseInOut;
    transition1.type = kCATransitionMoveIn;
    transition1.subtype = kCATransitionFromTop;
    
    transition2 = [CATransition animation];
    transition2.delegate = self;
    transition2.duration = 0.2f;
    transition2.timingFunction = UIViewAnimationCurveEaseInOut;
    transition2.type = kCATransitionFade;
    
    
}

- (IBAction)cancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)save:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MM/dd HH:mm"]; //设置日期格式
    
    NSString *timeStr = [NSString stringWithFormat:@"%@ ~ %@", [dateFormatter stringFromDate:startTimeDate],[dateFormatter stringFromDate:endTimeDate]];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"passModifyInRelease"
                                                        object:self
                                                      userInfo:@{@"type":@"time",
                                                                 @"value":timeStr,
                                                                 @"startTime":startTimeTextField.text,
                                                                 @"endTime":endTimeTextField.text}];
    
}

- (void)dateChanged:(id)sender {
    
    UIDatePicker* control = (UIDatePicker*)sender;
    controlDate = control.date;
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy/MM/dd HH:mm"];
    NSString *curDateTime = [formatter stringFromDate:controlDate];
    
    if (flag == 1) {
        startTimeTextField.text = curDateTime;
        startTimeDate = controlDate;
        
    } else if (flag == 2) {
        endTimeTextField.text = curDateTime;
        endTimeDate = controlDate;
    }
    
    if (![startTimeTextField.text isEqualToString:@""] && ![endTimeTextField.text isEqualToString:@""]) {
        confirmButton.enabled = YES;
    } else {
        confirmButton.enabled = NO;
    }
    
}


//点击阴影取消事件
-(void)Actiondo:(id)sender{
    shadowView.hidden = YES;
    //[shadowView removeFromSuperview];
    [datePicker removeFromSuperview];
}

- (void)startTimeEvent:(id)sender {
    NSLog(@"start");
    
    shadowView.hidden = NO;
    [self.view addSubview:shadowView];
    
    NSDate* date = [NSDate date];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy/MM/dd HH:mm"];
    NSString *curDateTime = [formatter stringFromDate:date];
    
    startTimeTextField.text = curDateTime;
    
    flag = 1;
    
    for (UIView *v in [self.view subviews]) {
        if ([v isKindOfClass:[UIDatePicker class]]) {
            [v removeFromSuperview];
        }
    }
    
    datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height - 275 + 64, [UIScreen mainScreen].bounds.size.width, 275)];
    datePicker.datePickerMode = UIDatePickerModeDateAndTime;
    datePicker.minuteInterval = 10;
    datePicker.backgroundColor = [UIColor whiteColor];
    NSDate *minDate = [NSDate date];
    datePicker.minimumDate = minDate;
    [datePicker addTarget:self action:@selector(dateChanged:) forControlEvents:UIControlEventValueChanged ];
    [self.view addSubview:datePicker];
    
    [[datePicker layer] addAnimation:transition1 forKey:nil];
    [[shadowView layer] addAnimation:transition2 forKey:nil];
}

- (void)endTimeEvent:(id)sender {
    NSLog(@"end");
    
    shadowView.hidden = NO;
    //[self.view addSubview:shadowView];
    
    flag = 2;
    
    for (UIView *v in [self.view subviews]) {
        if ([v isKindOfClass:[UIDatePicker class]]) {
            [v removeFromSuperview];
        }
    }
    
    datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height - 275 + 64, [UIScreen mainScreen].bounds.size.width, 275)];
    datePicker.datePickerMode = UIDatePickerModeDateAndTime;
    datePicker.minuteInterval = 10;
    datePicker.backgroundColor = [UIColor whiteColor];
    if ([startTimeTextField.text isEqualToString:@""]) {
        NSDate *minDate = [NSDate date];
        datePicker.minimumDate = minDate;
    } else {
        NSDate *minDate = startTimeDate;
        datePicker.minimumDate = minDate;
    }
    [datePicker addTarget:self action:@selector(dateChanged:) forControlEvents:UIControlEventValueChanged ];
    [self.view addSubview:datePicker];
    
    [[datePicker layer] addAnimation:transition1 forKey:nil];
    [[shadowView layer] addAnimation:transition2 forKey:nil];
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

//时间先后比较
- (BOOL)compareDate:(NSString *)oldTime withTargetTime:(NSString *)newTime
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy/MM/dd HH:mm"]; //设置日期格式
    NSDate *oldDate = [dateFormatter dateFromString:oldTime];
    NSDate *newDate = [dateFormatter dateFromString:newTime];  //开始日期，将NSString转为NSDate

    //NSDate *r = [today earlierDate:newDate];//返回较早的那个日期
    NSDate *r = [oldDate laterDate:newDate];  //返回较晚的那个日期
    
    if([oldDate isEqualToDate:newDate]) {
        NSLog(@"日期相同");
    }else{
        if([r isEqualToDate:newDate]) {
            NSLog(@"未过期");
            return YES;
            // [self.myPayedOrders addObject:ar];
        }else{
            NSLog(@"已过期");
            return NO;
            // [self.myFinishedOrders addObject:ar];
        }
    }
    return NO;
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
