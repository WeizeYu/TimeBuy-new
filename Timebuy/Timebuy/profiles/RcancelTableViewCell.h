//
//  RcancelTableViewCell.h
//  Timebuy
//
//  Created by yuweize on 15/10/10.
//  Copyright © 2015年 com.CraftDream. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RcancelTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *time;
@property (strong, nonatomic) IBOutlet UILabel *workTime;
@property (strong, nonatomic) IBOutlet UILabel *money;
@property (strong, nonatomic) IBOutlet UILabel *content;
@property (strong, nonatomic) IBOutlet UIImageView *headImage;
@property (strong, nonatomic) IBOutlet UILabel *where;
@property (strong, nonatomic) IBOutlet UIButton *pingfenButton;
@property (strong, nonatomic) IBOutlet UIView *rootView;
-(void)setData:(NSMutableDictionary *)cancelDic;
@end
