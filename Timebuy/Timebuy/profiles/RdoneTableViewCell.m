//
//  RdoneTableViewCell.m
//  Timebuy
//
//  Created by yuweize on 15/10/10.
//  Copyright © 2015年 com.CraftDream. All rights reserved.
//

#import "RdoneTableViewCell.h"

@implementation RdoneTableViewCell

- (void)awakeFromNib {
    [self.pingfenButton.layer setCornerRadius:3];
    [self.rootView.layer setCornerRadius:8];
    // Initialization code
}
-(void)setData:(NSMutableDictionary *)doneDic{
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
