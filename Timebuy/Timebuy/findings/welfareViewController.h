//
//  welfareViewController.h
//  Timebuy
//
//  Created by CraftDream on 15/10/6.
//  Copyright (c) 2015年 com.CraftDream. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HMSegmentedControl.h"

#import "welfareDetailsTableViewCell.h"

@interface welfareViewController : UIViewController <UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *welfareTableView;
@property (strong, nonatomic) HMSegmentedControl *segmentedControl;
@end
