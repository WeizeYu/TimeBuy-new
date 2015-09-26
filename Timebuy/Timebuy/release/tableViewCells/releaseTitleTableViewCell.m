//
//  releaseTitleTableViewCell.m
//  TimeBuy
//
//  Created by CraftDream on 15/9/12.
//  Copyright (c) 2015年 Mr.OJ. All rights reserved.
//

#import "releaseTitleTableViewCell.h"

@implementation releaseTitleTableViewCell

@synthesize titleTextField;
- (void)awakeFromNib {
    // Initialization code
    titleTextField.tag = 1;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
