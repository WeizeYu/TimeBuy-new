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

@interface homeMainViewController : UIViewController <UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate,JScrollViewViewDelegate>

@property (strong, nonatomic) UIButton *button;
@property (strong, nonatomic) IBOutlet UITableView *homeTableView;

@end
