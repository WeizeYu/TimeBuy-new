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
#import "userConfiguration.h"

#import "homeMainViewController.h"
#import "findingsMainViewController.h"
#import "newsRootViewController.h"
#import "profilesRootViewController.h"
#import "locationViewController.h"
#import "releaseRootViewController.h"
#import "loginViewController.h"

@interface myTabBarViewController : UITabBarController <UITabBarControllerDelegate,UIAlertViewDelegate>
{
    UIViewController *vc3;
    
    NSString *getState;
    NSString *getLocationName;
    AMapGeoPoint *location;
}

@property (strong, nonatomic) UITabBar *myTabBar;
@property (strong, nonatomic) UIButton *button;


@end
