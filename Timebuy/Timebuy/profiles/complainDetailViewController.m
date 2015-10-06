//
//  complainDetailViewController.m
//  Timebuy
//
//  Created by yuweize on 15/10/3.
//  Copyright (c) 2015年 com.CraftDream. All rights reserved.
//

#import "complainDetailViewController.h"

@interface complainDetailViewController ()

@end

@implementation complainDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"申诉";
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"确定" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = item;
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
