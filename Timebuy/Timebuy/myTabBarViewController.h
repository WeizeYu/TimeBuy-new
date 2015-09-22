//
//  myTabBarViewController.h
//  Timebuy
//
//  Created by CraftDream on 15/9/21.
//  Copyright (c) 2015年 com.CraftDream. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MAMapKit/MAMapKit.h>
#import "AFNetworking.h"
#import "homeRootViewController.h"
#import "findingsRootViewController.h"
#import "newsRootViewController.h"
#import "profilesRootViewController.h"

@interface myTabBarViewController : UITabBarController <UITabBarControllerDelegate>
{
    UIViewController *vc3;
}

@property (strong, nonatomic) UITabBar *myTabBar;
@property (strong, nonatomic) UIButton *button;


@end
