//
//  ProfileDetailCell.h
//  Timebuy
//
//  Created by He yang on 15/10/11.
//  Copyright © 2015年 com.CraftDream. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProfileDetailModal.h"

@interface ProfileDetailCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *profileView;
@property (weak, nonatomic) IBOutlet UIImageView *vipView;
@property (weak, nonatomic) IBOutlet UILabel *profleNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *phoneLabel;
@property(nonatomic,strong)ProfileDetailModal *profileModal;
@end
