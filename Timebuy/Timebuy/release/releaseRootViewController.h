//
//  releaseMainViewController.h
//  Timebuy
//
//  Created by CraftDream on 15/9/26.
//  Copyright (c) 2015年 com.CraftDream. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "releaseDetailsTableViewCell.h"
#import "priceViewController.h"
#import "labelsTableViewCell.h"
#import "priceTableViewCell.h"
#import "selectTimeTableViewCell.h"
#import "urgentTableViewCell.h"

#import "priceViewController.h"
#import "selectTimeViewController.h"
#import "labelsViewController.h"

#import "AFNetworking.h"
#import "MBProgressHUD.h"
#import "userConfiguration.h"

@interface releaseRootViewController : UIViewController <UITableViewDataSource,UITableViewDelegate,MBProgressHUDDelegate>
{
    NSString *msgStr;
    NSString *placeStr;
    CGFloat *latitude;
    CGFloat *longtitude;
    NSString *timeStr;
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

- (IBAction)cancel:(id)sender;

@end
