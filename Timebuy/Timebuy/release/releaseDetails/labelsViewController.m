//
//  labelsViewController.m
//  Timebuy
//
//  Created by CraftDream on 15/9/26.
//  Copyright (c) 2015年 com.CraftDream. All rights reserved.
//

#import "labelsViewController.h"

@interface labelsViewController ()

@end

@implementation labelsViewController

@synthesize confirmButton;
@synthesize choosedButton1,choosedButton2;
@synthesize candidateButton1,candidateButton2,candidateButton3,candidateButton4;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)cancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)save:(id)sender {
    
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
