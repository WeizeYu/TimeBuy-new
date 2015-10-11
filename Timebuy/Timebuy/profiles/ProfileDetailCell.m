//
//  ProfileDetailCell.m
//  Timebuy
//
//  Created by He yang on 15/10/11.
//  Copyright © 2015年 com.CraftDream. All rights reserved.
//

#import "ProfileDetailCell.h"

@implementation ProfileDetailCell




- (void)awakeFromNib {
    // Initialization code
}


-(void)setProfileModal:(ProfileDetailModal *)profileModal{
    _profileModal = profileModal;
    
    self.phoneLabel.text = [NSString stringWithFormat:@"账号 : %@",profileModal.phoneStr];
    self.profleNameLabel.text = profileModal.nameStr;
    self.vipView.backgroundColor = [UIColor blueColor];
    self.profileView.backgroundColor = [UIColor redColor];
    self.profileView.layer.cornerRadius = self.profileView.bounds.size.height / 2;
    self.profileView.layer.masksToBounds = YES;
    self.vipView.layer.cornerRadius = self.vipView.bounds.size.height / 2;
    self.vipView.layer.masksToBounds = YES;

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
