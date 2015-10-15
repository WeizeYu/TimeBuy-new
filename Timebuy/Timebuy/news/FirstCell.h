//
//  FirstCell.h
//  Timebuy
//
//  Created by He yang on 15/10/15.
//  Copyright © 2015年 com.CraftDream. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *orderNemberLabel;
@property (weak, nonatomic) IBOutlet UILabel *stateLabel;
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *hourLabel;
@property (weak, nonatomic) IBOutlet UILabel *descripeLabel;
@property (weak, nonatomic) IBOutlet UILabel *placeLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UIButton *phoneBtn;

@end
