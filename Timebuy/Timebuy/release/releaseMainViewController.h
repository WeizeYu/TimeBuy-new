//
//  releaseInfoViewController.h
//  TimeBuy
//
//  Created by Mr.OJ on 15/8/29.
//  Copyright (c) 2015年 Mr.OJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "releaseDetailsTableViewCell.h"
#import "priceViewController.h"
#import "labelsTableViewCell.h"
#import "releaseTitleTableViewCell.h"
#import "changePriceTableViewCell.h"
#import "priceTableViewCell.h"
#import "selectTimeTableViewCell.h"

#import "placeViewController.h"
#import "priceViewController.h"
#import "selectTimeViewController.h"

#import "AFNetworking.h"
#import "MBProgressHUD.h"
#import "userConfiguration.h"

@interface releaseMainViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,MBProgressHUDDelegate>
{
    NSString *msgStr;
    NSString *placeStr;
    CGFloat *latitude;
    CGFloat *longtitude;
    NSString *startTimeStr;
    NSString *finishTimeStr;
    NSString *priceStr;
    NSString *phoneStr;
    NSString *label;
    
    MBProgressHUD *HUD;
    MBProgressHUD *HUDinSuccess;
    
    UIView *shadowView;
    
    NSInteger myRow;
    NSInteger mySection;
    
    UIButton *sendButton;
    
    UITextField *titleTextField;
    UITextView *detailsTextView;
}

@property (strong, nonatomic) IBOutlet UITableView *releaseTableView;
@property (strong, nonatomic) UIDatePicker *datePicker;
@property (strong, nonatomic) NSString *location;

@end
