//
//  priceTableViewCell.m
//  TimeBuy
//
//  Created by CraftDream on 15/9/12.
//  Copyright (c) 2015年 Mr.OJ. All rights reserved.
//

#import "priceTableViewCell.h"

@implementation priceTableViewCell

@synthesize priceLabel;

- (void)awakeFromNib {
    // Initialization code
    
    self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
