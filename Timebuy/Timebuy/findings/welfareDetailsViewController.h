//
//  welfareDetailsViewController.h
//  Timebuy
//
//  Created by CraftDream on 15/10/6.
//  Copyright © 2015年 com.CraftDream. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "welfareProgressTableViewCell.h"
#import "programInfoTableViewCell.h"
#import "programDetailsTableViewCell.h"

@interface welfareDetailsViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>
{
    UIButton *sendButton;
}
@property (strong, nonatomic) IBOutlet UITableView *welfareDetailsTableView;

@end
