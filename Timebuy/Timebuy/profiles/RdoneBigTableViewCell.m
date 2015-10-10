//
//  RdoneBigTableViewCell.m
//  Timebuy
//
//  Created by yuweize on 15/10/10.
//  Copyright © 2015年 com.CraftDream. All rights reserved.
//

#import "RdoneBigTableViewCell.h"

@implementation RdoneBigTableViewCell

- (void)awakeFromNib {
    // Initialization code
    [self.pingfenButton.layer setCornerRadius:3];
    [self.rootView.layer setCornerRadius:8];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
