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
    
    [myMapView addSubview:placeSearchBar];
    
    search = [[AMapSearchAPI alloc] init];
    search.delegate = self;
    
}

- (IBAction)cancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [POIArray count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 58.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSUInteger row=[indexPath row];
    NSString *CellTableIdentifier=[[NSString alloc]initWithFormat:@"extentedCell%lu-%lu",(unsigned long)indexPath.section,(unsigned long)row];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellTableIdentifier];
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellTableIdentifier];
        
    }
    
    AMapPOI *poi = (AMapPOI *)[POIArray objectAtIndex:indexPath.row];
    cell.textLabel.text = poi.name;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
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
    
    //[placeTableView reloadData];
    
}

#pragma mark - AMapSearchDelegate
- (void)onReGeocodeSearchDone:(AMapReGeocodeSearchRequest *)request response:(AMapReGeocodeSearchResponse *)response
{
    if(response.regeocode != nil)
    {
        //通过AMapReGeocodeSearchResponse对象处理搜索结果
        //NSString *result = [NSString stringWithFormat:@"ReGeocode: %@", response.regeocode.roads];
        //NSLog(@"ReGeo: %@", response.regeocode.pois);
        POIArray = response.regeocode.pois;
        for (AMapPOI *poi in response.regeocode.pois) {
            NSLog(@"%@",poi.name);
        }
        
    }
    
    [placeTableView reloadData];
    
}

#pragma mark - userLocation
-(void)mapView:(MAMapView *)mapView didUpdateUserLocation:(MAUserLocation *)userLocation
updatingLocation:(BOOL)updatingLocation
{
    if(updatingLocation)
    {
        //取出当前位置的坐标
        //NSLog(@"latitude : %f,longitude: %f",userLocation.coordinate.latitude,userLocation.coordinate.longitude);
        AMapReGeocodeSearchRequest *regeo = [[AMapReGeocodeSearchRequest alloc] init];
        regeo.location = [AMapGeoPoint locationWithLatitude:userLocation.coordinate.latitude longitude:userLocation.coordinate.longitude];
        regeo.radius = 800;
        regeo.requireExtension = YES;
        
        [search AMapReGoecodeSearch:regeo];
        
        //[placeTableView reloadData];
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
