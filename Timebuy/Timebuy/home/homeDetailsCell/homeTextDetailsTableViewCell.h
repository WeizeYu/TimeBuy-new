//
//  homeTextDetailsTableViewCell.h
//  Timebuy
//
//  Created by CraftDream on 15/10/3.
//  Copyright (c) 2015年 com.CraftDream. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface homeTextDetailsTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *portraitImgView;
@property (strong, nonatomic) IBOutlet UILabel *nicknameLabel;
@property (strong, nonatomic) IBOutlet UILabel *detailsLabel;
@property (strong, nonatomic) IBOutlet UILabel *priceLabel;
@property (strong, nonatomic) IBOutlet UILabel *timeAndDistLabel;

@end
