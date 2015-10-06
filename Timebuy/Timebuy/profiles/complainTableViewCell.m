//
//  complainTableViewCell.m
//  Timebuy
//
//  Created by yuweize on 15/9/25.
//  Copyright (c) 2015年 com.CraftDream. All rights reserved.
//

#import "complainTableViewCell.h"

@implementation complainTableViewCell

- (void)awakeFromNib {
    [self.rootView.layer setCornerRadius:8];
    [self.commitButton.layer setCornerRadius:3];
    // Initialization code
}
- (IBAction)commitButtonClick:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"您确定要取消申诉吗？" message:@"" delegate:self cancelButtonTitle:@"取消"  otherButtonTitles:nil ];
    // optional - add more buttons:
    [alert addButtonWithTitle:@"确定"];
    [alert show];

}
-(void)setData:(NSMutableDictionary *)complainDic{
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
