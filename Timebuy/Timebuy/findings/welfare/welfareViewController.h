//
//  welfareViewController.h
//  Timebuy
//
//  Created by CraftDream on 15/10/6.
//  Copyright (c) 2015年 com.CraftDream. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HMSegmentedControl.h"

#import "programTableViewCell.h"
#import "teamTableViewCell.h"
#import "welfareDetailsViewController.h"
#import "teamDetailsViewController.h"

@interface welfareViewController : UIViewController <UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate,UIGestureRecognizerDelegate>
{
    UITapGestureRecognizer *_tapGr;
    //NSInteger SegmentIndex;
    
}

@property (strong, nonatomic) IBOutlet UITableView *welfareTableView;
@property (strong, nonatomic) HMSegmentedControl *segmentedControl;
@property (nonatomic) NSInteger SegmentIndex;
@end
