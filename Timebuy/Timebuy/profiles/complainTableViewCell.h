//
//  complainTableViewCell.h
//  Timebuy
//
//  Created by yuweize on 15/9/25.
//  Copyright (c) 2015年 com.CraftDream. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface complainTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *time;
@property (strong, nonatomic) IBOutlet UILabel *content;
@property (strong, nonatomic) IBOutlet UILabel *where;
@property (strong, nonatomic) IBOutlet UIButton *commitButton;
@property (strong, nonatomic) IBOutlet UIView *rootView;
-(void)setData:(NSMutableDictionary *)complainDic;
@end
