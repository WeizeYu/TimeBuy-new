//
//  waitingDetailViewController.m
//  Timebuy
//
//  Created by yuweize on 15/10/4.
//  Copyright (c) 2015年 com.CraftDream. All rights reserved.
//

#import "waitingDetailViewController.h"

@interface waitingDetailViewController ()

@property (strong, nonatomic) IBOutlet UIImageView *headImage;
@property (strong, nonatomic) IBOutlet UIButton *helpButton;
@property (strong, nonatomic) IBOutlet UIView *contentView;
@property (strong, nonatomic) IBOutlet UIView *biaoView;
@property (strong, nonatomic) IBOutlet UILabel *name;
@property (strong, nonatomic) IBOutlet UIImageView *sexImg;
@property (strong, nonatomic) IBOutlet UILabel *age;
@property (strong, nonatomic) IBOutlet UILabel *type;
@property (strong, nonatomic) IBOutlet UILabel *time;
@property (strong, nonatomic) IBOutlet UILabel *worktime;
@property (strong, nonatomic) IBOutlet UILabel *pay;
@property (strong, nonatomic) IBOutlet UILabel *content;
@property (strong, nonatomic) IBOutlet UIButton *where;
@property (strong, nonatomic) IBOutlet UILabel *howlong;
@property (strong, nonatomic) IBOutlet UIImageView *showImg;
@property (strong, nonatomic) IBOutlet UIImageView *showImg2;
@property (strong, nonatomic) IBOutlet UIImageView *showImg3;
@property (strong, nonatomic) IBOutlet UILabel *orderNumber;
@property (strong, nonatomic) IBOutlet UILabel *zan;
@property (strong, nonatomic) IBOutlet UILabel *fengxiang;
@property (strong, nonatomic) IBOutlet UILabel *biaoqian;

@end

@implementation waitingDetailViewController
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:NO];
    for (UIView *v in self.tabBarController.view.subviews) {
        if ([v isKindOfClass:[UIButton class]]) {
            v.hidden = YES;
        }
    }
    
    self.tabBarController.tabBar.hidden = YES;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"详情";
    self.headImage.layer.masksToBounds=true;
    [self.headImage.layer setCornerRadius:20];
    [self.helpButton.layer setCornerRadius:3];
    [self.contentView.layer setCornerRadius:3];
    [self.biaoView.layer setCornerRadius:8];
    // Do any additional setup after loading the view from its nib.
}
-(void)createData{
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
