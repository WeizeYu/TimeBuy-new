//
//  welfareProgressTableViewCell.h
//  Timebuy
//
//  Created by CraftDream on 15/10/6.
//  Copyright © 2015年 com.CraftDream. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface welfareProgressTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIProgressView *welfareProgressView;
@property (strong, nonatomic) IBOutlet UILabel *welfareProgressLabel;
@property (strong, nonatomic) IBOutlet UILabel *targetNumLabel;
@property (strong, nonatomic) IBOutlet UILabel *soldoutNumLabel;
@property (strong, nonatomic) IBOutlet UILabel *avgPriceLabel;

@end
