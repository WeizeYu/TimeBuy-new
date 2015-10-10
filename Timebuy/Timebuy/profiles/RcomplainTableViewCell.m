//
//  RcomplainTableViewCell.m
//  Timebuy
//
//  Created by yuweize on 15/10/10.
//  Copyright © 2015年 com.CraftDream. All rights reserved.
//

#import "RcomplainTableViewCell.h"

@implementation RcomplainTableViewCell

- (void)awakeFromNib {
    // Initialization code
    [self.cancelButton.layer setCornerRadius:3];
    [self.rootView.layer setCornerRadius:8];
}
- (IBAction)commitButtonClick:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"您确定要取消申诉吗？" message:@"" delegate:self cancelButtonTitle:@"取消"  otherButtonTitles:nil ];
    // optional - add more buttons:
    [alert addButtonWithTitle:@"确定"];
    [alert show];
    
}
-(void) setData:(NSMutableDictionary *)complainDic
{
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
