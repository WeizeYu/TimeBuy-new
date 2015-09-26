//
//  timeSelectViewController.h
//  TimeBuy
//
//  Created by Mr.OJ on 15/9/14.
//  Copyright (c) 2015年 Mr.OJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface selectTimeViewController : UIViewController<UITextFieldDelegate>
{
    NSInteger flag;
}

@property (strong, nonatomic) IBOutlet UITextField *startTimeTextField;
@property (strong, nonatomic) IBOutlet UITextField *endTimeTextField;
@property (strong, nonatomic) UIDatePicker *datePicker;

@end
