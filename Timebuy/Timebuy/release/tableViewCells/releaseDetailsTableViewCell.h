//
//  releaseDetailsTableViewCell.h
//  TimeBuy
//
//  Created by Mr.OJ on 15/8/29.
//  Copyright (c) 2015年 Mr.OJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PhotoPicker.h"

@interface releaseDetailsTableViewCell : UITableViewCell<UITextViewDelegate,photoPickerDelegate>

@property (strong, nonatomic) IBOutlet UITextView *detailsTextView;
@property (strong, nonatomic) IBOutlet UILabel *placeholderLabel;
@property (strong, nonatomic) IBOutlet UIButton *addButton;
@property (strong, nonatomic) IBOutlet UIImageView *imageView1;
@property (strong, nonatomic) IBOutlet UIImageView *imageView2;
@property (weak, nonatomic) IBOutlet UIButton *placeButton;

@property (strong, nonatomic) PhotoPicker *photPicker;

- (IBAction)addImage:(id)sender;
- (IBAction)location:(id)sender;

@end
