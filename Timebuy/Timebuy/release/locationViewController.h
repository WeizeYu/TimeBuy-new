//
//  locationViewController.h
//  Timebuy
//
//  Created by CraftDream on 15/9/23.
//  Copyright (c) 2015年 com.CraftDream. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AMapSearchKit/AMapSearchKit.h>
#import <MAMapKit/MAMapKit.h>

@interface locationViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,MAMapViewDelegate,AMapSearchDelegate>
{
    MAMapView * myMapView;
    AMapSearchAPI *search;
}

@property (strong, nonatomic) IBOutlet UISearchBar *placeSearchBar;
@property (strong, nonatomic) IBOutlet UIView *myView;
@property (strong, nonatomic) IBOutlet UITableView *placeTableView;

@property (strong, nonatomic) NSArray *POIArray;

- (IBAction)cancel:(id)sender;

@end
