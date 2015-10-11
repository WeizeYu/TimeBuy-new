//
//  confirmViewController.h
//  Timebuy
//
//  Created by CraftDream on 15/10/4.
//  Copyright (c) 2015年 com.CraftDream. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "confirmDetailsTableViewCell.h"
#import "confirmTimeTableViewCell.h"
#import "confirmPriceTableViewCell.h"
#import "myWalletTableViewCell.h"
#import "alipayTableViewCell.h"
#import "MBProgressHUD.h"

@interface confirmViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    UIButton *sendButton;
    MBProgressHUD *HUD;
    MBProgressHUD *HUDinSuccess;
}
@property(nonatomic,copy)NSString *news;
@property(nonatomic,strong)NSArray *pics;
@property(nonatomic,copy)NSString *money;
@property(nonatomic,copy)NSString *phone;
@property (strong, nonatomic) IBOutlet UITableView *confirmTableView;

- (IBAction)cancel:(id)sender;

@end


