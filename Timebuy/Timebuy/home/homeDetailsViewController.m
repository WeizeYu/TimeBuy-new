//
//  homeDetailsViewController.m
//  Timebuy
//
//  Created by CraftDream on 15/9/22.
//  Copyright (c) 2015年 com.CraftDream. All rights reserved.
//

#import "homeDetailsViewController.h"

@interface homeDetailsViewController ()

@end

@implementation homeDetailsViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    
    for (UIView *v in self.tabBarController.view.subviews) {
        if ([v isKindOfClass:[UIButton class]]) {
            v.hidden = YES;
        }
    }
    
    self.tabBarController.tabBar.hidden = YES;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationController.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,[UIFont systemFontOfSize:24.0f], NSFontAttributeName, nil];
    self.navigationItem.title = @"详情";
    
    //自定义返回按钮
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"箭头9x17px"] style:UIBarButtonItemStylePlain target:self action:@selector(back:)];
    self.navigationItem.leftBarButtonItem  = backButton;
}

- (void)back:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
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
