//
//  homeImageDetailsTableViewCell.m
//  Timebuy
//
//  Created by CraftDream on 15/10/3.
//  Copyright (c) 2015年 com.CraftDream. All rights reserved.
//

#import "homeImageDetailsTableViewCell.h"

@implementation homeImageDetailsTableViewCell

@synthesize portraitImgView;
@synthesize nicknameLabel;
@synthesize priceLabel;
@synthesize showImgButton1;
@synthesize showImgButton2;
@synthesize showImgButton3;
@synthesize timeAndDistLabel;
@synthesize detailsLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    if (self)
    {
        self.contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
        
        //self.portraitImgView.layer.masksToBounds = YES;
        //self.portraitImgView.layer.cornerRadius = self.portraitImgView.bounds.size.height / 2;
        //self.frame = CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, 20);
        
    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)showImg1:(id)sender {
    
}

- (IBAction)showImg2:(id)sender {
    
}
- (IBAction)showImg3:(id)sender {
    
}

@end
