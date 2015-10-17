//
//  doneTableViewCell.m
//  Timebuy
//
//  Created by yuweize on 15/9/24.
//  Copyright (c) 2015年 com.CraftDream. All rights reserved.
//

#import "doneTableViewCell.h"
#import "MTConst.h"

@implementation doneTableViewCell

- (void)awakeFromNib {
    [self.rootView.layer setCornerRadius:8];
    [self.doneButton.layer setCornerRadius:3];
    // Initialization code
}
-(void)setData:(NSMutableDictionary *)doneDic{
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)btnClick:(id)sender {
    [[NSNotificationCenter defaultCenter] postNotificationName:pushCommentNotification object:nil];
}

@end
