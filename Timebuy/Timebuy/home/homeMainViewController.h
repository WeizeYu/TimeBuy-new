//
//  homeRootViewController.h
//  Timebuy
//
//  Created by CraftDream on 15/9/22.
//  Copyright (c) 2015年 com.CraftDream. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "homeDetailsViewController.h"
#import "homeImageDetailsTableViewCell.h"
#import "homeTextDetailsTableViewCell.h"

#import "MJRefresh.h"
#import "JScrollView+PageControl+AutoScroll.h"
#import "AFNetworking.h"
#import "MBProgressHUD.h"
#import "userConfiguration.h"

@interface homeMainViewController : UIViewController <UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate,JScrollViewViewDelegate,MBProgressHUDDelegate>
{
    MBProgressHUD *HUD;
    MBProgressHUD *HUDinSuccess;
}

@property (strong, nonatomic) UIButton *button;
@property (strong, nonatomic) IBOutlet UITableView *homeTableView;

@end
