//
//  cancelBigTableViewCell.h
//  Timebuy
//
//  Created by yuweize on 15/9/25.
//  Copyright (c) 2015年 com.CraftDream. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface cancelBigTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *time;
@property (strong, nonatomic) IBOutlet UILabel *workTime;
@property (strong, nonatomic) IBOutlet UILabel *money;
@property (strong, nonatomic) IBOutlet UILabel *content;
@property (strong, nonatomic) IBOutlet UIImageView *headImage;
@property (strong, nonatomic) IBOutlet UILabel *where;
@property (strong, nonatomic) IBOutlet UIImageView *showImage;
@property (strong, nonatomic) IBOutlet UIImageView *showImage2;
@property (strong, nonatomic) IBOutlet UILabel *zan;
@property (strong, nonatomic) IBOutlet UILabel *share;
@property (strong, nonatomic) IBOutlet UIButton *refaButton;
-(void)setData:(NSMutableDictionary *)cancelDic;
@end
