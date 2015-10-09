//
//  doneDetailViewController.m
//  Timebuy
//
//  Created by yuweize on 15/10/4.
//  Copyright (c) 2015年 com.CraftDream. All rights reserved.
//

#import "doneDetailViewController.h"

@interface doneDetailViewController ()
@property (strong, nonatomic) IBOutlet UILabel *faname;
@property (strong, nonatomic) IBOutlet UIImageView *fasexImage;
@property (strong, nonatomic) IBOutlet UILabel *faage;
@property (strong, nonatomic) IBOutlet UILabel *faType;
@property (strong, nonatomic) IBOutlet UILabel *time;
@property (strong, nonatomic) IBOutlet UILabel *worktime;
@property (strong, nonatomic) IBOutlet UILabel *pay;
@property (strong, nonatomic) IBOutlet UILabel *content;
@property (strong, nonatomic) IBOutlet UILabel *howlong;
@property (strong, nonatomic) IBOutlet UIButton *where;
@property (strong, nonatomic) IBOutlet UIImageView *showImage2;
@property (strong, nonatomic) IBOutlet UIImageView *showImage3;
@property (strong, nonatomic) IBOutlet UIImageView *showImage1;
@property (strong, nonatomic) IBOutlet UILabel *orderNumber;
@property (strong, nonatomic) IBOutlet UILabel *biaoqian;
@property (strong, nonatomic) IBOutlet UIImageView *faheaderImage;
@property (strong, nonatomic) IBOutlet UIImageView *jieheaderImage;
@property (strong, nonatomic) IBOutlet UILabel *jieName;
@property (strong, nonatomic) IBOutlet UIImageView *jieSexImage;
@property (strong, nonatomic) IBOutlet UILabel *jieAge;
@property (strong, nonatomic) IBOutlet UILabel *jieType;
@property (strong, nonatomic) IBOutlet UILabel *jiePhoneNumber;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
#pragma ----------------------设圆角--------------------------------
@property (strong, nonatomic) IBOutlet UIButton *doneButton;
@property (strong, nonatomic) IBOutlet UIView *contentView;
@property (strong, nonatomic) IBOutlet UIView *biaoView;
@end

@implementation doneDetailViewController
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
    self.faheaderImage.layer.masksToBounds=true;
    [self.faheaderImage.layer setCornerRadius:20];
    self.jieheaderImage.layer.masksToBounds=true;
    [self.jieheaderImage.layer setCornerRadius:13];
    [self.doneButton.layer setCornerRadius:3];
    [self.doneButton.layer setBorderWidth:1];
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGColorRef colorref = CGColorCreate(colorSpace,(CGFloat[]){ 1, 153.f/255, 0, 1 });
    [_doneButton.layer setBorderColor:colorref];//边框颜色

    [self.contentView.layer setCornerRadius:3];
    [self.biaoView.layer setCornerRadius:8];
    //设置滚动
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.scrollView.contentSize=CGSizeMake(375,850);

    // Do any additional setup after loading the view from its nib.
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
