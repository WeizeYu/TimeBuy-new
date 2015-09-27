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

    UIView *shadowView;
    
    CATransition *transition1;
    CATransition *transition2;
    
    NSDate* controlDate;
    NSDate* startTimeDate;
    NSDate* endTimeDate;

}

@property (strong, nonatomic) IBOutlet UITextField *startTimeTextField;
@property (strong, nonatomic) IBOutlet UITextField *endTimeTextField;
@property (strong, nonatomic) UIDatePicker *datePicker;
@property (strong, nonatomic) IBOutlet UIButton *confirmButton;

- (IBAction)cancel:(id)sender;
- (IBAction)save:(id)sender;

@end