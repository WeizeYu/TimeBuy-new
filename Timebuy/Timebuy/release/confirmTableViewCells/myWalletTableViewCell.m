//
//  myWalletTableViewCell.m
//  Timebuy
//
//  Created by CraftDream on 15/10/4.
//  Copyright (c) 2015年 com.CraftDream. All rights reserved.
//

#import "myWalletTableViewCell.h"

@implementation myWalletTableViewCell

@synthesize selectImgView1;

- (void)awakeFromNib {
    // Initialization code
    selectImgView1.tag = 101;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
