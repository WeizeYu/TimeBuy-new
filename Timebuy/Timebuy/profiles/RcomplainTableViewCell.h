//
//  RcomplainTableViewCell.h
//  Timebuy
//
//  Created by yuweize on 15/10/10.
//  Copyright © 2015年 com.CraftDream. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RcomplainTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *dingdanNumber;
@property (strong, nonatomic) IBOutlet UILabel *content;
@property (strong, nonatomic) IBOutlet UILabel *where;
@property (strong, nonatomic) IBOutlet UIButton *cancelButton;
@property (strong, nonatomic) IBOutlet UIView *rootView;
-(void)setData:(NSMutableDictionary *)complainDic;
@end
