//
//  labelsViewController.h
//  Timebuy
//
//  Created by CraftDream on 15/9/26.
//  Copyright (c) 2015年 com.CraftDream. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface labelsViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIButton *confirmButton;
@property (strong, nonatomic) IBOutlet UIButton *choosedButton1;
@property (strong, nonatomic) IBOutlet UIButton *choosedButton2;

@property (strong, nonatomic) IBOutlet UIButton *candidateButton1;
@property (strong, nonatomic) IBOutlet UIButton *candidateButton2;
@property (strong, nonatomic) IBOutlet UIButton *candidateButton3;
@property (strong, nonatomic) IBOutlet UIButton *candidateButton4;


- (IBAction)cancel:(id)sender;
- (IBAction)save:(id)sender;

- (IBAction)button1Event:(id)sender;
- (IBAction)button2Event:(id)sender;
- (IBAction)button3Event:(id)sender;
- (IBAction)button4Event:(id)sender;

@end
