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


@interface locationViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,MAMapViewDelegate,AMapSearchDelegate,UISearchBarDelegate,UIGestureRecognizerDelegate>
{
    MAMapView * myMapView;
    AMapSearchAPI *search;
    
    UIView *shadowView;
    
    NSInteger isFirst;
    
    NSString *localCity;
    
    NSString *searchStr;
    
    UITapGestureRecognizer *_tapGr;
}

@property (strong, nonatomic) IBOutlet UISearchBar *placeSearchBar;
@property (strong, nonatomic) IBOutlet UIView *myView;
@property (strong, nonatomic) IBOutlet UITableView *placeTableView;
@property (strong, nonatomic) UITableView *searchPlaceTableView;

@property (strong, nonatomic) NSArray *POIArray;
@property (strong, nonatomic) NSArray *tipsResultArray;

- (IBAction)cancel:(id)sender;

@end
