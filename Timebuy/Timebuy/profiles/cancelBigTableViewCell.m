//
//  cancelBigTableViewCell.m
//  Timebuy
//
//  Created by yuweize on 15/9/25.
//  Copyright (c) 2015年 com.CraftDream. All rights reserved.
//

#import "cancelBigTableViewCell.h"

@implementation cancelBigTableViewCell

- (void)awakeFromNib {
    // Initialization code
    [self.rootView.layer setCornerRadius:8];
    [self.refaButton.layer setCornerRadius:3];
}
-(void)setData:(NSMutableDictionary *)cancelDic{
    self.time.text=[cancelDic objectForKey:@"starttime"];
    self.workTime.text=[cancelDic objectForKey:@"finishtime"];
    self.money.text=[cancelDic objectForKey:@"money"];
    self.content.text=[cancelDic objectForKey:@"news"];
    [self.headImage setImage:[UIImage imageNamed: [cancelDic objectForKey:@"headImage"]]];
    self.where.text=[cancelDic objectForKey:@"where"];
    self.zan.text=[cancelDic objectForKey:@"zan"];
    self.share.text=[cancelDic objectForKey:@"share"];
    NSArray *allimage=[cancelDic objectForKey:@"pics"];
    [self.showImage setImage:[UIImage imageNamed:[allimage objectAtIndex:0]]];
    [self.showImage2 setImage:[UIImage imageNamed:[allimage objectAtIndex:0]]];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
