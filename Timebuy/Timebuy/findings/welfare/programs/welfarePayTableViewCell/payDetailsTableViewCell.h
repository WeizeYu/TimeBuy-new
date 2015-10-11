//
//  programDetailsTableViewCell.h
//  Timebuy
//
//  Created by Mr.OJ on 15/10/9.
//  Copyright © 2015年 com.CraftDream. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CACustomTextLayer.h"

@interface payDetailsTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIView *numberView;
@property (strong, nonatomic) CACustomTextLayer *textLayer;
@property NSInteger endNumber;
@end
