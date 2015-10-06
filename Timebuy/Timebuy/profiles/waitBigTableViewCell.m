//
//  waitBigTableViewCell.m
//  Timebuy
//
//  Created by yuweize on 15/9/24.
//  Copyright (c) 2015年 com.CraftDream. All rights reserved.
//

#import "waitBigTableViewCell.h"

@implementation waitBigTableViewCell

- (void)awakeFromNib {
    [self.rootView.layer setCornerRadius:8];
    [self.cancelButton.layer setCornerRadius:3];
    // Initialization code
}
-(void)setData:(NSMutableDictionary *)waitDic{
    
}
- (IBAction)cancelClick:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"您确定要取消任务吗？" message:@"" delegate:self cancelButtonTitle:@"取消"  otherButtonTitles:nil ];
    // optional - add more buttons:
    [alert addButtonWithTitle:@"确定"];
    [alert show];

}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
