//
//  adressViewController.h
//  TimeBuy
//
//  Created by Mr.OJ on 15/8/19.
//  Copyright (c) 2015年 Mr.OJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "addressDetailViewController.h"
@interface addressViewController : UIViewController<UITextFieldDelegate,UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) NSString *address;
@property (nonatomic) NSMutableArray *area;
@end
