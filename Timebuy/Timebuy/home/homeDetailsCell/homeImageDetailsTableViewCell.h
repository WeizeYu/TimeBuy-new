//
//  homeImageDetailsTableViewCell.h
//  Timebuy
//
//  Created by CraftDream on 15/10/3.
//  Copyright (c) 2015年 com.CraftDream. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface homeImageDetailsTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *portraitImgView;
@property (strong, nonatomic) IBOutlet UILabel *nicknameLabel;
@property (strong, nonatomic) IBOutlet UILabel *detailsLabel;
@property (strong, nonatomic) IBOutlet UILabel *priceLabel;
@property (strong, nonatomic) IBOutlet UIButton *showImgButton1;
@property (strong, nonatomic) IBOutlet UIButton *showImgButton2;
@property (strong, nonatomic) IBOutlet UIButton *showImgButton3;
@property (strong, nonatomic) IBOutlet UILabel *timeAndDistLabel;

- (IBAction)showImg1:(id)sender;
- (IBAction)showImg2:(id)sender;
- (IBAction)showImg3:(id)sender;

@end
