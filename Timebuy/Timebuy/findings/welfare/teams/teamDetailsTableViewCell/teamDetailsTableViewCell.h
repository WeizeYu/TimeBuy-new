//
//  teamDetailsTableViewCell.h
//  Timebuy
//
//  Created by CraftDream on 15/10/11.
//  Copyright © 2015年 com.CraftDream. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface teamDetailsTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIProgressView *teamProgressView;
@property (strong, nonatomic) IBOutlet UILabel *teamProgressLabel;
@property (strong, nonatomic) IBOutlet UILabel *targetNumLabel;
@property (strong, nonatomic) IBOutlet UILabel *programNumLabel;
@property (strong, nonatomic) IBOutlet UILabel *timeLabel;

@end
