//
//  CommentController.m
//  Timebuy
//
//  Created by He yang on 15/10/17.
//  Copyright © 2015年 com.CraftDream. All rights reserved.
//

#import "CommentController.h"

@interface CommentController ()

@end

@implementation CommentController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"给ta评价";

    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)speedBtn1Click:(id)sender {
    self.speenBtn1.selected = YES;
    self.speedScore = @"1";
    for (id obj in self.view.subviews) {
        if ([obj isKindOfClass:[UIButton class]]) {
            UIButton *btn = obj;
            if (btn.tag != 1 && btn.tag <= 5) {
                btn.selected = NO;
            }
        }
    }
}

- (IBAction)speedBtn2Click:(id)sender {
    self.speedScore = @"2";
    for (id obj in self.view.subviews) {
        if ([obj isKindOfClass:[UIButton class]]) {
            UIButton *btn = obj;
            if (btn.tag > 2 && btn.tag <= 5) {
                btn.selected = NO;
            }else if (btn.tag <= 2){
                btn.selected = YES;
            }
        }
    }

    
}
- (IBAction)speedBtn3Click:(id)sender {
    self.speedScore = @"3";
    for (id obj in self.view.subviews) {
        if ([obj isKindOfClass:[UIButton class]]) {
            UIButton *btn = obj;
            if (btn.tag > 3 && btn.tag <= 5) {
                btn.selected = NO;
            }else if (btn.tag <= 3){
                btn.selected = YES;
            }
        }
    }

}
- (IBAction)speedBtn4Click:(id)sender {
    self.speedScore = @"4";
    for (id obj in self.view.subviews) {
        if ([obj isKindOfClass:[UIButton class]]) {
            UIButton *btn = obj;
            if (btn.tag > 4 && btn.tag <= 5) {
                btn.selected = NO;
            }else if (btn.tag <= 4){
                btn.selected = YES;
            }
        }
    }
}
- (IBAction)speedBtn5Click:(id)sender {
    self.speedScore = @"5";
    for (id obj in self.view.subviews) {
        if ([obj isKindOfClass:[UIButton class]]) {
            UIButton *btn = obj;
            if (btn.tag <= 5) {
                btn.selected = YES;
            }
        }
    }
}

- (IBAction)qualityBtn1Click:(id)sender {
    self.qualityBtn1.selected = YES;
    self.qualityScore = @"1";
    for (id obj in self.view.subviews) {
        if ([obj isKindOfClass:[UIButton class]]) {
            UIButton *btn = obj;
            if (btn.tag > 6) {
                btn.selected = NO;
            }
        }
    }
    
}
- (IBAction)qualityBtn2Click:(id)sender {
    self.qualityScore = @"2";
    for (id obj in self.view.subviews) {
        if ([obj isKindOfClass:[UIButton class]]) {
            UIButton *btn = obj;
            if (btn.tag >7) {
                btn.selected = NO;
            }else if (btn.tag <= 7 && btn.tag >= 6){
                btn.selected = YES;
            }
        }
    }
}
- (IBAction)qualityBtn3Click:(id)sender {
    self.qualityScore = @"3";
    for (id obj in self.view.subviews) {
        if ([obj isKindOfClass:[UIButton class]]) {
            UIButton *btn = obj;
            if (btn.tag > 8) {
                btn.selected = NO;
            }else if (btn.tag <= 8 && btn.tag >= 6){
                btn.selected = YES;
            }
        }
    }
}
- (IBAction)qualityBtn4Click:(id)sender {
    self.qualityScore = @"4";
    for (id obj in self.view.subviews) {
        if ([obj isKindOfClass:[UIButton class]]) {
            UIButton *btn = obj;
            if (btn.tag > 9) {
                btn.selected = NO;
            }else if (btn.tag <= 9 && btn.tag >= 6){
                btn.selected = YES;
            }
        }
    }
}
- (IBAction)qualityBtn5Click:(id)sender {
    self.qualityScore = @"5";
    for (id obj in self.view.subviews) {
        if ([obj isKindOfClass:[UIButton class]]) {
            UIButton *btn = obj;
            if (btn.tag >= 6) {
                btn.selected = YES;
            }
        }
    }
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
