//
//  cancelTableViewCell.m
//  Timebuy
//
//  Created by yuweize on 15/9/25.
//  Copyright (c) 2015年 com.CraftDream. All rights reserved.
//

#import "cancelTableViewCell.h"

@implementation cancelTableViewCell

- (void)awakeFromNib {
    // Initialization code
}
-(void)setData:(NSMutableDictionary *)cancelDic{
    self.time.text=[cancelDic objectForKey:@"starttime"];
    self.workTime.text=[cancelDic objectForKey:@"finishtime"];
    self.money.text=[cancelDic objectForKey:@"money"];
    self.content.text=[cancelDic objectForKey:@"news"];
    self.headImage=[[UIImageView alloc]initWithImage:[UIImage imageNamed: [cancelDic objectForKey:@"headImage"]]];
    self.where.text=[cancelDic objectForKey:@"where"];
    self.zan.text=[cancelDic objectForKey:@"zan"];
    self.share.text=[cancelDic objectForKey:@"share"];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
