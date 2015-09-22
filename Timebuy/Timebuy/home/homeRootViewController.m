//
//  homeRootViewController.m
//  Timebuy
//
//  Created by CraftDream on 15/9/22.
//  Copyright (c) 2015年 com.CraftDream. All rights reserved.
//

#import "homeRootViewController.h"

@interface homeRootViewController ()

@end

@implementation homeRootViewController

@synthesize button;

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    
    for (UIView *v in self.tabBarController.view.subviews) {
        if ([v isKindOfClass:[UIButton class]]) {
            v.hidden = NO;
        }
    }
    
    self.tabBarController.tabBar.hidden = NO;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UIBarButtonItem *registerButton = [[UIBarButtonItem alloc] initWithTitle:@"进入" style:UIBarButtonItemStylePlain target:self action:@selector(enter:)];
    self.navigationItem.rightBarButtonItem = registerButton;
    //self.navigationItem.rightBarButtonItem.enabled = NO;
    
}

- (void)enter:(id)sender {
    homeDetailsViewController *homeDetailsVC = [[homeDetailsViewController alloc] init];
    self.tabBarController.tabBar.hidden = YES;
    [self.navigationController pushViewController:homeDetailsVC animated:YES];
    //隐藏中间的button
    for (UIView *v in self.tabBarController.view.subviews) {
        if ([v isKindOfClass:[UIButton class]]) {
            v.hidden = YES;
        }
    }

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
