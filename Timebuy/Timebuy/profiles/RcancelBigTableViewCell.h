//
//  RcancelBigTableViewCell.h
//  Timebuy
//
//  Created by yuweize on 15/10/10.
//  Copyright © 2015年 com.CraftDream. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RcancelBigTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *time;
@property (strong, nonatomic) IBOutlet UILabel *workTime;
@property (strong, nonatomic) IBOutlet UILabel *money;
@property (strong, nonatomic) IBOutlet UILabel *content;
@property (strong, nonatomic) IBOutlet UIImageView *headImage;
@property (strong, nonatomic) IBOutlet UILabel *where;
@property (strong, nonatomic) IBOutlet UIButton *pingfenButton;
@property (strong, nonatomic) IBOutlet UIView *rootView;
@property (strong, nonatomic) IBOutlet UIImageView *showImage;
@property (strong, nonatomic) IBOutlet UIImageView *showImage2;
-(void)setData:(NSMutableDictionary *)cancelDic;
@end
