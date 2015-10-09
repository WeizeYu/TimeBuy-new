//
//  welfarePayViewController.h
//  Timebuy
//
//  Created by CraftDream on 15/10/8.
//  Copyright © 2015年 com.CraftDream. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "payDetailsTableViewCell.h"
#import "welfarePriceTableViewCell.h"
#import "myWalletTableViewCell.h"
#import "alipayTableViewCell.h"

@interface welfarePaymentViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *welfarePayTableView;
@end
