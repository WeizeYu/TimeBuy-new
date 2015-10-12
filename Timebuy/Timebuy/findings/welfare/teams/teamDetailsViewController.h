//
//  teamDetailsViewController.h
//  Timebuy
//
//  Created by CraftDream on 15/10/11.
//  Copyright © 2015年 com.CraftDream. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "teamTitleTableViewCell.h"
#import "teamDetailsTableViewCell.h"
#import "teamInfoTableViewCell.h"
#import "experienceTableViewCell.h"
#import "teamMemberTableViewCell.h"

@interface teamDetailsViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *teamDetailsTableView;

@end
