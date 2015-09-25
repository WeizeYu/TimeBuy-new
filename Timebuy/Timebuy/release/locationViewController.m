//
//  locationViewController.m
//  Timebuy
//
//  Created by CraftDream on 15/9/23.
//  Copyright (c) 2015年 com.CraftDream. All rights reserved.
//

#import "locationViewController.h"

@interface locationViewController ()

@end

@implementation locationViewController

@synthesize placeSearchBar;
@synthesize myView;
@synthesize placeTableView;
@synthesize POIArray;
@synthesize tipsResultArray;
@synthesize searchPlaceTableView;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    POIArray = [[NSArray alloc] init];
    
    [MAMapServices sharedServices].apiKey = @"e30b4de94fe3d4d91394da807c581b4b";
    [AMapSearchServices sharedServices].apiKey = @"e30b4de94fe3d4d91394da807c581b4b";
    
    myMapView = [[MAMapView alloc] initWithFrame:CGRectMake(0, 0, myView.bounds.size.width, myView.bounds.size.height)];
    myMapView.delegate = self;
    myMapView.showsCompass = NO;
    myMapView.showsScale = NO;
    myMapView.showsUserLocation = YES;
    [myMapView setUserTrackingMode:MAUserTrackingModeNone animated:YES];
    
    [myView addSubview:myMapView];
    myView.backgroundColor = [UIColor blueColor];
    
    UIImageView *locationImgView = [[UIImageView alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width / 2 - 38 / 2, myMapView.center.y - 38, 38, 38)];
    locationImgView.image = [UIImage imageNamed:@"location1"];
    [myMapView addSubview:locationImgView];
    
    //[placeSearchBar setBarTintColor:[UIColor clearColor]];
    [[[[placeSearchBar.subviews objectAtIndex:0] subviews] objectAtIndex:0] removeFromSuperview];
    [placeSearchBar setBackgroundColor:[UIColor clearColor]];
    placeSearchBar.delegate = self;
    [myMapView addSubview:placeSearchBar];
    
    search = [[AMapSearchAPI alloc] init];
    search.delegate = self;
    
    isFirst = 0;
    
    shadowView = [[UIView alloc] initWithFrame:CGRectMake(0, 64 + placeSearchBar.bounds.size.height, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - (64 + placeSearchBar.bounds.size.height))];
    shadowView.backgroundColor = [UIColor blackColor];
    shadowView.alpha = 0.3f;
    [self.view addSubview:shadowView];
    shadowView.hidden = YES;
    
    _tapGr = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTapped:)];
    _tapGr.cancelsTouchesInView = NO;
    _tapGr.numberOfTapsRequired = 1;
    _tapGr.delegate = self;
    [shadowView addGestureRecognizer:_tapGr];
    
    searchPlaceTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64 + placeSearchBar.bounds.size.height, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - (64 + placeSearchBar.bounds.size.height))];
    searchPlaceTableView.delegate = self;
    searchPlaceTableView.dataSource = self;
    [self.view addSubview:searchPlaceTableView];
    searchPlaceTableView.hidden = YES;
    }

- (IBAction)cancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
#pragma mark - UISearchBarDelegate
- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    NSLog(@"begin");
    
    //searchPlaceTableView.hidden = NO;
    shadowView.hidden = NO;
    
    [placeSearchBar setTintColor:[UIColor whiteColor]];
    [placeSearchBar setBackgroundColor:[UIColor whiteColor]];
}

- (BOOL)searchBar:(UISearchBar *)searchBar shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    searchPlaceTableView.hidden = NO;
    
    searchStr = searchBar.text;
    searchStr = [searchStr stringByReplacingCharactersInRange:range withString:text];
    
    NSLog(@"searchStr = %@", searchStr);
    
    if ([searchStr isEqualToString:@""]) {
        searchBar.text = @"";
        searchPlaceTableView.hidden = YES;
    } else {
        AMapInputTipsSearchRequest *tipsRequest = [[AMapInputTipsSearchRequest alloc] init];
        tipsRequest.keywords = searchStr;
        tipsRequest.city = localCity;
        
        [search AMapInputTipsSearch:tipsRequest];
    }
    
    return YES;
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    NSLog(@"enter");
    [searchBar resignFirstResponder];

    searchPlaceTableView.hidden = YES;
    shadowView.hidden = YES;
    
    //[[[[placeSearchBar.subviews objectAtIndex:0] subviews] objectAtIndex:0] removeFromSuperview];
    [placeSearchBar setBackgroundColor:[UIColor clearColor]];
    
    AMapInputTipsSearchRequest *tipsRequest = [[AMapInputTipsSearchRequest alloc] init];
    tipsRequest.keywords = searchBar.text;
    tipsRequest.city = localCity;
    
    [search AMapInputTipsSearch:tipsRequest];
    
}

