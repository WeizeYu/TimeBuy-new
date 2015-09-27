//
//  releaseDetailsTableViewCell.m
//  TimeBuy
//
//  Created by Mr.OJ on 15/8/29.
//  Copyright (c) 2015年 Mr.OJ. All rights reserved.
//

#import "releaseDetailsTableViewCell.h"

@implementation releaseDetailsTableViewCell

@synthesize detailsTextView;
@synthesize placeholderLabel;
@synthesize addButton;
@synthesize imageView1;
@synthesize imageView2;
@synthesize placeButton;
@synthesize photPicker;

- (void)awakeFromNib {
    // Initialization code
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    detailsTextView.delegate = self;
    
    detailsTextView.tag = 2;
    
    self.photPicker = [[PhotoPicker alloc] init];
    photPicker.delegate = self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)addImage:(id)sender
{
    NSLog(@"Hello");
    
    [self.photPicker openMenu];
    [self.photPicker setBigImage:false];
}

- (IBAction)location:(id)sender
{
    
}

#pragma mark - TextView delegate
- (void)textViewDidBeginEditing:(UITextView *)textView
{
    
}

- (void)textViewDidChange:(UITextView *)textView
{
    //NSLog(@"text = %@",textView.text);
    if (textView.text.length == 0) {
        placeholderLabel.text = @"内容、要求，注明确切地点";
    } else {
        placeholderLabel.text = @"";
    }
}

- (void)getImageUrl:(NSArray *)imageArray
{
    NSLog(@"get image");
}

#pragma mark - photoView delegate
- (void)addPicker:(UIImagePickerController *)picker {
    [self.viewController presentViewController:picker animated:YES completion:nil];
}

// 点击编辑区以外的地方 取消键盘
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    if (![detailsTextView isExclusiveTouch]) {
        [detailsTextView resignFirstResponder];
    }
}

- (UIViewController*)viewController {
    for (UIView* next = [self superview]; next; next = next.superview) {
        UIResponder* nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController*)nextResponder;
        }
    }
    return nil;  
}

@end
