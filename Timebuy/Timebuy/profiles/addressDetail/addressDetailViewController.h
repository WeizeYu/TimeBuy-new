//
//  addressDetailViewController.h
//  TimeBuy
//
//  Created by yuweize on 15/9/11.
//  Copyright (c) 2015年 Mr.OJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface addressDetailViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic) NSMutableArray *cities;
@property (nonatomic) NSString *province;
@end
