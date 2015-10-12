//
//  homeImageDetailsTableViewCell.m
//  Timebuy
//
//  Created by CraftDream on 15/10/3.
//  Copyright (c) 2015年 com.CraftDream. All rights reserved.
//

#import "homeImageDetailsTableViewCell.h"
#import "MJPhotoBrowser.h"
#import "MJPhoto.h"

@implementation homeImageDetailsTableViewCell

@synthesize portraitImgView;
@synthesize nicknameLabel;
@synthesize priceLabel;
@synthesize showImgButton1;
@synthesize showImgButton2;
@synthesize showImgButton3;
@synthesize timeAndDistLabel;
@synthesize detailsLabel;
@synthesize levelImgView;

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


-(void)setImageCellModal:(ImageCellModal *)imageCellModal{
    _imageCellModal = imageCellModal;
    [self.showImgButton1 setImage:[UIImage imageNamed:self.imageCellModal.image_url[0]] forState:UIControlStateNormal];
    [self.showImgButton2 setImage:[UIImage imageNamed:self.imageCellModal.image_url[1]] forState:UIControlStateNormal];
    [self.showImgButton3 setImage:[UIImage imageNamed:self.imageCellModal.image_url[2]] forState:UIControlStateNormal];

}



- (IBAction)showImg1:(UIImageView *)sender {
    int i = 0;
    NSMutableArray *mAray = [NSMutableArray array];
    for (NSString *url in self.imageCellModal.image_url) {
        MJPhoto *mjPhoto = [[MJPhoto alloc] init];
//        NSURL *urlS = [NSURL URLWithString:url];
//        NSString *urlStr = urlS.absoluteString;
        mjPhoto.url = [NSURL URLWithString:url];
        mjPhoto.index = i;
        mjPhoto.srcImageView = (UIImageView *)sender;
//        NSLog(@" 111---  %@ ---111",mjPhoto.srcImageView );

        [mAray addObject:mjPhoto];
        i++;
    }
    MJPhotoBrowser *browser = [[MJPhotoBrowser alloc] init];
    browser.photos =mAray;
    [browser show];
   
}

- (IBAction)showImg2:(id)sender {
    
}
- (IBAction)showImg3:(id)sender {
    
}

@end
