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
@synthesize image1Button;
@synthesize image2Button;
@synthesize image3Button;
@synthesize placeButton;
@synthesize photPicker;

@synthesize getImageArray;

- (void)awakeFromNib {
    // Initialization code
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    getImageArray = [[NSMutableArray alloc] init];
    
    detailsTextView.delegate = self;
    
    detailsTextView.tag = 1102;
    
    self.photPicker = [[PhotoPicker alloc] init];
    photPicker.delegate = self;
    
    image1Button.enabled = YES;
    image2Button.enabled = NO;
    image3Button.enabled = NO;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)tapImage1:(id)sender
{
    if (getImageArray.count == 0) {
        self.photPicker.curImgNum = 0;
        [self.photPicker openMenu];
        [self.photPicker setBigImage:false];
        
    } else{
        NSMutableArray *imageArray = [[NSMutableArray alloc] init];
        for (NSInteger i = 0; i < getImageArray.count; i ++) {
            ALAsset *asset = getImageArray[i];
            [imageArray addObject:[UIImage imageWithCGImage:asset.defaultRepresentation.fullScreenImage]];
        }
        
        
        NFXIntroViewController *vc = [[NFXIntroViewController alloc] initWithViews:imageArray withTag:1];
        [self.viewController presentViewController:vc animated:true completion:nil];
    }
}

- (IBAction)tapImage2:(id)sender
{
    if (getImageArray.count == 1) {
        self.photPicker.curImgNum = 1;
        [self.photPicker openMenu];
        [self.photPicker setBigImage:false];
    } else {
        NSMutableArray *imageArray = [[NSMutableArray alloc] init];
        for (NSInteger i = 0; i < getImageArray.count; i ++) {
            ALAsset *asset = getImageArray[i];
            [imageArray addObject:[UIImage imageWithCGImage:asset.defaultRepresentation.fullScreenImage]];
        }
        
        
        NFXIntroViewController *vc = [[NFXIntroViewController alloc] initWithViews:imageArray withTag:1];
        [self.viewController presentViewController:vc animated:true completion:nil];
    }
}

- (IBAction)tapImage3:(id)sender
{
    if (getImageArray.count == 2) {
        self.photPicker.curImgNum = 2;
        [self.photPicker openMenu];
        [self.photPicker setBigImage:false];
    } else {
        NSMutableArray *imageArray = [[NSMutableArray alloc] init];
        for (NSInteger i = 0; i < getImageArray.count; i ++) {
            ALAsset *asset = getImageArray[i];
            [imageArray addObject:[UIImage imageWithCGImage:asset.defaultRepresentation.fullScreenImage]];
        }
        
        
        NFXIntroViewController *vc = [[NFXIntroViewController alloc] initWithViews:imageArray withTag:1];
        [self.viewController presentViewController:vc animated:true completion:nil];
    }
}

//进入定位
- (IBAction)location:(id)sender
{
    locationViewController *locationVC = [[locationViewController alloc] init];
    
    [self.viewController presentViewController:locationVC animated:YES completion:nil];
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
    //NSLog(@"get image");
    //NSLog(@"image array = %@",imageArray);
    [getImageArray addObjectsFromArray:imageArray];
    NSInteger imageNum = getImageArray.count;
    
    switch (imageNum) {
        case 0:
        {
            [image1Button setImage:[UIImage imageNamed:@"addImg"] forState:UIControlStateNormal];
            [image2Button setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
            [image3Button setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
            image1Button.enabled = YES;
            image2Button.enabled = NO;
            image3Button.enabled = NO;
            break;
        }
        case 1:
        {
            ALAsset *asset1 = getImageArray[0];
            [image1Button setImage:[UIImage imageWithCGImage:asset1.defaultRepresentation.fullResolutionImage] forState:UIControlStateNormal];
            [image2Button setImage:[UIImage imageNamed:@"addImg"] forState:UIControlStateNormal];
            [image3Button setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
            image1Button.enabled = YES;
            image2Button.enabled = YES;
            image3Button.enabled = NO;
            break;
        }
        case 2:
        {
            ALAsset *asset1 = getImageArray[0];
            ALAsset *asset2 = getImageArray[1];
            [image1Button setImage:[UIImage imageWithCGImage:asset1.defaultRepresentation.fullResolutionImage] forState:UIControlStateNormal];
            [image2Button setImage:[UIImage imageWithCGImage:asset2.defaultRepresentation.fullResolutionImage] forState:UIControlStateNormal];
            [image3Button setImage:[UIImage imageNamed:@"addImg"] forState:UIControlStateNormal];
            image1Button.enabled = YES;
            image2Button.enabled = YES;
            image3Button.enabled = YES;
            break;
        }
        case 3:
        {
            ALAsset *asset1 = getImageArray[0];
            ALAsset *asset2 = getImageArray[1];
            ALAsset *asset3 = getImageArray[2];
            
            [image1Button setImage:[UIImage imageWithCGImage:asset1.defaultRepresentation.fullResolutionImage] forState:UIControlStateNormal];
            [image2Button setImage:[UIImage imageWithCGImage:asset2.defaultRepresentation.fullResolutionImage] forState:UIControlStateNormal];
            [image3Button setImage:[UIImage imageWithCGImage:asset3.defaultRepresentation.fullResolutionImage] forState:UIControlStateNormal];
            image1Button.enabled = YES;
            image2Button.enabled = YES;
            image3Button.enabled = YES;
            break;
        }
        default:
            break;
    }
    
    
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
