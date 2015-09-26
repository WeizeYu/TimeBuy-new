//
//  changePriceTableViewCell.h
//  TimeBuy
//
//  Created by CraftDream on 15/9/12.
//  Copyright (c) 2015年 Mr.OJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZJSwitch.h"
#import "priceTableViewCell.h"

@interface changePriceTableViewCell : UITableViewCell


@property (retain, nonatomic) IBOutlet UIView *backgroudView;
@property (retain, nonatomic) ZJSwitch *changePriceSwitch;
@property (retain, nonatomic) UITableView *myTableView;

@end
