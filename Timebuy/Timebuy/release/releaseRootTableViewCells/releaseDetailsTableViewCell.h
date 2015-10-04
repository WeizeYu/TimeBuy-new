//
//  releaseDetailsTableViewCell.h
//  TimeBuy
//
//  Created by Mr.OJ on 15/8/29.
//  Copyright (c) 2015年 Mr.OJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PhotoPicker.h"
#import "NFXIntroViewController.h"

#import "locationViewController.h"

@interface releaseDetailsTableViewCell : UITableViewCell<UITextViewDelegate,photoPickerDelegate>

@property (strong, nonatomic) IBOutlet UITextView *detailsTextView;
@property (strong, nonatomic) IBOutlet UILabel *placeholderLabel;
@property (strong, nonatomic) IBOutlet UIButton *image1Button;
@property (strong, nonatomic) IBOutlet UIButton *image2Button;
@property (strong, nonatomic) IBOutlet UIButton *image3Button;

@property (strong, nonatomic) NSMutableArray *getImageArray;

@property (weak, nonatomic) IBOutlet UIButton *placeButton;

@property (strong, nonatomic) PhotoPicker *photPicker;

- (IBAction)tapImage1:(id)sender;
- (IBAction)tapImage2:(id)sender;
- (IBAction)tapImage3:(id)sender;
- (IBAction)location:(id)sender;

@end
