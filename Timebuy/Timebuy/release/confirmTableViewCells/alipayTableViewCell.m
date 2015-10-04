//
//  alipayTableViewCell.m
//  Timebuy
//
//  Created by CraftDream on 15/10/4.
//  Copyright (c) 2015年 com.CraftDream. All rights reserved.
//

#import "alipayTableViewCell.h"

@implementation alipayTableViewCell

@synthesize selectImgView2;

- (void)awakeFromNib {
    // Initialization code
    selectImgView2.tag = 102;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
