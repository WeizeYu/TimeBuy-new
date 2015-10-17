//
//  CommentController.h
//  Timebuy
//
//  Created by He yang on 15/10/17.
//  Copyright © 2015年 com.CraftDream. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CommentController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *speenBtn1;
@property (weak, nonatomic) IBOutlet UIButton *speedBtn2;
@property (weak, nonatomic) IBOutlet UIButton *speedBtn3;
@property (weak, nonatomic) IBOutlet UIButton *speedBtn4;
@property (weak, nonatomic) IBOutlet UIButton *speedBtn5;
@property (weak, nonatomic) IBOutlet UIButton *qualityBtn1;
@property (weak, nonatomic) IBOutlet UIButton *qualityBtn2;
@property (weak, nonatomic) IBOutlet UIButton *qualityBtn3;
@property (weak, nonatomic) IBOutlet UIButton *qualityBtn4;
@property (weak, nonatomic) IBOutlet UIButton *qualityBtn5;
@property(nonatomic,copy)NSString *speedScore;
@property(nonatomic,copy)NSString *qualityScore;
@end
