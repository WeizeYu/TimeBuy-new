//
//  labelsTableViewCell.m
//  TimeBuy
//
//  Created by Mr.OJ on 15/9/2.
//  Copyright (c) 2015年 Mr.OJ. All rights reserved.
//

#import "labelsTableViewCell.h"

@implementation labelsTableViewCell

@synthesize labelStr1;
@synthesize labelStr2;

- (void)awakeFromNib {
    // Initialization code
    
    self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