//点击空白处收起键盘
-(void)viewTapped:(UITapGestureRecognizer*)tapGr
{
    [placeSearchBar resignFirstResponder];
    
    placeSearchBar.text = @"";
    
    searchPlaceTableView.hidden = YES;
    shadowView.hidden = YES;
    
    [placeSearchBar setBackgroundColor:[UIColor clearColor]];
    
}

#pragma mark - UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (searchPlaceTableView.hidden == YES) {
        NSLog(@"place table view");
        return [POIArray count];
    } else {
        NSLog(@"search place table view");
        return [tipsResultArray count];
    }
    }

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 58.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (searchPlaceTableView.hidden == YES) {
        return 50.0f;
    } else {
        return 1.0f;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSUInteger row=[indexPath row];
    NSString *CellTableIdentifier=[[NSString alloc]initWithFormat:@"extentedCell%lu-%lu",(unsigned long)indexPath.section,(unsigned long)row];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellTableIdentifier];
    
    if (searchPlaceTableView.hidden == YES) {
        if (cell == nil) {
            
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellTableIdentifier];
            
        }
        
        AMapPOI *poi = (AMapPOI *)[POIArray objectAtIndex:indexPath.row];
        
        cell.imageView.image = [UIImage imageNamed:@"location2"];
        cell.textLabel.text = poi.name;
        cell.detailTextLabel.text = poi.address;
    } else {
        if (cell == nil) {
            
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellTableIdentifier];
            
        }
        
        AMapTip *tip = (AMapTip *)[tipsResultArray objectAtIndex:indexPath.row];
        
        cell.textLabel.text = tip.name;
        cell.detailTextLabel.text = tip.district;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [placeSearchBar resignFirstResponder];
}

#pragma mark - MAMapViewDelegate
- (void)mapView:(MAMapView *)mapView regionDidChangeAnimated:(BOOL)animated
{
    NSLog(@"latitude : %f, longtitude : %f",mapView.centerCoordinate.latitude,mapView.centerCoordinate.longitude);
    //NSLog(@"%f,%f",mapView.center.x,mapView.center.y);
    
    AMapReGeocodeSearchRequest *regeo = [[AMapReGeocodeSearchRequest alloc] init];
    regeo.location = [AMapGeoPoint locationWithLatitude:mapView.centerCoordinate.latitude longitude:mapView.centerCoordinate.longitude];
    regeo.radius = 800;
    regeo.requireExtension = YES;
    
    [search AMapReGoecodeSearch:regeo];
}

#pragma mark - AMapSearchDelegate
- (void)onReGeocodeSearchDone:(AMapReGeocodeSearchRequest *)request response:(AMapReGeocodeSearchResponse *)response
{
    if(response.regeocode != nil)
    {
        //通过AMapReGeocodeSearchResponse对象处理搜索结果

        POIArray = response.regeocode.pois;
        
        localCity = response.regeocode.addressComponent.city;
        
    }
    
    [placeTableView reloadData];
    
}
-(void)onInputTipsSearchDone:(AMapInputTipsSearchRequest*)request response:(AMapInputTipsSearchResponse *)response
{
    tipsResultArray = [[NSArray alloc] init];
    
    tipsResultArray = response.tips;
    
    [searchPlaceTableView reloadData];
}
#pragma mark - userLocation
-(void)mapView:(MAMapView *)mapView didUpdateUserLocation:(MAUserLocation *)userLocation
updatingLocation:(BOOL)updatingLocation
{
    if(updatingLocation && isFirst == 0)
    {
        //取出当前位置的坐标
        //NSLog(@"latitude : %f,longitude: %f",userLocation.coordinate.latitude,userLocation.coordinate.longitude);
        AMapReGeocodeSearchRequest *regeo = [[AMapReGeocodeSearchRequest alloc] init];
        regeo.location = [AMapGeoPoint locationWithLatitude:userLocation.coordinate.latitude longitude:userLocation.coordinate.longitude];
        regeo.radius = 800;
        regeo.requireExtension = YES;
        
        [search AMapReGoecodeSearch:regeo];
        
        //[placeTableView reloadData];
        isFirst = 1;
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
